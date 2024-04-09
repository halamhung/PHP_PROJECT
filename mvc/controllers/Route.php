<?php 
require_once 'MyController.php';
class Route extends controller{

    function __construct(){
        $this->SlugModels       =  $this->models('SlugModels');
        $this->ProductModels    =  $this->models('ProductModels');
        $this->CategoryModels   =  $this->models('CategoryModels');
        $this->PhotoModels      =  $this->models('PhotoModels');
        $this->MyController = new MyController();

    }
    function index($alias){
        $datas = $this->SlugModels->select_row('*',['name' => $alias]);
        if($datas){
            if ($datas['type'] == 2) {
                $data = $this->productDetail($alias);
                $this->viewFrontEnd('frontend/masterlayout',$data);
            }
            else if ($datas['type'] == 1) {
                $data = $this->product($alias);
                $this->viewFrontEnd('frontend/masterlayout',$data);
            }
        }
        else
        {
            $this->viewFrontEnd('frontend/page404',[]);
        }
       
    }
    function productDetail($alias){
        $data_index = $this->MyController->indexCustomers();
        $data = [];
        $data['data_index'] = $data_index;
        $data['page']       = 'product/detail';
        $data['product']    =  $this->ProductModels->select_row('*',['slug' => $alias]);
        $data['title']      = $data['product']['name'];
        $data['list_images'] = $this->PhotoModels->select_array('*',['productID' => $data['product']['id']]);
        $cateSame = $this->sameProduct($data['product']['cateID']);
        if($cateSame != null){
            $data['product__same'] = $this->ProductModels->select_array('*',['publish' => 1],'id desc',0,5,'cateID',$cateSame,'id',array($data['product']['id']));
        }
        // where in
        return $data;
    }
    function sameProduct($cateId){
        $array = [];
        // parent = 0 , != 0
        $data = $this->CategoryModels->select_row('*',['id' => $cateId]);
        if ($data != null){
            if($data['parentID'] != 0){
                $cate = $this->CategoryModels->select_array('*',['parentID' => $data['parentID']]);
                foreach($cate as $value){
                    $array[] = $value['id'];
                }
            }
            else
            {
                $array[] = $data['id'];
            }
        }
        return $array;
    }
    function product($alias){
        $data_index = $this->MyController->indexCustomers();
        $cate = $this->CategoryModels->select_row('*', ['slug' => $alias]);
        $data = [];
        $product            = $this->ProductModels->select_array('*',['publish' => 1, 'cateID' => $cate['id']]);
        $data['product']    = $product; 
        $data['data_index'] = $data_index;
        $data['page']       = 'product/index'; 
        $data['title']      =  $cate['name'];
        return $data;
    }
    function pageNotFound(){

    }

}