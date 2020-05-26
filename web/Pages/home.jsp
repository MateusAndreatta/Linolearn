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
        <div class="container">
        <h3>Olá ${sessionScope.user.getFirstName()}</h3>
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
        <jsp:include page="footer.jsp" />
    </body>
</html>
