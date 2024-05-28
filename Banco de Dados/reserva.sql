-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/05/2024 às 17:49
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `reserva`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `administrador`
--

CREATE TABLE `administrador` (
  `id_adm` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `documento_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `administrador`
--

INSERT INTO `administrador` (`id_adm`, `email`, `senha`, `documento_usuario`) VALUES
(1, 'adm1@gmail.com', 'root', 2147483647);

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco_local`
--

CREATE TABLE `endereco_local` (
  `id_endereco` int(11) NOT NULL,
  `fk_local` int(11) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco_usuario`
--

CREATE TABLE `endereco_usuario` (
  `id_endereco` int(11) NOT NULL,
  `documento_usuario` int(11) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `local`
--

CREATE TABLE `local` (
  `id_local` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `capacidade` int(11) NOT NULL,
  `fk_tipo_local` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `recurso`
--

CREATE TABLE `recurso` (
  `id_recurso` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `disponibilidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `fk_local` int(11) NOT NULL,
  `fk_documento_usuario` int(11) NOT NULL,
  `data_hora_inicio` varchar(10) NOT NULL,
  `data_hora_termino` varchar(10) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `finalidade_reserva` varchar(50) NOT NULL,
  `numero_participantes` int(11) NOT NULL,
  `observacoes` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva_recurso`
--

CREATE TABLE `reserva_recurso` (
  `fk_reserva` int(11) NOT NULL,
  `fk_recurso` int(11) NOT NULL,
  `quantidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone_usuario`
--

CREATE TABLE `telefone_usuario` (
  `id_telefone` int(11) NOT NULL,
  `fk_documento_usuario` int(11) NOT NULL,
  `ddd` varchar(5) NOT NULL,
  `numero` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_local`
--

CREATE TABLE `tipo_local` (
  `id_tipo_local` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `documento_usuario` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`documento_usuario`, `nome`, `email`, `senha`) VALUES
(2147483647, 'root', 'root@gmail.com', '1234');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_adm`),
  ADD KEY `documento_usuario` (`documento_usuario`);

--
-- Índices de tabela `endereco_local`
--
ALTER TABLE `endereco_local`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `fk_local` (`fk_local`);

--
-- Índices de tabela `endereco_usuario`
--
ALTER TABLE `endereco_usuario`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `documento_usuario` (`documento_usuario`);

--
-- Índices de tabela `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`id_local`),
  ADD KEY `fk_tipo_local` (`fk_tipo_local`);

--
-- Índices de tabela `recurso`
--
ALTER TABLE `recurso`
  ADD PRIMARY KEY (`id_recurso`);

--
-- Índices de tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `fk_local` (`fk_local`),
  ADD KEY `fk_documento_usuario` (`fk_documento_usuario`);

--
-- Índices de tabela `reserva_recurso`
--
ALTER TABLE `reserva_recurso`
  ADD KEY `fk_reserva` (`fk_reserva`);

--
-- Índices de tabela `telefone_usuario`
--
ALTER TABLE `telefone_usuario`
  ADD PRIMARY KEY (`id_telefone`),
  ADD KEY `fk_documento_usuario` (`fk_documento_usuario`);

--
-- Índices de tabela `tipo_local`
--
ALTER TABLE `tipo_local`
  ADD PRIMARY KEY (`id_tipo_local`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`documento_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_adm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `endereco_local`
--
ALTER TABLE `endereco_local`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco_usuario`
--
ALTER TABLE `endereco_usuario`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `local`
--
ALTER TABLE `local`
  MODIFY `id_local` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `recurso`
--
ALTER TABLE `recurso`
  MODIFY `id_recurso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `telefone_usuario`
--
ALTER TABLE `telefone_usuario`
  MODIFY `id_telefone` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_local`
--
ALTER TABLE `tipo_local`
  MODIFY `id_tipo_local` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`documento_usuario`) REFERENCES `usuario` (`documento_usuario`);

--
-- Restrições para tabelas `endereco_local`
--
ALTER TABLE `endereco_local`
  ADD CONSTRAINT `endereco_local_ibfk_1` FOREIGN KEY (`fk_local`) REFERENCES `endereco_local` (`id_endereco`);

--
-- Restrições para tabelas `endereco_usuario`
--
ALTER TABLE `endereco_usuario`
  ADD CONSTRAINT `endereco_usuario_ibfk_1` FOREIGN KEY (`documento_usuario`) REFERENCES `usuario` (`documento_usuario`);

--
-- Restrições para tabelas `local`
--
ALTER TABLE `local`
  ADD CONSTRAINT `local_ibfk_1` FOREIGN KEY (`fk_tipo_local`) REFERENCES `tipo_local` (`id_tipo_local`);

--
-- Restrições para tabelas `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`fk_local`) REFERENCES `local` (`id_local`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`fk_documento_usuario`) REFERENCES `recurso` (`id_recurso`);

--
-- Restrições para tabelas `reserva_recurso`
--
ALTER TABLE `reserva_recurso`
  ADD CONSTRAINT `reserva_recurso_ibfk_1` FOREIGN KEY (`fk_reserva`) REFERENCES `reserva` (`id_reserva`);

--
-- Restrições para tabelas `telefone_usuario`
--
ALTER TABLE `telefone_usuario`
  ADD CONSTRAINT `telefone_usuario_ibfk_1` FOREIGN KEY (`fk_documento_usuario`) REFERENCES `usuario` (`documento_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
