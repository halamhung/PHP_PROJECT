<?php
require_once "./mvc/core/redirect.php";
require_once "./mvc/controllers/MyController.php";
class menu extends controller
{
    public $template    = 'cpanel/menu';
    public $title       = 'danh mục sản phẩm';
    public $message     = [];
    public function __construct()
    {
        $this->CategoryModels       =  $this->models('CategoryModels');
        $this->MenuModels           =  $this->models('MenuModels');
        $this->SlugModels           =  $this->models('SlugModels');
        $this->MyController         = new MyController();
        // load helper
        $this->Jwtoken              =  $this->helper('Jwtoken');
        $this->Authorzation         =  $this->helper('Authorzation');
        $this->Functions            =  $this->helper('Functions');

    }
    public function index()
    {
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
        $datas = $this->MenuModels->select_array('*', ['parentID' => 0]);
        foreach ($datas as $key => $val) {
            $children = $this->MenuModels->select_array('*', ['parentID' => $val['id']]);
            $datas[$key]['children'] = $children;
        }
        $data = [
            'data_admin'        => $data_admin,
            'page'      => $this->template.'/index',
            'title'     => 'Danh sách '.$this->title,
            'template'  => $this->template,
            'datas'     => $datas
        ];
        $this->view('cpanel/masterlayout', $data);
    }
    public function add()
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
        //  =============
        $data_admin = $this->MyController->getIndexAdmin();
        
        if ($_SERVER['REQUEST_METHOD'] == "POST") {
            $data_post = $_POST['data_post'];
            $url = '';
            if($data_post['type'] == 0) {
                $data_post['cateID'] = 0;
                $url = $data_post['url'];
            }
            else{
                $url = $this->CategoryModels->select_row('*',['id' => $data_post['cateID']]);
                $url = $url['slug'];
            }
            
            $data_post['publish'] ? $publish = 1:$publish = 0;
            $data_post['publish']  = $publish;
            $data_post['url'] = $url;      
           
            $result = $this->MenuModels->add($data_post);
            $return = json_decode($result, true);
            if ($return['type']=="sucessFully") {
                $redirect = new redirect($this->template.'/'.'index');
                $redirect->setFlash('flash', 'Thêm thành công danh');
            }
        }
        // parentID
        $parent = $this->MenuModels->select_array('*', ['parentID' => 0]);
        
        $data = [
            'data_admin'        => $data_admin,
            'page'          => $this->template.'/add',
            'title'         => 'Thêm mới '.$this->title,
            'template'      => $this->template,
            'parent'        => $parent
        ];
        $this->view('cpanel/masterlayout', $data);
    }
    public function edit($id)
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
        // =========================
        $data_admin = $this->MyController->getIndexAdmin();
        $datas = $this->MenuModels->select_row('*', ['id' => $id]);
        if ($_SERVER['REQUEST_METHOD'] == "POST") {
            $data_post = $_POST['data_post'];
            if ($id == $data_post['parentID']) {
                $redirect = new redirect($this->template.'/'.'index');
                $redirect->setFlash('errors', 'id của danh mục này trùng với id hiện tại');
            } else {
                if($data_post['type'] == 0) {
                    $data_post['cateID'] = 0;
                    $url = $data_post['url'];
                }
                else{
                    $url = $this->CategoryModels->select_row('*',['id' => $data_post['cateID']]);
                    $url = $url['slug'];
                }
               
                $data_post['url'] = $url;       
                $data_post['publish'] ? $publish = 1:$publish = 0;
                $data_post['publish']  = $publish;
                $result = $this->MenuModels->update($data_post, ['id' => $id]);
                $return = json_decode($result, true);
                if ($return['type']=="sucessFully") {
                    $redirect = new redirect($this->template.'/'.'index');
                    $redirect->setFlash('flash', 'Cập nhật thành công');
                }
            }
        }
        // ======================
        $parent = $this->MenuModels->select_array('*', ['parentID' => 0]);
        $data = [
            'data_admin'        => $data_admin,
            'page'          => $this->template.'/edit',
            'title'         => 'Cập nhật '.$this->title,
            'template'      => $this->template,
            'parent'        => $parent,
            'datas'         => $datas
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
        $result = $this->MenuModels->delete(['id' => $id]);
        $return = json_decode($result, true);
        if ($return['type'] =="sucessFully") {
            $this->MenuModels->update(['parentID' => 0], ['parentID' => $id]);
            echo json_encode(
                [
                    'result'    => "true",
                    'message'   => $return['Message']
                ]
            );
        }
    }
    
    public function delAll()
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
        $listID = $_POST['listID'];
        $arrayID = explode(',', $listID);
        foreach ($arrayID as $key => $val) {
            $this->MenuModels->delete(['id' => $val]);
        }
        echo json_encode(
            [
                'result'    => 'success',
                'message'   => 'Delete Success'
            ]
        );
    }
    public function checkpublish()
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
        $value = $_POST['value'];
        $fields = $_POST['fields'];
        $dataUpdate[$fields] = $value;
        $result = $this->MenuModels->update($dataUpdate, ['id' => $id]);
        $return = json_decode($result, true);
        if ($return['type'] == "sucessFully") {
            echo json_encode(
                array(
                    'type'      => 'sucessFully',
                    'Message'   => 'Update data success',
                )
            );
        }
    }
    function getCate(){
        $type = $_POST['type'];
        $parentId = '';
        if (isset($_POST['cateID'])) {
            $parentId = $_POST['cateID'];
        }
        $data = $this->Functions->getCate($type , 0,$parentId);
        echo json_encode([
            'data'  => $data
        ]);
    }
    function sort(){
        $data_post['sort'] = $_POST['value'];
        $result = $this->MenuModels->update($data_post, ['id' => $_POST['id']]);
        echo json_encode($result);
    }
}