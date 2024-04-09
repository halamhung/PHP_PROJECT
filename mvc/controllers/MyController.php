<?php 
class MyController extends controller{
    public $ModuleModels;
    public $PhotoModels;
    function __construct(){
        $this->ModuleModels         = $this->models('ModuleModels');
        $this->PhotoModels          = $this->models('PhotoModels');
        $this->MenuModels           =  $this->models('MenuModels');
        $this->CategoryModels       =  $this->models('CategoryModels');
        $this->AccountsModels       =  $this->models('AccountsModels');
        // 
         $this->Jwtoken             =  $this->helper('Jwtoken');
    }
    function getIndexAdmin(){
        $data['getModule']      = $this->getModule();
        $data['delelePhoto']    = $this->delelePhoto();
        return $data;
    }
    function indexCustomers(){
        $data['cart']           = $this->getCart();
        $data['menu']           = $this->getMenu();   
        $data['user']           = $this->getUsers();   
        return $data;
    }
    function getModule(){
        $data = $this->ModuleModels->select_array('*',['parentID' => 0,'publish' => 1]);
        foreach($data as $key => $val){
            $children = $this->ModuleModels->select_array('*',['parentID' => $val['id'],'publish' => 1]);
            $data[$key]['children'] = $children;
        }
        return $data; 
    }
    function delelePhoto(){
        $today = gmdate('Y-m-d',time() + 7 *3600);
        $list = $this->PhotoModels->select_array('*',['productID' => 0,'created_at <' => $today]);
        foreach($list as $key => $val){
            if ($val['image'] != '' && $val['image'] != null) {
                if (file_exists($val['image'])) {
                    unlink($val['image']);
                }
            }
            if ($val['thumb'] != '' && $val['thumb'] != null) {
                if (file_exists($val['thumb'])) {
                    unlink($val['thumb']);
                }
            }
        }
        return  $this->PhotoModels->delete(['productID' => 0,'created_at <' => $today]);
    }
    function getCart(){
        if (isset($_SESSION['cart'])) {
            return $_SESSION['cart'];
        }
        return [];
    }
    function getMenu(){
        $data = $this->MenuModels->select_array('*',['parentID' => 0,'publish' => 1], 'sort asc, id desc');
        foreach($data as $key => $val){
            $url = $val['url'];
            if($val['type'] === 1){
                $datas = $this->CategoryModels->select_row('*',['type' => $val['type']]);
                $url = $datas['slug'];
            }
            else{
                $data[$key]['url'] = $url;
            }
            $children = $this->MenuModels->select_array('*',['parentID' => $val['id'],'publish' => 1]);
            foreach($children as $key_Child =>  $child){
                if($child['type'] !== 0){
                    $datas_Child = $this->CategoryModels->select_row('*',['id' => $child['cateID']]);
                    $url = $datas_Child['slug'];
                }
                $children[$key_Child]['url'] = $url;
            }
            $data[$key]['children'] = $children;
        }
        return $data; 
    }
    function getUsers(){
        if(isset($_SESSION['user'])){
            $verify = $this->Jwtoken->decodeToken($_SESSION['user'],KEYS);
            $user  = $this->AccountsModels->select_row('*',['id' => trim($verify['id'])]);
            if($verify  !== null){
                return [
                    'id'            => $user['id'],
                    'username'      => $user['username'],
                    'name'          => $user['name'],
                    'phoneNumber'   => $user['phoneNumber'],
                    'email'         => $user['email'],
                    'address'       => $user['address'] !== '' ? json_decode($user['address'], true) : [],
                ];
            }
        }
        else
        {
            return false;
        }

    }
}