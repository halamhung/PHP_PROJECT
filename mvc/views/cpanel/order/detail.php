<?php
    require_once "./mvc/core/redirect.php";
    require_once "./mvc/core/constant.php";
    $redirect = new redirect();
?>
<div class="">
    <div class="page-title">
        <div class="title_left">
            <h3><?= $data['title'] ?></h3>
            <a href="<?=  $data['template'].'/index' ?>" data-control="<?= $data['template'] ?>"
                class="btn btn-success"><i class="fa fa-history"></i></a>
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
    <div>
        <div class="">
            <p style="margin-bottom: 5px"> <strong>Địa chỉ nhận hàng</strong>:
                <span><?= $data['datas'][0]['address'] ?></span>
            </p>
        </div>
        <div class="">
            <p style="margin-bottom: 5px"> <strong>Số điện thoại</strong>:
                <span><?= $data['datas'][0]['phone'] ?></span>
            </p>
        </div>
        <div class="">
            <p style="margin-bottom: 5px"> <strong>Email</strong>: <span><?= $data['datas'][0]['email'] ?></span></p>
        </div>
        <div class="">
            <p style="margin-bottom: 5px"> <strong>Ghi chú</strong>: <span><?= $data['datas'][0]['note'] ?></span></p>
        </div>
        <div class="">
            <p style="margin-bottom: 5px"> <strong>Tổng giá trị đơn hàng</strong>:
                <span><?= number_format($data['datas'][0]['total']) ?></span>
            </p>
        </div>
    </div>
    <div class="x_content">
        <div class="table-responsive">
            <table class="table table-striped jambo_table bulk_action">
                <thead>
                    <tr class="headings">
                        <th class="column-title">Tên sản phẩm </th>
                        <th class="column-title">Đơn giá</th>
                        <th class="column-title">Số lượng </th>
                    </tr>
                </thead>
                <?php if(isset($data['datas']) && $data['datas']!= NULL){?>
                <tbody>
                    <?php foreach($data['datas'] as $key => $val){?>
                    <tr>
                        <td class=""><?= $val['productName'] ?></td>
                        <td class=""><?= number_format($val['price']); ?></td>
                        <td class=""><?= $val['qty'] ?></td>
                    </tr>
                    <?php } ?>
                </tbody>
                <?php } ?>
            </table>
        </div>
    </div>
</div>