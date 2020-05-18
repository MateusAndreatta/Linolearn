<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
            <jsp:param name="title" value="Curso"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container">
            <div class="row card">
                <div class="col s12 m5">
                    <img src="https://picsum.photos/400">
                </div>
                <div class="col s12 m7">
                    <h4>Nome do curso</h4>
                    <h5>Descricao do curso</h5>
                    <div class="progress tooltipped" data-position="bottom" data-tooltip="Você já realizou 70% do curso!">
                        <div class="determinate" style="width: 70%"></div>
                    </div>
                </div>
                <div class="col s12">
                    <h4>Aulas</h4>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="../scripts/js.js"></script>
    </body>
</html>
