<?php 
require_once "./mvc/controllers/MyController.php";
require_once "./mvc/core/redirect.php";

class auth extends controller{
     public $template    = 'auth';
     function __construct(){
        $this->AccountsModels = $this->models('AccountsModels');
        $this->MyController = new MyController();
        // 
        $this->Jwtoken             =  $this->helper('Jwtoken');
        $this->Authorzation        =  $this->helper('Authorzation');
    }
    function index(){
       echo 'auth';
    }
    function signup(){
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $data_post                  = $_POST['data_post'];
            $counts                     = $this->AccountsModels->select_array('*',['username' => trim($data_post['username'])]);
            $data_post['created_at']    = gmdate('Y-m-d H:i:s', time() + 7*3600);
            $data_post['username']      = trim($data_post['username']);
            $password                   = password_hash($data_post['password'],PASSWORD_BCRYPT);
            $data_post['password_text'] = $data_post['password'];
            $data_post['password']      = $password;
            if(count($counts) > 0){
                $redirect = new redirect('dang-ky.html');
                $redirect->setFlash('errors', 'Tài khoản đã tồn tại!');
            }
            else{
                $result = $this->AccountsModels->add($data_post);
                $return = json_decode($result, true);
                if ($return['type']=="sucessFully") {
                    $redirect = new redirect('dang-ky.html');
                    $redirect->setFlash('flash', 'Đăng ký thành công.!');
                }
            }
           
        }
        $data_index = $this->MyController->indexCustomers();
        $this->viewFrontEnd('frontend/signup/index',[
            'data_index'    => $data_index,
            'title'         => 'Đăng ký'
        ]);
    }
    function signin(){
         if (isset($_SESSION['user'])){
            $verify = $this->Jwtoken->decodeToken($_SESSION['user'],KEYS);
            if ($verify != NULL && $verify != 0) {
                $auth = $this->Authorzation->checkAuthUser($verify);
                if ($auth) {
                    $redirect = new redirect('/');
                }
            }
        }
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $data_post  = $_POST['data_post'];
            $data      = $this->AccountsModels->select_row('*',['username' => trim($data_post['username'])]);
            if ($data) {
               if(password_verify($data_post['password'], $data['password'])){
                      $array = [
                        'time'      => time() + 3600 * 24,
                        'keys'      => KEYS,
                        'info'      => [
                            'id'        => $data['id'],
                            'username'  => $data['username']
                        ]
                        
                    ];
                    $jwt = $this->Jwtoken->CreateToken($array);
                    $_SESSION['user'] = $jwt;
                    $redirect = new redirect('/');
               }
               else
               {
                    $redirect = new redirect('dang-nhap.html');
                    $redirect->setFlash('errors', 'Sai mật khẩu hoặc tài khoản!');
               }
            }
            else{
                $redirect = new redirect('dang-nhap.html');
                $redirect->setFlash('errors', 'Sai mật khẩu hoặc tài khoản!');
            }
        }
        $data_index = $this->MyController->indexCustomers();
        $this->viewFrontEnd('frontend/signin/index',[
         'data_index'    => $data_index,
          'title'         => 'Đăng nhập'
       ]);
    }
    function logout(){
        if($_SESSION['user']){
            unset($_SESSION['user']);
        }
         $redirect = new redirect('/');
    }
    function info(){
        if (isset($_SESSION['user'])){
            $verify = $this->Jwtoken->decodeToken($_SESSION['user'],KEYS);
            if ($verify != NULL && $verify != 0) {
                $auth = $this->Authorzation->checkAuthUser($verify);
                if (!$auth) {
                   $redirect = new redirect('dang-nhap.html');
                }
            }
        }
        else{
            $redirect = new redirect('dang-nhap.html');
        }
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $data_post = $_POST['data_post'];
            $array = [
                'name'          => $data_post['name'],
                'email'         => $data_post['email'],
                'phoneNumber'   => $data_post['phoneNumber'],
                'address'       => json_encode($data_post['address'], true),
            ];
            $result = $this->AccountsModels->update($array, ['id' => $verify['id']]);
            $decodeResults = json_decode($result, true);
            if($decodeResults['type'] ==='sucessFully'){
                $redirect = new redirect('thong-tin-chung.html');
                $redirect->setFlash('flash', 'Cập nhật thành công!');
            }
        }
        // 
        $data_index = $this->MyController->indexCustomers();
        $this->viewFrontEnd('frontend/info/index',[
         'data_index'    => $data_index,
         'title'         => 'Thông tin cá nhân',
         'page'          => 'information'
       ]);
    }
    function changePassWord(){
        $data_index = $this->MyController->indexCustomers();
        if (isset($_SESSION['user'])){
            $verify = $this->Jwtoken->decodeToken($_SESSION['user'],KEYS);
            if ($verify != NULL && $verify != 0) {
                $auth = $this->Authorzation->checkAuthUser($verify);
                if (!$auth) {
                   $redirect = new redirect('dang-nhap.html');
                }
            }
        }
        else{
            $redirect = new redirect('dang-nhap.html');
        }
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $data_post = $_POST['data_post'];
            $rows = $this->AccountsModels->select_row('*', ['id' => $data_index['user']['id']]);
            if(password_verify($data_post['password'], $rows['password'])){
                $array = [
                'password'      => password_hash(trim($data_post['newPassword']), PASSWORD_BCRYPT),
                'password_text' => trim($data_post['newPassword']),
                'updated_at'    => gmdate('Y-m-d H:i:s', time() + 7*3600)
            ];
            $result = $this->AccountsModels->update($array, ['id' => $data_index['user']['id']]);
            $decodeResults = json_decode($result, true);
            if($decodeResults['type'] ==='sucessFully'){
                $redirect = new redirect('doi-mat-khau.html');
                $redirect->setFlash('flash', 'Cập nhật thành công!');
            }
            }
            else{
                $redirect = new redirect('doi-mat-khau.html');
                $redirect->setFlash('errors', 'Mật khẩu cũ không chính xác');
            }
           
        }
        // 
        $this->viewFrontEnd('frontend/info/index',[
         'data_index'    => $data_index,
         'title'         => 'Đổi mật khẩu',
         'page'          => 'changePassword'
       ]);
    }
}