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
                    <div class="progress">
                        <div class="determinate" style="width: 70%"></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
