<link rel="stylesheet" href="public/build/css/cart.css">
<section class="cart__container">
    <div class="container">
        <div class="cart">
            <h3>Chi tiết đơn hàng</h3>
            <?php if(isset($data_index['cart']) && $data_index !== NULL && count($data_index['cart']) > 0){?>
            <div class="list__items">
                <table>
                    <thead>
                        <th>Tên sản phẩm</th>
                        <th>Hình ảnh</th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Tổng giá</th>
                    </thead>
                    <tbody id="content_cart">
                        <?php foreach($data_index['cart'] as $key => $val){?>
                        <tr>
                            <td><?= $val['name'] ?></td>
                            <td><img src="<?= $val['image'] ?>" alt=""></td>
                            <td><?= number_format((float)$val['price']) ?>đ</td>
                            <td>
                                <?= $val['qty'] ?>
                            </td>
                            <td>
                                <?= number_format((float)$val['price'] * $val['qty']) ?>đ
                            </td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="payment" style="height: auto">
            <div class="box" style="width: auto">
                <p><strong>Tổng tiền cần thanh toán:</strong><span id="total_Price">
                        <?php $total = 0; if(isset($data_index['cart']) && $data_index !== NULL){?>
                        <?php foreach($data_index['cart'] as $key => $val){?>
                        <?php $total = $total + $val['price']* $val['qty']; ?>
                        <?php } ?>
                        <?php } ?>
                        <?= number_format($total); ?>
                        đ</span></p>
            </div>
        </div>
        <div class="payment_cart">
            <h3>Thông tin liên hệ</h3>
            <form action="" method="post">
                <div class="item">
                    <div>
                        <?php if(count($data_index['user']['address']) > 0) {?>
                        <select name="data_post[address]" id="">
                            <?php foreach ($data_index['user']['address'] as $key => $value) { ?>
                            <option value="<?= $value ?>"><?= $value ?></option>
                            <?php } ?>
                        </select>
                        <?php } else  {?>
                        <input type="text" name="data_post[address]" class="form-control" placeholder="Địa chỉ"
                            required />
                        <?php } ?>
                    </div>
                    <div>
                        <input type="text" name="data_post[phone]" value="<?= $data_index['user']['phoneNumber'] ?>"
                            class="form-control" placeholder="Số điện thoại" required />
                    </div>
                </div>
                <div class="item">
                    <div>
                        <input type="text" name="data_post[email]" value="<?= $data_index['user']['email'] ?>"
                            class="form-control" placeholder="email" required />
                    </div>
                </div>
                <div class="item">
                    <div>
                        <textarea type="text" name="data_post[note]" class="form-control" placeholder="Ghi chú" required
                            rows="5"></textarea>
                    </div>
                </div>
                <div class="item">
                    <button type="submit">Thanh toán</button>
                </div>
            </form>
        </div>
    </div>
    <?php } else { ?>
    <div class="payment">
        <div class="box__left">
            Không có sản phẩm nào ! <a href="#" class="payment__btn">Tiếp tục mua hàng</a>
        </div>
    </div>
    <?php } ?>
    </div>
</section>