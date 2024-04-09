<?php
    require_once "./mvc/core/redirect.php";
    require_once "./mvc/core/constant.php";
    $redirect = new redirect();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title><?= $title ?></title>
    <base href="http://localhost/shopping/">
    <!-- Bootstrap -->
    <link href="public/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="public/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- NProgress -->
    <link href="public/vendors/nprogress/nprogress.css" rel="stylesheet" />
    <!-- Animate.css -->
    <link href="public/vendors/animate.css/animate.min.css" rel="stylesheet" />
    <!-- Custom Theme Style -->
    <link href="public/build/css/custom.min.css" rel="stylesheet" />
</head>

<body class="login">
    <div>
        <?php if(isset($_SESSION['flash'])){?>
        <p class="text-success"><?= $redirect->setFlash('flash');  ?></p>
        <?php } ?>
        <?php if(isset($_SESSION['errors'])){?>
        <p class="text-danger"><?= $redirect->setFlash('errors');  ?></p>
        <?php } ?>
        <div class="login_wrapper">

            <div class="animate form login_form">
                <section class="login_content">
                    <form action="auth/signup" method="post">
                        <h1>Sign up</h1>
                        <div>
                            <input type="text" name="data_post[name]" class="form-control" placeholder="Full name"
                                required />
                        </div>
                        <div>
                            <input type="text" name="data_post[username]" class="form-control" placeholder="Username"
                                pattern="[a-zA-Z ]+" required />
                        </div>
                        <div>
                            <input type="password" name="data_post[password]" class="form-control"
                                placeholder="Password" pattern="[a-zA-Z-0-9]+" required />
                        </div>
                        <div style="display: flex; justify-content: space-between ">
                            <button class="btn btn-primary">Sign up</button>
                            <a href="dang-nhap.html" style="color: blue; text-decoration: underline">Đăng nhập</a>
                        </div>
                        <div class="clearfix"></div>
                        <div>
                            <?php if(isset($_SESSION['errors'])){?>
                            <h4 class="text-danger"><?= $redirect->setFlash('errors');  ?></h4>
                            <?php } ?>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>
</body>

</html>