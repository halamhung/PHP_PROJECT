 <div class="container">
     <div class="form">
         <h3>Đổi mật khẩu</h3>
         <form action="" method="post">
             <div class="row">
                 <div class="col-6">
                     <label for="">Mật khẩu cũ</label>
                     <input type="password" name="data_post[password]" class="form-control">
                     <?php if(isset($_SESSION['errors'])){?>
                     <p style="margin: 0;color: #fff"><?= $redirect->setFlash('errors');  ?></p>
                     <?php } ?>
                 </div>
                 <div class="col-6">
                     <label for="">Mật khẩu mới</label>
                     <input type="password" name="data_post[newPassword]" class="form-control" required="">
                 </div>
             </div>
             <div class="row">
                 <div class="button_submit"><button type="submit">Cập nhật</button></div>
             </div>
         </form>
     </div>
 </div>