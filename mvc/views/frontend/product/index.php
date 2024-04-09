<section class="product">
    <div class="container">
        <div class="title__product">
            <h3>Sản phẩm</h3>
        </div>
        <div class="list__product">
            <?php foreach($product as $value){?>
            <div class="card">
                <div class="before box">
                    <div class="images">
                        <a href="<?= $value['slug'] ?>"><img src="<?= $value['image'] ?>" alt=""></a>
                    </div>
                    <div class="contents">
                        <a href="<?= $value['slug'] ?>">
                            <p class="title"><?= $value['name'] ?></p>
                            <p class="price">
                                <!-- <s>200.000 đ</s> -->
                                <span><?= number_format($value['price']); ?>đ</span>
                            </p>
                            <div class="info">
                                <?php $contents = json_decode($value['properties'],true); ?>
                                <?php if(isset($contents) && $contents != NULL){?>
                                <?php for ($i=0; $i < 5; $i++) {?>
                                <p><strong><?= $contents[$i]['name'] ?><?= $contents[$i]['name'] ? ':' : '' ?></strong>
                                    <?= $contents[$i]['value'] ?></p>
                                <?php } ?>
                                <?php } ?>
                            </div>
                        </a>
                    </div>
                    <!-- <span class="discout">10%</span> -->
                </div>
                <div class="after box">
                    <p class="title"><?= $value['name'] ?></p>
                    <div class="btn">
                        <button class="buy"><i class="fas fa-cart-plus"></i></button>
                        <a class="detail" href="javascript:void(0)"><i class="fas fa-info-circle"></i></a>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</section>