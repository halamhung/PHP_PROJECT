<?php 
require_once 'MyController.php';
class contact extends controller{
    public $title = 'Liên hệ';
    function __construct(){
        $this->ContactModels = $this->models('ContactModels');
        $this->MyController = new MyController();
    }
    function index(){
        $data_index = $this->MyController->indexCustomers();
        if ($_SERVER['REQUEST_METHOD'] == "POST") {
            $data_post = $_POST['data_post'];
            $result = $this->ContactModels->add($data_post);
        }
        $data = [
            'page'          => 'contact/index',
            'data_index'    => $data_index,
            'title'         => $this->title
        ];
       $this->viewFrontEnd('frontend/masterlayout', $data);
    }
    function sendContact(){
        $data_post = json_decode($_POST['data'],true);
        $data_post['created_at'] = gmdate('Y-m-d H:i:s', time() + 7*3600);
        $result = $this->ContactModels->add($data_post);
        echo $result;
    }
}