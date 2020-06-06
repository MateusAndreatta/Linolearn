-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Maio-2020 às 01:16
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "-03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `linolearn`
--

DROP SCHEMA IF EXISTS `linolearn`;
CREATE SCHEMA IF NOT EXISTS `linolearn` DEFAULT CHARACTER SET utf8mb4;
USE `linolearn`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `cashback_percentage` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `course`
--

INSERT INTO `course` (`id`, `name`, `description`, `image_path`, `price`, `cashback_percentage`, `owner`) VALUES
(1, 'Aprenda Java na prática!', 'Aprenda Java com o maior deus de todos os javeiros: Andreatta! Neste curso você deixará de ser um programador ruim e será um programador bom usando Springboot e Spring MVC.', NULL, 19.99, 35, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `course_log_transaction`
--

CREATE TABLE `course_log_transaction` (
  `id` int(11) NOT NULL,
  `buyer` int(11) NOT NULL,
  `seller` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `course_price` float NOT NULL,
  `cashback_percentage` int(11) NOT NULL,
  `amount_cashback` float NOT NULL,
  `payment_status` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `payment_status`
--

CREATE TABLE `payment_status` (
  `id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `payment_status`
--

INSERT INTO `payment_status` (`id`, `status`) VALUES
(1, 'Iniciado'),
(2, 'Pendente'),
(3, 'Finalizado'),
(4, 'Erro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `role`
--

INSERT INTO `role` (`id`, `type`, `description`) VALUES
(1, 'user', 'Usuário padrão, ou seja, aluno'),
(2, 'professor', 'Usuário que venderá cursos, ou seja, professor'),
(3, 'administrator', 'Usuário administrador, ou seja, pode editar algumas coisas de cursos, desabilitar usuários, realizar transações'),
(4, 'god', 'Usuário supremo, ou seja, Andreatta');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `wallet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `role`, `wallet`) VALUES
(1, 'Charles', 'Jamil', 'charles.jamil@pucpr.edu.br', '81dc9bdb52d04dc20036dbd8313ed055', 1, 1),
(4, 'Mateus', 'Andreatta', 'god@oracle.com', '93f725a07423fe1c889f448b33d21f46', 4, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `video_watched`
--

CREATE TABLE `video_watched` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `finished` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `coin` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `wallet`
--

INSERT INTO `wallet` (`id`, `user`, `amount`,`coin`) VALUES
(1, 1, 0,0),
(2, 4, 50.51,0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `wallet_log_transaction`
--

CREATE TABLE `wallet_log_transaction` (
  `id` int(11) NOT NULL,
  `id_wallet` int(11) NOT NULL,
  `added_amount` float NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_course_owner_user_idx` (`owner`);

--
-- Índices para tabela `course_log_transaction`
--
ALTER TABLE `course_log_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_transaction_log_course_selled_idx` (`course_id`),
  ADD KEY `fk_transaction_log_user_seller_idx` (`seller`),
  ADD KEY `fk_transaction_log_user_buyer_idx` (`buyer`),
  ADD KEY `fk_transaction_log_payment_status_idx` (`payment_status`);

--
-- Índices para tabela `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`) USING BTREE,
  ADD KEY `wallet_UNIQUE` (`wallet`) USING BTREE,
  ADD KEY `fk_user_role_idx` (`role`) USING BTREE;

--
-- Índices para tabela `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_video_course_id` (`course_id`);

--
-- Índices para tabela `video_watched`
--
ALTER TABLE `video_watched`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_video_watched_course_user_video_id` (`course_id`),
  ADD KEY `fk_video_watched_user_course_video_id` (`id_user`),
  ADD KEY `fk_video_watched_video_user_course_id` (`id_video`);

--
-- Índices para tabela `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_idx` (`user`);

--
-- Índices para tabela `wallet_log_transaction`
--
ALTER TABLE `wallet_log_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wallet_log_transaction_id_wallet` (`id_wallet`),
  ADD KEY `fk_wallet_log_transaction_payment_status` (`payment_status`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `course_log_transaction`
--
ALTER TABLE `course_log_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `video_watched`
--
ALTER TABLE `video_watched`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `wallet_log_transaction`
--
ALTER TABLE `wallet_log_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_course_owner_user` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `course_log_transaction`
--
ALTER TABLE `course_log_transaction`
  ADD CONSTRAINT `fk_transaction_log_course_selled` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transaction_log_payment_status` FOREIGN KEY (`payment_status`) REFERENCES `payment_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transaction_log_user_buyer` FOREIGN KEY (`buyer`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transaction_log_user_seller` FOREIGN KEY (`seller`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `fk_video_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `video_watched`
--
ALTER TABLE `video_watched`
  ADD CONSTRAINT `fk_video_watched_course_user_video_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_video_watched_user_course_video_id` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_video_watched_video_user_course_id` FOREIGN KEY (`id_video`) REFERENCES `video` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `fk_wallet_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limitadores para a tabela `wallet_log_transaction`
--
ALTER TABLE `wallet_log_transaction`
  ADD CONSTRAINT `fk_wallet_log_transaction_id_wallet` FOREIGN KEY (`id_wallet`) REFERENCES `wallet` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wallet_log_transaction_payment_status` FOREIGN KEY (`payment_status`) REFERENCES `payment_status` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
