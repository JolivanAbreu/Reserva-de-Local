<?php
    session_start();
    unset ($_SESSION['email']);
    unset ($_SESSION['senha']);
    unset ($_SESSION['id_adm']);
    session_destroy();
    header('location:../index_adm.php');
    exit();
?>