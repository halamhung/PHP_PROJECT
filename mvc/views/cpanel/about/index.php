<script src="public/cpanel/ckeditor/ckeditor.js"></script>
<script src="public/cpanel/ckfinder/ckfinder.js"></script>
<?php
    require_once "./mvc/core/redirect.php";
    require_once "./mvc/core/constant.php";
    $redirect = new redirect();
?>
<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3><?= $data['title'] ?></h3>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-12" id="MessageFlash">
            <?php if(isset($_SESSION['flash'])){?>
                    <h3 class="text-success"><?= $redirect->setFlash('flash');  ?></h3>
            <?php } ?>
            <?php if(isset($_SESSION['errors'])){?>
                <h3 class="text-danger"><?= $redirect->setFlash('errors');  ?></h3>
           <?php } ?>
        </div>
    </div>
        <div class="">
            <form class="" action="" method="post" novalidate>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="">Tiêu đề</label>
                            <input type="text" name="data_post[name]" id="name" value="<?= $data['datas'] ? $data['datas']['name'] : '' ?>" class="form-control">

                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <label for="">Nội dung</label>
                            <textarea name="data_post[contents]" class="form-control" id="" cols="30" rows="10"><?= $data['datas'] ? $data['datas']['contents'] : '' ?></textarea>
                            <script>
                                CKEDITOR.replace('data_post[contents]', {
                                    filebrowserBrowseUrl: 'public/cpanel/ckfinder/ckfinder.html',
                                    filebrowserUploadUrl: 'public/cpanel/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
                                    filebrowserWindowWidth: '1000',
                                    filebrowserWindowHeight: '700'
                                } );
                            </script>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <label for="publish">Hiển thị</label>
                            <input id="publish" type="checkbox" value="1" <?= $data['datas']? $data['datas']['publish'] == 1 ? 'checked' : '' : '' ?> name="data_post[publish]">
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <button class="btn btn-primary" name="submit" type="submit">Cập nhật</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
</div>
