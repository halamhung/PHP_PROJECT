<?php
require_once 'MyController.php';
require_once "./mvc/core/redirect.php";
class cart extends controller{
    function __construct(){
        $this->ProductModels       = $this->models('ProductModels');
        $this->OrderDetailModels   = $this->models('OrderDetailModels');
        $this->OrderModels         = $this->models('OrderModels');
        $this->MyController        = new MyController();
        $this->SendMail            =  $this->helper('SendMail');
        // 
         $this->Jwtoken            =  $this->helper('Jwtoken');
        $this->Authorzation        =  $this->helper('Authorzation');
    }
    function index(){
        $data_index = $this->MyController->indexCustomers();
        $data = [
            'page'          => 'product/cart',
            'title'         => 'Giỏ hàng',
            'data_index'    => $data_index
        ];
       $this->viewFrontEnd('frontend/masterlayout', $data);
    }
    function update(){
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $data = $this->ProductModels->select_row('*',['slug' => $_POST['slug']]);
            if (isset($_SESSION['cart'][$data['id']])) {
                $qty = $_SESSION['cart'][$data['id']]['qty'];
                $array = [
                    'productID' => $data['id'],
                    'name'      => $data['name'],
                    'slug'      => $data['slug'],
                    'image'     => $data['image'],
                    'price'     => $data['price'],
                    'qty'       => 1
                ];
                $cart = $this->cart($array);
                echo json_encode(array_values($cart));
            }
        }
       
    }
    function deleteproduct(){
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $data = $this->ProductModels->select_row('*',['slug' => $_POST['slug']]);
            if (isset($_SESSION['cart'][$data['id']])) {
                $qty = $_SESSION['cart'][$data['id']]['qty'];
                $array = [
                    'productID' => $data['id'],
                    'name'      => $data['name'],
                    'slug'      => $data['slug'],
                    'image'     => $data['image'],
                    'price'     => $data['price'],
                    'qty'       => -1
                ];
                $cart = $this->cart($array);
               
            }
            echo json_encode(array_values($_SESSION['cart']));
        }
    }
    function deleteBlockProduct(){
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $data = $this->ProductModels->select_row('*',['slug' => $_POST['slug']]);
            if (isset($_SESSION['cart'][$data['id']])) {
                $qty = $_SESSION['cart'][$data['id']]['qty'];
                unset($_SESSION['cart'][$data['id']]);
               
            }
            echo json_encode(array_values($_SESSION['cart']));
        }
    }
     function deleteProductById(){
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $data = $this->ProductModels->select_row('*',['id' => $_POST['id']]);
            if (isset($_SESSION['cart'][$_POST['id']])) {
                unset($_SESSION['cart'][$_POST['id']]);
            }
            echo json_encode(array_values($_SESSION['cart']));
        }
    }

    
     function payment(){
          if (isset($_SESSION['user'])){
            $verify = $this->Jwtoken->decodeToken($_SESSION['user'],KEYS);
            if ($verify != NULL && $verify != 0) {
                $auth = $this->Authorzation->checkAuthUser($verify);
                if (!$auth) {
                   $redirect = new redirect('auth/signin');
                }
            }
        }
        else{
            $redirect = new redirect('auth/signin');
        }
        if ($_SERVER['REQUEST_METHOD'] == "POST") {
            $data_post = $_POST['data_post'];
            $total = 0;
            foreach ($this->MyController->getCart() as $key => $value) {
                $total += $value['price'] * $value['qty'];
            }
            $arrayOrders = [
                'accountId'     => $this->MyController->getUsers()['id'],
                'address'       => $data_post['address'],
                'phone'         => $data_post['phone'],
                'email'         => $data_post['email'],
                'note'          => $data_post['note'],
                'total'         => $total,
                'created_at'    => gmdate('Y-m-d H:i:s', time() + 7*3600)
            ];
            $orderAdd = $this->OrderModels->add($arrayOrders);
            $resultsOrders = json_decode($orderAdd, true);
            if($resultsOrders['type'] ==='sucessFully'){
                $arrayOrderDetail = [];
                $contents = '';
                $contents .= '<h3>Sản Phẩm đã đặt:</h3></br>';
            
                // Create the invoice table header
                $contents .= '<table border="0" style="border: 1.2px solid #c6c6c6 !important; border-spacing: 2px; width: auto !important;">
                                <thead>
                                    <tr>
                                        <th style="border: 1.2px solid #c6c6c6 !important; padding: 2px !important;">Tên sản phẩm</th>
                                        <th style="border: 1.2px solid #c6c6c6 !important; padding: 2px !important;">Số lượng</th>
                                        <th style="border: 1.2px solid #c6c6c6 !important; padding: 2px !important;">Đơn giá</th>
                                    </tr>
                                </thead>
                                <tbody>';
            
                // Add each product to the invoice table
                foreach ($this->MyController->getCart() as $key => $value) {
                    array_push($arrayOrderDetail, [
                        'orderId'  => $resultsOrders['id'],
                        'productId' => $value['productID'],
                        'price'   => $value['price'],
                        'qty'    => $value['qty']
                    ]);
            
                    $contents .= '
                                    <tr>
                                        <td style="border: 1.2px solid #c6c6c6 !important; padding: 2px !important;">'.$value['name'].'</td>
                                        <td style="border: 1.2px solid #c6c6c6 !important; padding: 2px !important;text-align: center;">'.$value['qty'].'</td>
                                        <td style="border: 1.2px solid #c6c6c6 !important; padding: 2px !important;">'.number_format($value['price']).'đ</td>
                                    </tr>
                                    ';
                }
            
                // Add the total to the invoice table footer
                $contents .= '
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="2" style="border: 1.2px solid #c6c6c6 !important; padding: 2px !important;font-weight: bold;">Tổng hóa đơn:</td>
                                        <td style="border: 1.2px solid #c6c6c6 !important; padding: 2px !important;font-weight: bold;">'.number_format($total).'đ</td>
                                    </tr>
                                </tfoot>
                            </table>';
                $contents .= '<p>Cảm ơn khách hàng đã tin tưởng đặt hàng ở shop tôi, chúng tôi sẽ liên hệ trong thời gian sớm nhất.</p>';
                
                $this->OrderDetailModels->addMultiple($arrayOrderDetail);
                $mail = $this->SendMail->send('Order',$data_post['email'], $contents, 'hungdeptrai111@gmail.com');
                unset($_SESSION['cart']);
                if($mail){
                    $redirect = new redirect('/');
                    $redirect->setFlash('flash', 'Đặt hàng thành công!');
                }
            }
        }
        $data_index = $this->MyController->indexCustomers();
        $data = [
            'page'          => 'product/payment',
            'data_index'    => $data_index,
             'title'        => 'Thanh toán',
        ];
        $this->viewFrontEnd('frontend/masterlayout', $data);
    }
}