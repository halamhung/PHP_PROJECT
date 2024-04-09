 <div class="container">
     <div class="form">
         <h3>Thông tin chung</h3>
         <form action="" method="post">
             <div class="row">
                 <div class="col-6">
                     <label for="">Họ và tên</label>
                     <input type="text" name="data_post[name]" value="<?= $data_index['user']['name'] ?>"
                         class="form-control">
                 </div>
                 <div class="col-6">
                     <label for="">Email</label>
                     <input type="text" name="data_post[email]" class="form-control" required=""
                         pattern="[^@\s]+@[^@\s]+\.[^@\s]+" value="<?= $data_index['user']['email'] ?>">
                 </div>
             </div>
             <div class="row">
                 <div class="col-6">
                     <label for="">Số điện thoại</label>
                     <input type="text" name="data_post[phoneNumber]" class="form-control"
                         value="<?= $data_index['user']['phoneNumber'] ?>">
                 </div>
                 <div class="col-6">
                     <label for="">Địa chỉ 1</label>
                     <input type="text" name="data_post[address][address1]" class="form-control" required=""
                         value="<?= isset($data_index['user']['address']['address1']) ? $data_index['user']['address']['address1'] : '' ?>">
                 </div>

             </div>
             <div class="row">
                 <div class="col-6">
                     <label for="">Địa chỉ 2</label>
                     <input type="text" name="data_post[address][address2]" class="form-control" required=""
                         value="<?= isset($data_index['user']['address']['address2']) ? $data_index['user']['address']['address2'] : '' ?>">
                 </div>
             </div>
             <div class="row">
                 <div class="button_submit"><button type="submit">Cập nhật</button></div>
             </div>
         </form>
     </div>
 </div>