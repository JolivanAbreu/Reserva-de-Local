<?php
session_start();

$connect = mysqli_connect("localhost", "root", "", "reserva");

// as variáveis login e senha recebem os dados digitados na página anterior
$senha = $_POST['nova_senha'];

// Verifica se o formulário foi submetido
// Verifica se o formulário foi submetido
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recebe os dados do formulário
    $email = $_POST['email'];
    $nova_senha = $_POST['nova_senha'];

    // Verifica se o email corresponde a um registro no banco de dados
    $sql = "SELECT * FROM usuario WHERE email = '$email'";
    $result = $connect->query($sql);

    if ($result->num_rows > 0) {
        // Atualiza a senha no banco de dados
        $sql_update = "UPDATE usuario SET senha = '$nova_senha' WHERE email = '$email'";
        if ($connect->query($sql_update) === TRUE) {
            echo '<script>alert("Senha alterada com sucesso!"); window.location.href = "../login.php"</script>';
        } else {
            echo '<script>alert("Erro ao alterar senha:"); window.location.href = "../alterar_senha.php"</script>';
        }
    } else {
        echo '<script>alert("Email não encontrado!"); window.location.href = "../alterar_senha.php"</script>';
    }
}
// removendo todas as sessões
session_destroy();
unset($_SESSION);
