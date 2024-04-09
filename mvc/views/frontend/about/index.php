<link rel="stylesheet" href="public/build/css/about.css">
<?php if(isset($datas) && $datas != NULL){?>
<section class="product">
    <div class="container">
        <div class="title__product">
            <h3><?= $title ?></h3>
        </div>
        <div class="contents__about">
           <div class="head">
                <div class="title"><h3><?= $datas['name'] ?></h3></div>
                <div class="date">
                    <span> Ngày cập nhật: <?= $datas['updated_at'] ?></span>
                </div>
           </div>
            <div class="contents">
               <?= $datas['contents'] ?>
           </div>
        </div>
    </div>
</section>
<?php } ?>
