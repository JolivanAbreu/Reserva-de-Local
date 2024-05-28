<?php
    session_start();

    $connect = mysqli_connect("localhost", "root", "", "reserva");
    
    if(isset($_POST['documento_usuario']) && isset($_POST['nome']) && isset($_POST['email']) && isset($_POST['senha'])) {
        $documento = trim($_POST['documento_usuario']);
        $nome = trim($_POST['nome']);
        $email = trim($_POST['email']);
        $senha = $_POST['senha'];
        
        // Verifica se todos os campos estão preenchidos
        if(!empty($documento) && !empty($nome) && !empty($email) && !empty($senha)) {
            $sql = "INSERT INTO Usuario (documento_usuario, nome, email, senha) 
                    VALUES ('$documento', '$nome', '$email', '$senha')";
            $result = $connect->query($sql);
            
            if ($result) {
                echo '<script>alert("Usuário cadastrado com sucesso!"); window.location.href = "../index_user.php"</script>';
            } else {
                echo '<script>alert("Erro ao cadastrar usuário."); window.location.href = "../login.php"</script>';
            }
        } else {
            echo '<script>alert("Por favor, preencha todos os campos."); window.location.href = "../login.php"</script>';
        }
    } else {
        echo '<script>alert("Por favor, preencha todos os campos."); window.location.href = "../login.php"</script>';
    }

?>
