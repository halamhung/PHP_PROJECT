<?php 
require_once "./mvc/core/redirect.php";
require_once "./mvc/controllers/MyController.php";
class about extends controller{
    public $template    = 'cpanel/about';
    public $title       = 'Giới Thiệu';
    public function __construct()
    {
        $this->MyController         = new MyController();
        // load helper
        $this->Jwtoken              =  $this->helper('Jwtoken');
        $this->Authorzation         =  $this->helper('Authorzation');
        // =======================================
        $this->AboutModels = $this->models('AboutModels');
    }
    function index(){
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
        //  ======================
        $data_admin = $this->MyController->getIndexAdmin();
        $datas = [];
        $datas = $this->AboutModels->select_row('*', ['type' => 1]);
        if ($_SERVER['REQUEST_METHOD'] == "POST") {
            if($datas != null){
                $data_post = $_POST['data_post'];
                $data_post['publish'] ? $publish = 1:$publish = 0;
                $data_post['publish']  = $publish;
                $data_post['updated_at']  = gmdate('Y-m-d H:i:s', time() + 7*3600);
                $results = $this->AboutModels->update($data_post, ['id' => $datas['id']]);
                $return = json_decode($results, true);
                if ($return['type']=="sucessFully") {
                    $redirect = new redirect($this->template.'/'.'index');
                    $redirect->setFlash('flash', 'Cập nhật thành công');
                }
            }
            else{
                $data_post = $_POST['data_post'];
                $data_post['type'] = 1;
                $data_post['created_at']  = gmdate('Y-m-d H:i:s', time() + 7*3600);
                $data_post['publish'] ? $publish = 1:$publish = 0;
                $data_post['publish']  = $publish;
                $results = $this->AboutModels->add($data_post);
                $return = json_decode($results, true);
                if ($return['type']=="sucessFully") {
                    $redirect = new redirect($this->template.'/'.'index');
                    $redirect->setFlash('flash', 'Cập nhật thành công');
                }
            }
        }
        $data = [
            'data_admin'        => $data_admin,
            'page'              => $this->template.'/index',
            'title'             => $this->title,
            'template'          => $this->template,
            'datas'             => $datas
        ];
        $this->view('cpanel/masterlayout', $data);
    }
}