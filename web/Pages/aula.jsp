<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
            <jsp:param name="title" value="Video-aula"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container">
            <div class="row card">
                <div class="col s12">
                    <iframe id="ytplayer" type="text/html" width="640" height="360"
                            src="https://www.youtube.com/embed/M7lc1UVf-VE?autoplay=1"
                            frameborder="0"></iframe>
                </div>
                <div class="col s12 m7">
                    <h4>Aula 01</h4>
                    <p>Nessa aula vemos sobre CRUD com jsp</p>
                    <button class="btn">Concluir</button>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="../scripts/js.js"></script>
    </body>
</html>
