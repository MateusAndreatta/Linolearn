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

        <main>
            <div class="container">
                <div class="row">
                    <div class="col s12 m8">
                        <div class="card minhaconta-card">
                            <h3 class="center">Seus dados</h3>
                            <form action="../MinhaContaController" method="post">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input disabled value="${sessionScope.user.getFirstName()}" id="conta_nome" name="nome" type="text" class="validate" >
                                        <label for="conta_nome">Nome</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input disabled value="${sessionScope.user.getLastName()}" id="conta_sobrenome" name="sobrenome" type="text" class="validate">
                                        <label for="conta_sobrenome">Sobrenome</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input disabled value="${sessionScope.user.getEmail()}" id="conta_email" type="text" name="email" class="validate">
                                        <label for="conta_email">E-mail</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">

                                        <%
                                            User user = (User) session.getAttribute("user");
                                            switch (user.getRole()) {
                                                case 1:
                                                    out.print("<input disabled value='Aluno' id='role' name='role' type='text' class='validate'>");
                                                    break;
                                                case 2:
                                                    out.print("<input disabled value='Professor' id='role' type='text' name='role' class='validate'>");
                                                    break;
                                                case 3:
                                                    out.print("<input disabled value='Admin' id='role' type='text' name='role' class='validate'>");
                                                    break;
                                                case 4:
                                                    out.print("<input disabled value='God' id='role' type='text' name='role' class='validate'>");
                                                    break;
                                            }

                                        %>
                                        <label for="role">Categoria</label>
                                    </div>
                                </div>
                                <button class="btn waves-effect waves-light hide" id="btnSubmit" type="submit" name="action">Salvar
                                    <i class="material-icons right">send</i>
                                </button>
                            </form>
                            <a class="waves-effect waves-light btn" id="btnEdit" onClick="enebleInputs()">Editar</a>
                        </div>
                    </div>
                    <div class="col s12 m4">

                        <div class="card minhaconta-card">
                            <h3 class="center">Sua carteira</h3>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input disabled value="${sessionScope.wallet.getAmount()}" id="reais" type="text" class="validate">
                                    <label for="reais">Reais</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input disabled value="${sessionScope.wallet.getCoin()}" id="linocoins" type="text" class="validate">
                                    <label for="linocoins">Linocoins</label>
                                </div>
                            </div>
                            <a class="waves-effect waves-light btn" href="deposito.jsp">Depositos/Retiradas</a>
                        </div>
                    </div>
                </div>
            </div>

        </main>

        <jsp:include page="footer.jsp" />

    </body>
</html>
