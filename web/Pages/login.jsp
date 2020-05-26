<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
          <jsp:param name="title" value="Login"/>
        </jsp:include>
    </head>
    <body class="blue-grey lighten-3">
        <div class="login-container">
            <div class="login-card">
                <form class="col s12 card" method="post" action="../LoginController">
                    <div class="row">
                        <div class="col s12 center">
                            <img src="../imgs/logo-icone.png" class="login-img">
                        </div>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="icon_email" type="text" name="email" class="validate">
                        <label for="icon_email">E-mail</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">lock</i>
                        <input id="icon_password" type="password" name="password" class="validate">
                        <label for="icon_password">Senha</label>
                    </div>
                    <button class="btn waves-effect waves-light" type="submit" name="action">Entrar
                        <i class="material-icons right">send</i>
                    </button>
                </form>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
