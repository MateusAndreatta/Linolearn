<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
            <jsp:param name="title" value="Nova aula"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container">
            <div class="row">
                <h2 class="center">Atualizar aula</h2>
                <form class="col s12 card cadastro-form" method="post" action="../VideoController">
                    <input type="hidden" name="courseID" value="<%out.print(request.getParameter("id"));%>">
                    <input type="hidden" name="videoID" value="${sessionScope.video.getId()}">
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="nome" type="text" class="validate" value="${sessionScope.video.getName()}" name="nome" required>
                            <label for="nome">Nome</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="youtubeID" type="text" class="validate" value="${sessionScope.video.getPath()}"  name="path" required>
                            <label for="youtubeID">Youtube ID</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <textarea id="descricao" class="materialize-textarea" name="descricao" required>${sessionScope.video.getDescription()}</textarea>
                            <label for="descricao">Descricao</label>
                        </div>
                    </div>
                    <button class="btn waves-effect waves-light margin-botton" type="submit" name="action" value="edit">Salvar
                        <i class="material-icons right">send</i>
                    </button>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
