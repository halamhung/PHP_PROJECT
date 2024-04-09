<link rel="stylesheet" href="public/build/css/cart.css">
<section class="cart__container">
    <div class="container">
        <div class="cart">
            <h3>Giỏ hàng</h3>
            <?php if(isset($data_index['cart']) && $data_index !== NULL && count($data_index['cart']) > 0){?>
            <div class="list__items">
                <table>
                    <thead>
                        <th>Tên sản phẩm</th>
                        <th>Hình ảnh</th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Tổng giá</th>
                        <th>Thao tác</th>
                    </thead>
                    <tbody id="content_cart">
                        <?php foreach($data_index['cart'] as $key => $val){?>
                        <tr>
                            <td><?= $val['name'] ?></td>
                            <td><img src="<?= $val['image'] ?>" alt=""></td>
                            <td><?= number_format((float)$val['price']) ?>đ</td>
                            <td>
                                <div class="quantily">
                                    <div class="minus" onClick="minusProduct(this, '<?= $val['slug'] ?>')"
                                        slug="<?= $val['slug'] ?>"><i class="fa-solid fa-minus"></i></div>
                                    <input type="number" disabled readonly value="<?= $val['qty'] ?>" id="qty__product"
                                        name="data_post[qty]">
                                    <div class="plus" onclick="plusProduct('<?= $val['slug'] ?>')"
                                        slug="<?= $val['slug'] ?>"><i class="fa-solid fa-plus"></i></div>
                                </div>
                            </td>
                            <td>
                                <?= number_format((float)$val['price'] * $val['qty']) ?>đ
                            </td>
                            <td>
                                <a href="javascript:void(0)" class="btn btn-delete"
                                    onclick="deleteProduct('<?= $val['slug'] ?>')"><i
                                        class="fa-solid fa-trash-can"></i></a>
                            </td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="payment">
            <div class="box__left">
                <a href="#" class="payment__btn">Tiếp tục mua hàng</a>
            </div>
            <div class="box">
                <p><strong>Tổng giá:</strong><span id="total_Price">
                        <?php $total = 0; if(isset($data_index['cart']) && $data_index !== NULL){?>
                        <?php foreach($data_index['cart'] as $key => $val){?>
                        <?php $total = $total + $val['price']* $val['qty']; ?>
                        <?php } ?>
                        <?php } ?>
                        <?= number_format($total); ?>
                        đ</span></p>
                <button class="payment__btn">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <a href="thanh-toan.html" style="text-decoration: none; color: #fff">Tiến hành thanh toán</a>
                </button>
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
<script>
// Click +,- qty product
const plus = document.querySelectorAll('.plus');
const minus = document.querySelectorAll('.minus');
const input = document.querySelectorAll('#qty__product');
let xhr = new XMLHttpRequest();

function plusProduct(slug) {
    xhr.open('POST', 'cart/update');
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    let total__Price = 0;
    xhr.onload = function(e) {
        const data = JSON.parse(this.responseText);
        let list__items_cart = document.querySelector('.list__items_cart');
        let element = '';
        data.map((v) => {
            total__Price += parseInt(v.qty * v.price)
            element += `
                <tr>
                    <td>${v.name}</td>
                    <td><img src="${v.image}" alt=""></td>
                    <td>${Math.floor(v.price).format(0)}đ</td>
                    <td>
                        <div class="quantily">
                            <div class="minus" onClick="minusProduct(this,'<?= $val['slug'] ?>')"  slug = "${v.slug}"><i class="fa-solid fa-minus"></i></div>
                                <input type="number" disabled readonly value="${v.qty}" id="qty__product" name="data_post[qty]">
                            <div class="plus" onclick="plusProduct('${v.slug}')" slug = "${v.slug}"><i class="fa-solid fa-plus"></i></div>
                        </div>
                    </td>
                    <td>
                            ${Math.floor(v.price * v.qty).format(0)}đ
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="btn btn-delete" onclick="deleteProduct('${v.slug}')"><i class="fa-solid fa-trash-can"></i></a>
                    </td>
                </tr>
                `
        });
        let element2 = '';
        data.map((v) => {
            element2 += `
                    <div class="item">
                        <div class="box__one">
                            <div class="image">
                                <img src="${v.image}" alt="">
                            </div>
                            <div class="name__product">
                                <p>${v.name} </p>
                                <p>${formatMoney(v.price)} đ</p>
                            </div>
                        </div>
                        <div class="box__two">
                            <p>Số lượng:  <span>${v.qty}</span></p>
                        </div>
                        <div class="box__tree">
                            <a href="javascript:void(0)"><i  data-id="${v.productID}" class="fa-solid fa-trash"></i></a>
                        </div>
                    </div>
                    `
        });
        list__items_cart.innerHTML = element2;
        document.getElementById('content_cart').innerHTML = element;
        document.querySelector('.total_qty').innerHTML = data.length;
        document.getElementById('total_Price').innerHTML = total__Price.format(0)
        document.getElementById('total_Price_header').innerHTML = total__Price.format(0)

    }
    xhr.send(`slug=${slug}`);
}

function minusProduct(__This, slug) {
    xhr.open('POST', 'cart/deleteProduct');
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    let total__Price = 0;
    xhr.onload = function(e) {
        if (this.responseText) {
            const data = JSON.parse(this.responseText);
            let list__items_cart = document.querySelector('.list__items_cart');
            let element = '';
            data.map((v) => {
                if (v.qty <= 0) return;
                total__Price += parseInt(v.qty * v.price)
                element += `
                <tr>
                    <td>${v.name}</td>
                    <td><img src="${v.image}" alt=""></td>
                    <td>${Math.floor(v.price).format(0)}đ</td>
                    <td>
                        <div class="quantily">
                            <div class="minus" onClick="minusProduct(this,'${v.slug}')"  slug = "${v.slug}"><i class="fa-solid fa-minus"></i></div>
                                <input type="number" disabled readonly value="${v.qty}" id="qty__product" name="data_post[qty]">
                            <div class="plus" onclick="plusProduct('${v.slug}')" slug = "${v.slug}"><i class="fa-solid fa-plus"></i></div>
                        </div>
                    </td>
                    <td>
                            ${Math.floor(v.price * v.qty).format(0)}đ
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="btn btn-delete" onclick="deleteProduct('${v.slug}')"><i class="fa-solid fa-trash-can"></i></a>
                    </td>
                </tr>
                `
            });
            let element2 = '';
            data.map((v) => {
                element2 += `
                     <div class="item">
                        <div class="box__one">
                            <div class="image">
                                <img src="${v.image}" alt="">
                            </div>
                            <div class="name__product">
                                <p>${v.name} </p>
                                <p>${formatMoney(v.price)} đ</p>
                            </div>
                        </div>
                        <div class="box__two">
                            <p>Số lượng:  <span>${v.qty}</span></p>
                        </div>
                        <div class="box__tree">
                            <a href="javascript:void(0)"><i  data-id="${v.productID}" class="fa-solid fa-trash"></i></a>
                        </div>
                    </div>
                    `
            });
            list__items_cart.innerHTML = element2;
            document.getElementById('content_cart').innerHTML = element;
            document.querySelector('.total_qty').innerHTML = data.length;
            document.getElementById('total_Price').innerHTML = total__Price.format(0)
            document.getElementById('total_Price_header').innerHTML = total__Price.format(0)
        }
    }
    xhr.send(`slug=${slug}`);
}
// for (let index = 0; index < plus.length; index++) {
//     plus[index].addEventListener('click',(e) => {
//         input[index].value = Number(input[index].value) + 1;
//         const slug = e.target.parentElement.getAttribute('slug');
//         xhr.open('POST','cart/update');
//         xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
//         xhr.onload = function(e){
//             const data = JSON.parse(this.responseText);
//             let element = '';
//             data.map((v) => {
//                 element += `
//                 <tr>
//                     <td>${v.name}</td>
//                     <td><img src="${v.image}" alt=""></td>
//                     <td>${v.price}đ</td>
//                     <td>
//                         <div class="quantily">
//                             <div class="minus" slug = "${v.slug}"><i class="fa-solid fa-minus"></i></div>
//                                 <input type="number" disabled readonly value="${v.qty}" id="qty__product" name="data_post[qty]">
//                             <div class="plus" slug = "${v.slug}"><i class="fa-solid fa-plus"></i></div>
//                         </div>
//                     </td>
//                     <td>
//                          ${Math.floor(v.price * v.qty).format(0)}đ
//                     </td>
//                     <td>
//                         <a href="javascript:void(0)" class="btn btn-delete" onclick="deleteProduct(${v.slug})"><i class="fa-solid fa-trash-can"></i></a>
//                     </td>
//                 </tr>
//                 `
//             });
//             document.getElementById('content_cart').innerHTML = element
//         }
//         xhr.send(`slug=${slug}`);
//     });
// }
for (let index = 0; index < minus.length; index++) {
    minus[index].addEventListener('click', (e) => {
        if (Number(input[index].value) <= 1);
        const slug = e.target.parentElement.getAttribute('slug');
        return input[index].value = 1;
        input[index].value = Number(input[index].value) - 1;

    });
}

function deleteProduct(slug) {
    xhr.open('POST', 'cart/deleteBlockProduct');
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    let total__Price = 0;
    xhr.onload = function(e) {
        const data = JSON.parse(this.responseText);
        if (this.responseText) {
            let list__items_cart = document.querySelector('.list__items_cart');
            let element = '';
            data.map((v) => {
                if (v.qty <= 0) return;
                total__Price += parseInt(v.qty * v.price)
                element += `
                <tr>
                    <td>${v.name}</td>
                    <td><img src="${v.image}" alt=""></td>
                    <td>${Math.floor(v.price).format(0)}đ</td>
                    <td>
                        <div class="quantily">
                            <div class="minus" onClick="minusProduct(this,'<?= $val['slug'] ?>')"  slug = "${v.slug}"><i class="fa-solid fa-minus"></i></div>
                                <input type="number" disabled readonly value="${v.qty}" id="qty__product" name="data_post[qty]">
                            <div class="plus" onclick="plusProduct('${v.slug}')" slug = "${v.slug}"><i class="fa-solid fa-plus"></i></div>
                        </div>
                    </td>
                    <td>
                            ${Math.floor(v.price * v.qty).format(0)}đ
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="btn btn-delete" onclick="deleteProduct('${v.slug}')"><i class="fa-solid fa-trash-can"></i></a>
                    </td>
                </tr>
                `;

            });
            let element2 = '';
            data.map((v) => {
                element2 += `
                    <div class="item">
                        <div class="box__one">
                            <div class="image">
                                <img src="${v.image}" alt="">
                            </div>
                            <div class="name__product">
                                <p>${v.name} </p>
                                <p>${formatMoney(v.price)} đ</p>
                            </div>
                        </div>
                        <div class="box__two">
                            <p>Số lượng:  <span>${v.qty}</span></p>
                        </div>
                        <div class="box__tree">
                            <a href="javascript:void(0)" onClick="deleteItem(${v.productID})"><i data-id="${v.productID}" class="fa-solid fa-trash"></i></a>
                        </div>
                    </div>
                    `
            });
            list__items_cart.innerHTML = element2;
            document.getElementById('content_cart').innerHTML = element;
            document.querySelector('.total_qty').innerHTML = data.length;
            document.getElementById('total_Price').innerHTML = total__Price.format(0)
            document.getElementById('total_Price_header').innerHTML = total__Price.format(0)
        }
    }
    xhr.send(`slug=${slug}`);
}

function formatMoney(__this) {
    let val = __this;
    // let num = val.replace(/[^\d]/g,"");
    let arr = val.split('.');
    let val_num = arr[0];
    let len = val_num.length;
    let result = '';
    let j = 0;
    for (let index = len; index > 0; index--) {
        j++;
        if (j % 3 == 1 && j != 1) {
            result = val_num.substr(index - 1, 1) + ',' + result;
        } else {
            result = val_num.substr(index - 1, 1) + result;
        }
    }
    return result
}
Number.prototype.format = function(n, x) {
    var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
    return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&,');
}
</script>