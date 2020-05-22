<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
            <jsp:param name="title" value="Novo curso"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container">
            <div class="row">
                <h2 class="center">Criar curso</h2>
                <form class="col s12 card cadastro-form" method="post" action="../CadastroCursoController">
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="nome" type="text" class="validate">
                            <label for="nome">Nome</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="descricao" type="password" class="validate">
                            <label for="descricao">Descricao</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m6">
                            <input id="preco" type="text" class="validate">
                            <label for="preco">Preço</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <input id="cashback" type="text" class="validate">
                            <label for="cashback">Porcentagem de cashback</label>
                        </div>
                    </div>
                    <div class="file-field input-field">
                        <div class="btn">
                            <span>Capa do curso</span>
                            <input type="file">
                        </div>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <button class="btn waves-effect waves-light" type="submit" name="action">Cadastrar
                        <i class="material-icons right">send</i>
                    </button>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="../scripts/js.js"></script>
    </body>
</html>
