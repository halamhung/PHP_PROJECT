<?php 
require_once "./mvc/core/redirect.php";
require_once "./mvc/controllers/MyController.php";
class order extends controller{

    var $template = 'cpanel/order';
    var $title = 'đơn hàng';
    const type = 2;
    const limit = 10;
    function __construct(){
        $this->AdminModels          =  $this->models('AdminModels');
        $this->OrderModels          =  $this->models('OrderModels');
        $this->OrderDetailModels          =  $this->models('OrderDetailModels');
        $this->MyController         = new MyController();
        // load helper
        $this->Jwtoken              =  $this->helper('Jwtoken');
        $this->Authorzation         =  $this->helper('Authorzation');
        // 
        $this->Functions            =  $this->helper('Functions');
    }
    function index(){
        //  ======================
        if (isset($_SESSION['admin'])){
            $verify = $this->Jwtoken->decodeToken($_SESSION['admin'],KEYS);
            if ($verify != NULL && $verify != 0) {
                $auth = $this->Authorzation->checkAuth($verify);
                if ($auth != true) {
                    $redirect = new redirect('cpanel/auth/index');
                }
            }
            else{
                $redirect = new redirect('cpanel/auth/index');
            }
        }
        else{
            $redirect = new redirect('cpanel/auth/index');
        }
        $data_admin = $this->MyController->getIndexAdmin();
        
      
        $rows = $this->OrderModels->select_array('*');
        // 30 sản phẩm total_rows = 30
        // mỗi trang sẽ chứa 1 sản phẩm limit = 1
        // 30 / 1 => 30 trang total_rows / limit
        $limit = self::limit;
        $page = 1;
        $total_rows = count($rows);
        $total_page = ceil($total_rows / $limit);
        $start = ($page - 1) * $limit;
        $datas = [];
        if ($total_rows > 0) {
            $datas = $this->OrderModels->select_array_join_table('tbl_orders.*, tbl_accounts.name as name',NULL,'id desc',
            $start,$limit,
            'tbl_accounts','tbl_accounts.id = tbl_orders.accountId','LEFT'
           );
        }
        $button_pagination = $this->Functions->pagination($total_page,$page);
     
        // ======================
        $data = [
            'data_admin'        => $data_admin,
            'page'              => $this->template.'/index',
            'title'             => 'Danh sách '.$this->title,
            'template'          => $this->template,
            'datas'             => $datas,
            'button_pagination' => $button_pagination,
            'checkStatus'       => $this->Functions
        ];
        $this->view('cpanel/masterlayout',$data);
    }
     function pagination_page(){
        $rows = $this->OrderModels->select_array('*');
        // 30 sản phẩm total_rows = 30
        // mỗi trang sẽ chứa 1 sản phẩm limit = 1
        // 30 / 1 => 30 trang total_rows / limit
        $limit = self::limit;
        $page = $_POST['page']?$_POST['page']:1;
        $total_rows = count($rows);
        $total_page = ceil($total_rows / $limit);
        $start = ($page - 1) * $limit;
        if ($total_rows > 0) {
            $datas = $this->OrderModels->select_array_join_table('tbl_orders.*, tbl_accounts.name as name',NULL,'id desc',
            $start,$limit,
            'tbl_accounts','tbl_accounts.id = tbl_orders.accountId','LEFT'
           );
        }
        $button_pagination = $this->Functions->pagination($total_page,$page);
        $data = [
            'template'          => $this->template,
            'datas'             => $datas,
            'button_pagination' => $button_pagination
        ];
        $this->view('cpanel/order/loadTable', $data);
    }
    function detail($id){
          $data_admin = $this->MyController->getIndexAdmin();
          $datas = $this->OrderModels->select_array_join_multi_table('tbl_orders.*, tbl_order_detail.productId as productId,tbl_order_detail.qty as qty ,tbl_product.name as productName, tbl_product.price as price',['tbl_orders.id' => $id],'tbl_order_detail.id desc',
            NULL,NULL,
             [
                ['tbl_order_detail','tbl_orders.id = tbl_order_detail.orderId','LEFT'],
                ['tbl_product','tbl_product.id = tbl_order_detail.productId','LEFT'],
             ]);
        if($datas == NULL){
             $redirect = new redirect($this->template.'/index');
        }
          $data = [
            'data_admin'        => $data_admin,
            'page'              => $this->template.'/detail',
            'title'             => 'Chi tiết '.$this->title,
            'template'          => $this->template,
            'datas'             => $datas,
            'checkStatus'       => $this->Functions
        ];
        $this->view('cpanel/masterlayout', $data);
    }
    public function delete()
    {
        if (isset($_SESSION['admin'])){
            $verify = $this->Jwtoken->decodeToken($_SESSION['admin'],KEYS);
            if ($verify != NULL && $verify != 0) {
                $auth = $this->Authorzation->checkAuth($verify);
                if ($auth != true) {
                    $redirect = new redirect('cpanel/auth/index');
                }
            }
            else{
                $redirect = new redirect('cpanel/auth/index');
            }
        }
        else{
            $redirect = new redirect('cpanel/auth/index');
        }
        $id = $_POST['id'];
        $result = $this->OrderModels->delete(['id' => $id]);
        $return = json_decode($result, true);
        if ($return['type'] =="sucessFully") {
            $this->OrderDetailModels->delete(['orderId' => $id]);
            echo json_encode(
                [
                    'result'    => "true",
                    'message'   => $return['Message']
                ]
            );
        }
    }
   
}