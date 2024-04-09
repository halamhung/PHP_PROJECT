<?php
    require_once "./mvc/core/redirect.php";
    $redirect = new redirect();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $title ?></title>
    <meta http-equiv="content-security-policy|content-type|default-style|refresh">
</head>

<body>
    <link rel="stylesheet" href="public/build/css/info.css">
    <section class="info__container">
        <?php require_once './mvc/views/frontend/info/'.$page.'.php'; ?>
        <?php if(isset($_SESSION['flash'])){?>
        <div class="message">
            <p class="text-success"><?= $redirect->setFlash('flash');  ?></p>
        </div>
        <?php } ?>
    </section>
</body>

</html>