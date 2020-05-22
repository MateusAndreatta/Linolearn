<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
            <jsp:param name="title" value="Home"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />

        <div class="carousel carousel-slider center">
            <div class="carousel-fixed-item center">
                <a class="btn waves-effect white grey-text darken-text-2">Ver curso</a>
            </div>
            <div class="carousel-item red white-text" href="#one!">
                <h2>Curso de JSP com o Lino!</h2> 
                <p class="white-text">O melhor curso de JSP da atualidade</p>
            </div>
            <div class="carousel-item amber white-text" href="#two!">
                <h2>Aprenda react do zero!</h2>
                <p class="white-text">This is your second panel</p>
            </div>
            <div class="carousel-item green white-text" href="#three!">
                <h2>Curso de UX/UI avançado</h2>
                <p class="white-text">This is your third panel</p>
            </div>
            <div class="carousel-item blue white-text" href="#four!">
                <h2>Javazão né</h2>
                <p class="white-text">This is your fourth panel</p>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12 m3">
                    <div class="card">
                        <div class="card-image">
                            <img src="https://picsum.photos/200">
                            <span class="card-title">Curso Javascript</span>
                        </div>
                        <div class="card-content">
                            <p>Curso muito bom sobre JS, uma das linguagens mais ultilizadas em toda a WEB!.</p>
                        </div>
                        <div class="card-action">
                            <a href="curso.jsp">Ver curso</a>
                        </div>
                    </div>
                </div>
                <div class="col s12 m3">
                    <div class="card">
                        <div class="card-image">
                            <img src="https://picsum.photos/200">
                            <span class="card-title">Curso Javascript</span>
                        </div>
                        <div class="card-content">
                            <p>Curso muito bom sobre JS, uma das linguagens mais ultilizadas em toda a WEB!.</p>
                        </div>
                        <div class="card-action">
                            <a href="curso.jsp">Ver curso</a>
                        </div>
                    </div>
                </div>
                <div class="col s12 m3">
                    <div class="card">
                        <div class="card-image">
                            <img src="https://picsum.photos/200">
                            <span class="card-title">Curso Javascript</span>
                        </div>
                        <div class="card-content">
                            <p>Curso muito bom sobre JS, uma das linguagens mais ultilizadas em toda a WEB!.</p>
                        </div>
                        <div class="card-action">
                            <a href="curso.jsp">Ver curso</a>
                        </div>
                    </div>
                </div>
                <div class="col s12 m3">
                    <div class="card">
                        <div class="card-image">
                            <img src="https://picsum.photos/200">
                            <span class="card-title">Curso Javascript</span>
                        </div>
                        <div class="card-content">
                            <p>Curso muito bom sobre JS, uma das linguagens mais ultilizadas em toda a WEB!.</p>
                        </div>
                        <div class="card-action">
                            <a href="curso.jsp">Ver curso</a>
                        </div>
                    </div>
                </div>
                <div class="col s12 m3">
                    <div class="card">
                        <div class="card-image">
                            <img src="https://picsum.photos/200">
                            <span class="card-title">Curso Javascript</span>
                        </div>
                        <div class="card-content">
                            <p>Curso muito bom sobre JS, uma das linguagens mais ultilizadas em toda a WEB!.</p>
                        </div>
                        <div class="card-action">
                            <a href="curso.jsp">Ver curso</a>
                        </div>
                    </div>
                </div>
                <div class="col s12 m3">
                    <div class="card">
                        <div class="card-image">
                            <img src="https://picsum.photos/200">
                            <span class="card-title">Curso Javascript</span>
                        </div>
                        <div class="card-content">
                            <p>Curso muito bom sobre JS, uma das linguagens mais ultilizadas em toda a WEB!.</p>
                        </div>
                        <div class="card-action">
                            <a href="curso.jsp">Ver curso</a>
                        </div>
                    </div>
                </div>
                <div class="col s12 m3">
                    <div class="card">
                        <div class="card-image">
                            <img src="https://picsum.photos/200">
                            <span class="card-title">Curso Javascript</span>
                        </div>
                        <div class="card-content">
                            <p>Curso muito bom sobre JS, uma das linguagens mais ultilizadas em toda a WEB!.</p>
                        </div>
                        <div class="card-action">
                            <a href="curso.jsp">Ver curso</a>
                        </div>
                    </div>
                </div>
                <div class="col s12 m3">
                    <div class="card">
                        <div class="card-image">
                            <img src="https://picsum.photos/200">
                            <span class="card-title">Curso Javascript</span>
                        </div>
                        <div class="card-content">
                            <p>Curso muito bom sobre JS, uma das linguagens mais ultilizadas em toda a WEB!.</p>
                        </div>
                        <div class="card-action">
                            <a href="curso.jsp">Ver curso</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="../scripts/js.js"></script>
        <jsp:include page="footer.jsp" />
    </body>
</html>
