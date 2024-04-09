<?php 
class controller 
{
    function view($view,$data=[])
    {
        require_once "./mvc/views/".$view.".php";
    }
    function models($models){
        require_once "./mvc/models/".$models.".php";
        return new $models;
    }
    function helper($helper){
        require_once "./mvc/helper/".$helper.".php";
        return new $helper;
    }
    function viewFrontEnd($view,$data=[])
    {
        foreach($data as $key => $value){
            $$key = $value;
        }
        require_once "./mvc/views/".$view.".php";
    }
   function cart($array){
    $array_cart = [];
        if (isset($_SESSION['cart']))
        {
            if (array_key_exists($array['productID'],$_SESSION['cart']))
            {
               
                 $_SESSION['cart'][$array['productID']]['qty'] += $array['qty'];
            }
            else
            {
                 $_SESSION['cart'][$array['productID']] = $array;
                 $_SESSION['cart'][$array['productID']]['qty'] = $array['qty'];
            }
        }
        else
        {
             $_SESSION['cart'][$array['productID']] = $array;
             $_SESSION['cart'][$array['productID']]['qty'] = $array['qty'];
        }
        $array_cart = $_SESSION['cart'];
        if($_SESSION['cart'][$array['productID']]['qty']  <= 0){
            unset($_SESSION['cart'][$array['productID']]);
            return;
        }
        return $array_cart; 
   }
}