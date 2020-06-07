<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
            <jsp:param name="title" value="Login"/>
        </jsp:include>

    </head>
    
    <jsp:include page="../Pages/public/navbar.jsp" />
    
    
    <body>
        <div class="login-container">
            <div class="login-card" style="margin-top: 10%;">
                <form class="col s12 card" method="post" action="../LoginController">
                    <div class="row">
                        <div class="col s12 center">
                            <img src="../imgs/logo-icone.png" class="login-img">
                        </div>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="icon_email" type="text" name="email" class="validate" required>
                        <label for="icon_email">E-mail</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">lock</i>
                        <input id="icon_password" type="password" name="password" class="validate" required>
                        <label for="icon_password">Senha</label>
                    </div>
                    <div class="input-field col s12" style="height: 20px;">
                        <button class="btn green right waves-effect waves-light" type="submit" name="action">Acessar
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <%
            if (request.getParameter("erro") != null) {

        %>
        <script>
            M.toast({html: 'Email/Senha incorreto'});
        </script>
        <%                }
        %>

        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="../scripts/js.js"></script>

    </body>
</html>
