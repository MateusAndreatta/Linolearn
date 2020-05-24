<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
            <jsp:param name="title" value="Cadastro"/>
        </jsp:include>
    </head>
    <body class="blue-grey lighten-3">
        <div class="container">
            <div class="row">
                <h2 class="center">Cadastro</h2>
                <form class="col s12 card cadastro-form" method="post" action="../CadastroController">
                    <div class="row">
                        <div class="input-field col s12 m6">
                            <input id="first_name" type="text" name="firstname" class="validate">
                            <label for="first_name">Nome</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <input id="last_name" type="text" name="lastname" class="validate">
                            <label for="last_name">Sobrenome</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m6">
                            <input id="password" type="password" name="password" class="validate">
                            <label for="password">Senha</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <input id="email" type="email" name="email" class="validate">
                            <label for="email">Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m6">
                            <select name="role">
                                <option value="" disabled selected>Perfil</option>
                                <option value="1">Aluno</option>
                                <option value="2">Professor</option>
                            </select>
                            <!--<label></label>-->
                        </div>
                        <button class="btn waves-effect waves-light right" style="margin-right: 10px" type="submit" name="action">Cadastrar
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="../scripts/js.js"></script>
    </body>
</html>
