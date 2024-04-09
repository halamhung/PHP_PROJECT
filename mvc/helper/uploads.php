<?php 
class uploads {
    function upload($files,$path_dir,$name,$width = 300 , $height = 300){
        $tmp = $files['tmp_name'];
        $path_dir_thumb = $path_dir.'thumb/';
        // echo $path_dir_thumb;die;
        if (!is_dir($path_dir)) {
            mkdir($path_dir);
        }
        if (!is_dir($path_dir_thumb)) {
            mkdir($path_dir_thumb);
        }
        $ext = pathinfo($files['name'],PATHINFO_EXTENSION);
     
        $nameImage = $path_dir.$name.'-'.$this->createName().'.'.$ext;
        $nameImageThumb = $path_dir_thumb.$name.'-'.$this->createName().'.'.$ext;
        if ($files['type'] =="image/png" || $files['type'] == "image/jpeg") {
           $uploads = move_uploaded_file($tmp,$nameImage);
           if ($uploads) {
               if ($ext == "png") {
                   $imageSource = $nameImage;
               }
               else if($ext =='jpeg' || $ext == "jpg"){
                    $imageSource = $nameImage;     
               }
                return [
                    'result' => 'true',
                    'image'  => $nameImage,
                    'thumb'  => $nameImageThumb
                ];
           }
        }
        else{
            return [
                'result'    => 'false',
                'message'   => 'Chỉ hổ trợ png/jpeg'
            ];
        }
    }
    function createName(){
        $string = '1234567890asdfghjklzxcvbnmqwertyuioASDDFGHJKLQWERTYUOPZXCVBNM';
        $random = substr(str_shuffle($string),0,100);
        return $random;
    }
}