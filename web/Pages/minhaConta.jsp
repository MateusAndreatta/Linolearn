<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
            <jsp:param name="title" value="Minha conta"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container">
            <div class="row">
                <div class="col s12 m8">
                    <div class="card minhaconta-card">
                        <h3 class="center">Seus dados</h3>
                        <div class="row">
                            <div class="input-field col s12">
                                <input disabled value="${sessionScope.user.getFirstName()}" id="first_name" type="text" class="validate" >
                                <label for="first_name">Nome</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input disabled value="${sessionScope.user.getLastName()}" id="last_name" type="text" class="validate">
                                <label for="last_name">Sobrenome</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input disabled value="${sessionScope.user.getEmail()}" id="email" type="text" class="validate">
                                <label for="email">E-mail</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">

                                <%
                                    User user = (User) session.getAttribute("user");
                                    switch (user.getRole()) {
                                        case 1:
                                            out.print("<input disabled value='Aluno' id='role' type='text' class='validate'>");
                                            break;
                                        case 2:
                                            out.print("<input disabled value='Professor' id='role' type='text' class='validate'>");
                                            break;
                                        case 3:
                                            out.print("<input disabled value='Admin' id='role' type='text' class='validate'>");
                                            break;
                                        case 4:
                                            out.print("<input disabled value='God' id='role' type='text' class='validate'>");
                                            break;
                                    }

                                %>
                                <label for="role">Categoria</label>
                            </div>
                        </div>
                        <a class="waves-effect waves-light btn">Editar</a>
                    </div>
                </div>
                <div class="col s12 m4">

                    <div class="card minhaconta-card">
                        <h3 class="center">Sua carteira</h3>
                        <div class="row">
                            <div class="input-field col s12">
                                <input disabled value="44.32" id="reais" type="text" class="validate">
                                <label for="reais">Reais</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input disabled value="5" id="linocoins" type="text" class="validate">
                                <label for="linocoins">Linocoins</label>
                            </div>
                        </div>
                        <a class="waves-effect waves-light btn" href="deposito.jsp">Depositar</a>
                    </div>
                </div>



            </div>

        </div>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="../scripts/js.js"></script>
    </body>
</html>
