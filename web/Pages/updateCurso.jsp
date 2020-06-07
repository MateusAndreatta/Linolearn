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
                <h2 class="center">Alterar curso ${sessionScope.course.getId()}</h2>
                <form class="col s12 card" method="post" action="../CourseController">
                    <input type="hidden" value="${sessionScope.course.getId()}" name="courseId">
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="nome" type="text" class="validate" value="${sessionScope.course.getName()}" name="nome" required>
                            <label for="nome">Nome</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="descricao" type="text" class="validate" value="${sessionScope.course.getDescription()}" name="descricao" required>
                            <label for="descricao">Descricao</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m6">
                            <input id="preco" type="text" class="validate" value="${sessionScope.course.getPrice()}" name="preco" required>
                            <label for="preco">Preço</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <input id="cashback" type="text" class="validate" value="${sessionScope.course.getCashbackPercentage()}" name="porcentagem" required>
                            <label for="cashback">Porcentagem de cashback</label>
                        </div>
                    </div>
                    <button class="btn waves-effect waves-light margin-botton" type="submit" name="action">Salvar
                        <i class="material-icons right">send</i>
                    </button>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
