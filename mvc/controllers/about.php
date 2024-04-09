<?php 
require_once 'MyController.php';
class about extends controller{
    public $title = 'Giới thiệu';
    function __construct(){
        $this->AboutModels = $this->models('AboutModels');
        $this->MyController = new MyController();
    }
    function index(){
        $data_index = $this->MyController->indexCustomers();
        $datas = $this->AboutModels->select_row('*', ['publish' => 1]);
        $data = [
            'page'          => 'about/index',
            'data_index'    => $data_index,
            'datas'         => $datas,
            'title'         => $this->title
        ];
       $this->viewFrontEnd('frontend/masterlayout', $data);
    }
}