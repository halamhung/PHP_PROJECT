<?php 
require_once 'MyController.php';
require_once "./mvc/core/redirect.php";

class home extends controller
{
    public $ProductModels;
    function __construct(){
        $this->ProductModels        =  $this->models('ProductModels');
        $this->ContactModels        =  $this->models('ContactModels');
        // 
        $this->MyController = new MyController();
        $this->SendMail            =  $this->helper('SendMail');
    }
    public function index()
    {
        $data_index = $this->MyController->indexCustomers();
        $product = $this->ProductModels->select_array('*',['publish' => 1],'id desc');
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $email = $_POST['email'];
            $arrayAdd = [
                'email'         => $email,
                'created_at'    => gmdate('Y-m-d H:i:s', time() + 7*3600)
            ];
            $this->ContactModels->add($arrayAdd);
            $mail = $this->SendMail->send('Nhận thông tin sản phẩm',$email, 'Đây là nội dung', 'zzskillzzzz@gmail.com');
            if($email){
                $redirect = new redirect('/');
                $redirect->setFlash('flash', 'Gửi mail nhận thông tin thành công!');
            }
        }
        $data = [
            'page'          => 'home/index',
            'product'       => $product,
            'data_index'    => $data_index,
            'title'        => 'Trang chủ'
        ];
       $this->viewFrontEnd('frontend/masterlayout',$data);
    }
    function detail($slug){
       $data = $this->ProductModels->select_row('*',['slug' => $slug]);
       if ($data != NULL)
       {
            $cart = $this->cart($data);
       }
    }
    function addtocart(){
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $product = $this->ProductModels->select_row('*',['slug' => trim($_POST['slug'])]);
            $array = [
                'productID' => $product['id'],
                'name'      => $product['name'],
                'slug'      => $product['slug'],
                'image'     => $product['image'],
                'price'     => $product['price'],
                'qty'       => $_POST['qty'] ? $_POST['qty'] : 1,
            ];
            $cart = $this->cart($array);
            echo json_encode([
                'code'  => 200,
                'data'  => array_values($cart)
            ]);
        }
    }
}