<?php
session_start();

//conexão
$conn = mysqli_connect("localhost", "root", "", "reserva");

// as variáveis login e senha recebem os dados digitados na página anterior
$email = $_POST['email'];
$senha = $_POST['senha'];

//consulta para verificar se o email e a senha conferem para o usuário comum
$sql_usuario = "SELECT * FROM Usuario WHERE email = '$email' AND senha = '$senha'";
$result_usuario = mysqli_query($conn, $sql_usuario);

//consulta para verificar se o email e a senha conferem para o administrador
$sql_administrador = "SELECT * FROM Administrador WHERE email = '$email' AND senha = '$senha'";
$result_administrador = mysqli_query($conn, $sql_administrador);

if (mysqli_num_rows($result_usuario) > 0) {
    $row = mysqli_fetch_array($result_usuario);

    // Verifica se a senha inserida corresponde à senha no banco de dados
    if ($senha == $row['senha']) {
        $_SESSION['nome_usuario'] = $row['nome'];
        $_SESSION['id_usuario'] = $row['documento_usuario'];
        $_SESSION['email'] = $email; // Adiciona o email à sessão
        $_SESSION['senha'] = $senha; // Adiciona a senha à sessão
        header('location:../index_user.php');
    } else {
        $_SESSION['error'] = "Senha inválida.";
        header('location:../login.php');
    }
} else if (mysqli_num_rows($result_administrador) > 0) {
    $row = mysqli_fetch_array($result_administrador);
    $_SESSION['nome_administrador'] = $row['nome'];
    $_SESSION['id_administrador'] = $row['id_adm'];
    header('location:../index_adm.php');
} else {
    $_SESSION['error'] = "Email ou senha incorretos.";
    header('location:../login.php');
}


    // Consulta para verificar as credenciais do usuário
    $sql = "SELECT * FROM usuario WHERE email = '$email' AND senha = '$senha'";
    $result = $connect->query($sql);

    if ($result->num_rows == 1) {
        // Armazena o email e a senha na sessão
        $_SESSION['email'] = $email;
        $_SESSION['senha'] = $senha;

        // Redireciona para a próxima página após o login bem-sucedido
        header('Location: proxima_pagina.php');
        exit();
    } else {
        // Tratamento para credenciais inválidas
        echo "Credenciais inválidas. Por favor, tente novamente.";
    }

    // removendo todas as sessões   
    session_destroy();
    unset( $_SESSION );    
