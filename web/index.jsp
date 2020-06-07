<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Linolearn - Sua plataforma de ensino com Cashback!</title>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <nav class="blue" role="navigation">
            <div class="nav-wrapper container">

                <a id="logo-container" href="/Linolearn/index.jsp" class="brand-logo" style="display: flex;flex-direction: row;justify-content: center;align-items: center;">
                    <img src="imgs/linocoin.png" alt="Linolearn" width="40px" style="background: white; margin-right: 10px;" />  Linolearn
                </a>

                <ul class="right hide-on-med-and-down">
                    <li><a href="Pages/login.jsp">Acessar</a></li>
                    <li><a href="Pages/cadastro.jsp">Cadastrar</a></li>
                </ul>

                <ul id="nav-mobile" class="sidenav">
                    <li><a href="Pages/login.jsp">Acessar</a></li>
                    <li><a href="Pages/cadastro.jsp">Cadastrar</a></li>
                </ul>
                <a href="#" data-target="nav-mobile" class="sidenav-trigger">
                    <i class="material-icons">menu</i></a>
            </div>
        </nav>

        <div class="section no-pad-bot" id="index-banner">
            <div class="container">
                <br><br>
                <h1 class="header center red-text">Ganhe ap�s aprender!</h1>
                <div class="row center">
                    <h5 class="header col s12 light">Plataforma web para aprendizado com cashback!</h5>
                </div>
                <div class="row center">
                    <a href="Pages/cadastro.jsp" id="download-button" class="btn-large waves-effect waves-light red">Cadastre-se</a>
                </div>
                <br><br>

            </div>
        </div>


        <div class="container">
            <div class="section">

                <!--   Icon Section   -->
                <div class="row">
                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center "><i class="material-icons">flash_on</i></h2>
                            <h5 class="center">Aprendizado pr�tico</h5>

                            <p class="light">Os melhores professores est�o aqui. 
                                Aulas pr�ticas (hands on) com as tecnologias mais atuais do mercado (como JSP sem ORM). 
                                Tudo em s� um lugar! Aqui na Linolearn � onde voc� aprende e decola na carreira!
                            </p>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center "><i class="material-icons">group</i></h2>
                            <h5 class="center">Usu�rios Primeiro</h5>

                            <p class="light">
                                Nossa plataforma � focada em User First. Possui interface de f�cil intera��o com responsividade e textos adaptados para os mais diversos usu�rios.
                                Tamb�m contamos com uma forma de motiva��o ao usu�rio para terminar o curso: O cashback. Este cashback pode ser usado em todo o site e n�o depende de cursos, assim o usu�rio define como quer usar, quando quiser usar!
                            </p>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center "><i class="material-icons">settings</i></h2>
                            <h5 class="center">Como funciona</h5>

                            <p class="light">O cashback � universal e utiliza a moeda Linocoin (LCN). Ap�s o usu�rio concluir um determinado curso ele poder� solicitar o resgate do seu cashback, e imediatamente o valor � adicionado ao seu valor de carteira, assim, poder� utilizar onde quiser e quando quiser! Pr�tico, simples e o melhor: VOC� controle!</p>
                        </div>
                    </div>
                </div>

            </div>
            <br><br>
        </div>

        <jsp:include page="Pages/footer.jsp" />


        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="scripts/materialize.js"></script>
        <script src="scripts/js.js"></script>

    </body>
</html>
