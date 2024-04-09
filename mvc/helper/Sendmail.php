<?php
    require_once "./mvc/core/constant.php";
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
    require './mvc/helper/vendor/phpmailer/phpmailer/src/Exception.php';
    require './mvc/helper/vendor/phpmailer/phpmailer/src/PHPMailer.php';
    require './mvc/helper/vendor/phpmailer/phpmailer/src/SMTP.php';
    require_once './mvc/helper/vendor/autoload.php';
    class SendMail extends controller{
        function send($subject, $mailTo, $contents, $ccmail){
            ob_start();
            $mail = new PHPMailer(true);
            $mail->isSMTP();
            $mail->SMTPDebug = 2;
            $mail->Host = HOST;
            $mail->Port = 587;
            $mail->SMTPAuth = true;
            $mail->Username = USERNAME;
            $mail->Password = PASSWORD;
            $mail->SMTPSecure = SMTPSECURE;
            $mail->setFrom(FORM, FORMSUBJECT);
            $mail->CharSet = 'UTF-8';
            $mail->addCC($ccmail);
            // $mail->addReplyTo($mailTo, 'ABC TEST YOUR');
            $mail->addAddress($mailTo, 'Receiver ME');
            $mail->isHTML(true);
            $mail->Subject = $subject;
            $mail->Body = $contents;
            // $mail->AltBody = 'Plain Text Content';
            //$mail->addAttachment('test.txt');
            if (!$mail->send()) {
                return false;
            } else {
               return true;
            }
            ob_end_clean();

        }
    }
?>