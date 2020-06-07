-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Jun-2020 às 19:26
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `linolearn`
--
DROP SCHEMA IF EXISTS `linolearn`;
CREATE SCHEMA IF NOT EXISTS `linolearn` DEFAULT CHARACTER SET utf8mb4 ;
USE `linolearn` ;

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
(1, 'Curso de HTML5', 'Aprenda tudo sobre HTML5, nesse curso você irá criar um site completo - by Gustavo Guanabara', 'cursohtml5.png', 19.99, 15, 4);

INSERT INTO `course` (`id`, `name`, `description`, `image_path`, `price`, `cashback_percentage`, `owner`) VALUES
(2, 'Aprenda CSS3!', 'Neste curso você aprenderá como estlizar páginas usando CSS! Ensinaremos como fazer o estilo de sites com os principais atributos usados.', 'cursoCSS.png', 19.99, 15, 4);

INSERT INTO `course` (`id`, `name`, `description`, `image_path`, `price`, `cashback_percentage`, `owner`) VALUES
(3, 'Javascript Essencial', 'Nesse curso eu vou ensinar  a base e os fundamentos do Javascript, uma linguagem de programação client-side, amplamente em aplicações web.', 'cursoJs.jpg', 29.99, 15, 4);

INSERT INTO `course` (`id`, `name`, `description`, `image_path`, `price`, `cashback_percentage`, `owner`) VALUES
(4, 'Curso Python', 'Neste curso você irá aprender Python do básico ao avançado e alavanque sua carreira!', 'cursoPython.png', 39.99, 15, 4);

INSERT INTO `course` (`id`, `name`, `description`, `image_path`, `price`, `cashback_percentage`, `owner`) VALUES
(5, 'Curso PHP Iniciante', 'Aula do Curso de PHP para Iniciantes criado pelo professor Gustavo Guanabara para o portal CursoemVideo.com.', 'cursoPHP.jpg', 59.99, 15, 4);

INSERT INTO `course` (`id`, `name`, `description`, `image_path`, `price`, `cashback_percentage`, `owner`) VALUES
(6, 'Aprenda C#', 'Aprenda como fazer programas em C# sem nenhum conhecimento prévio!', 'cursoC.jpg', 39.99, 15, 4);

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
  `amount_cashback` float NULL,
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

--
-- Extraindo dados da tabela `video`
--

INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES
(1, 1, 'Introdução', 'HTML5 é uma linguagem de marcação hipertexto utilizada para criar sites. A versão 5 da linguagem foi homologada e lançada a partir de 2009, mas só ganhou mercado no final de 2012 com o surgimento dos grandes navegadores compatíveis.', 'epDCjksKMok'),
(2, 1, 'História da Internet', 'Nesta primeira aula, aprenda como a Internet surgiu e evoluiu até o que temos hoje em dia. Um apanhado geral de todos os inventores e invenções que fizeram parte da evolução da maior rede mundial.', 'rsFCVjr5yxc'),
(3, 1, 'História da HTML', 'Você sabe como surgiu a linguagem HTML? Conhece a evolução desde a HTML1 até HTML5? Sabe quais são as principais funções W3C? Veja nessa aula a resposta para todas essas perguntas e muito mais.', 'NSmapCNcSyI'),
(4, 1, 'Como Funciona a Internet', 'Aula do Curso de HTML5 criado pelo professor Gustavo Guanabara para o portal CursoemVideo.com.', 'LMfeZ6XD0No'),
(5, 1, 'Primeiro Exemplo em HTML5', 'Aula 100% prática de HTML5 com CSS3. Conheça as tags básicas e saiba como criar um documento no novo padrão.', 'yCSSsBNBzso');

INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (6, '2', 'Link de CSS em documentos HTML', 'Aprenda as formas de linkar documentos HTML e CSS para estilizar seu site!', 'FRhM6sMOTfg');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (7, '2', 'Alterar Fontes', 'Aprenda a estilizar suas fontes, mudando seu tipo, tamanho e outros atributos principais', 'x2ILBeqF21s');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (8, '2', 'Alterar Espaçamento', 'Aprenda como alterar o espaçamento entre os elemntos de um site através de padding e margin', '5TIhtyMDr90');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (9, '2', 'Alinhamento de objetos', 'Aprenda como alinhar os itens que estão dentro de tags!', 'pZHiwetBSFQ');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (10, '2', 'Mudar cores em CSS', 'Aprenda como alterar cores de fontes, fundos, bordas e outros atributos', 'T_PJE8voLF4');

INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (11, '3', 'Introdução', 'O que precisa saber para começar a programar em JavaScript!', 'ipHuSfOYhwA');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (12, '3', 'Variáveis e tipos de dados', 'Nessa aula vou falar sobre a sintaxe básica da linguagem e também sobre variáveis e tipos de dados.', 'ZW02MWzZXPE');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (13, '3', 'Funções', 'Nessa aula você vai aprender o que são e pra que servem as funções, além de ver exemplos de uso e aprender ainda sobre o escopo de variáveis: locais ou globais.', 'TWmlIbvTjRo');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (14, '3', 'Objetos e Arrays', 'Nessa aula eu vou falar sobre Objetos e Arrays, dois tipos de variáveis que podem armazenar múltiplas informações facilitando nossa vida em muitas situações. Além de aprender os detalhes sobre cada tipo, você vai entender também as diferenças e quando é indicado usar cada um deles.', '2sZerMlCzBM');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (15, '3', 'Strings e números', 'Na aula de hoje vamos falar sobre variáveis do tipo STRING e também NUMÉRICAS, e aprender algumas funções básicas para manipular ou executar ações com esses tipos de variáveis.', 'rDfpq25OP_Q');

INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (16, '4', 'Seja um Programador', 'Você está pensando em ser um Programador e não sabe por onde começar? Pois nessa aula vamos te dar todas as informações e mostrar o caminho a seguir.', 'S9uPNppGsGo');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (17, '4', 'Para que serve o Python?', 'De onde vem o Python? Por que esse nome? Quais são as grandes empresas mundiais que usam Python em seus softwares? Essas e muitas outras perguntas serão respondidas nessa aula. ', 'Mp0vhMDI7fA');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (18, '4', 'Instalando o Python3 e o IDLE', 'Entenda como funciona um Interpretador e veja como o Python funciona. Depois aprenda como instalar o Python 3.0 e o IDLE em seu computador com Windows, Linux ou Mac OS.', 'VuKvR1J2LQE');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (19, '4', 'Primeiros comandos em Python3', 'Agora chegou a hora de aprender os comandos básicos do Python e fazer os primeiros programas em Linguagem Python.', '31llNGKWDdo');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (20, '4', 'Instalando o PyCharm e o QPython3', 'Nesta aula, veremos como instalar e configurar a IDE (Integrated Development Environment) Python chamada PyCharm no Windows, MacOS e Linux. Além disso, veremos como programar Python no Android, utilizando o QPython3.', 'ElRd0cbXIv4');

INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (21, '5', 'História do PHP', 'A Linguagem PHP começou em 1994, quando Rasmus Lerdorf resolveu criar um gerenciador de visitas para o seu site. Sua primeira criação não era uma linguagem, e sim uma ferramenta. Batizada de Personal Home Page, usava comandos simples inspirados da linguagem PERL.', 'F7KzJ7e6EAc');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (22, '5', 'Como funciona o PHP', 'Como funciona o PHP? Como transformar meu computador em um servidor? Como funciona tecnologias server-side? Qual é a diferença entre tecnologias PHP, ASP, JSP e etc? A segunda aula do seu Curso de PHP do Curso em Vídeo vai responder a essas e muitas outras perguntas que normalmente são feitas por quem está iniciando seus estudos em PHP.', 'Eup6utTPe2U');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (23, '5', 'Como Instalar o PHP', 'Nessa aula você vai aprender como instalar um servidor PHP no seu computador e vai ver como criar o seu primeiro exemplo de código PHP: o "Olá, Mundo!".', '3ltZBbKACh4');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (24, '5', 'Variáveis em PHP', 'Como criar variáveis em PHP? Como declarar variáveis em PHP? Quais são os tipos primitivos do PHP? Como realizar conversões em PHP? A resposta para essas e muitas outras perguntas você vai ter nessa quarta aula', 'DGZS9KrlrjI');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (25, '5', 'Operadores Aritméticos', 'Como fazer contas no PHP? Como realizar somas, multiplicações e mais? Exponenciações em PHP? Raiz quadrada em PHP?', 'fCZdbl9-qkw');

INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (26, '6', 'Introdução', 'Na aula de hoje do curso programação C#, vamos baixar todo conteúdo necessário, instalar as ferramentas e configurar tudo para que possamos aprende a programar em C#.', 'dVzJ3bx68FA');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (27, '6', 'Primeiro programa no padrão c# .net', 'Na aula de hoje do curso programação C#, vamos criar nosso primeiro programa no padrão C# .net (dotnet). Aproveitando o embalo vamos aprender de forma bastante resumida como obter os parâmetros de execução do programa.', '2cGjyyw5ifQ');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (28, '6', 'Conhecendo Variáveis', 'Na aula de hoje do curso programação C#, vamos aprender sobre variáveis, vamos falar sobre os tipos de dados, como criar uma variável, atribuir um valor e ler o valor armazenado na variável.', '25gWhVRRYDI');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (29, '6', 'Escopo de variáveis', 'Na aula de hoje do curso programação C#, vamos aprender sobre escopo de variáveis, basicamente onde as variáveis declaradas são visíveis dentro do nosso programa. Falaremos de variáveis globais e variáveis locais. Assuntos muito importantes para nosso curso de programação em C#.', '1tsK4u4Hmck');
INSERT INTO `video` (`id`, `course_id`, `name`, `description`, `path`) VALUES (30, '6', 'Operadores e Operações', 'Na aula de hoje do curso programação C#, vamos aprender sobre operadores e operações. Vamos aprender operações matemáticas, relacionais / lógicas / comparação, atribuições, etc.', 'f8rDk6nJ9DE');


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

INSERT INTO `wallet` (`id`, `user`, `amount`, `coin`) VALUES
(1, 1, 0, 0),
(2, 4, 70.5, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `video_watched`
--
ALTER TABLE `video_watched`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_course_owner_user` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `course_log_transaction`
--
ALTER TABLE `course_log_transaction`
  ADD CONSTRAINT `fk_transaction_log_course_selled` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transaction_log_payment_status` FOREIGN KEY (`payment_status`) REFERENCES `payment_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transaction_log_user_buyer` FOREIGN KEY (`buyer`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transaction_log_user_seller` FOREIGN KEY (`seller`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `fk_video_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `video_watched`
--
ALTER TABLE `video_watched`
  ADD CONSTRAINT `fk_video_watched_course_user_video_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_video_watched_user_course_video_id` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_video_watched_video_user_course_id` FOREIGN KEY (`id_video`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `fk_wallet_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
