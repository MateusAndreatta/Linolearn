<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
            <jsp:param name="title" value="Meus cursos"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container">
            <h4>Cursos adquiridos</h4>
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
            </div>
            
            <%

                User user = (User) session.getAttribute("user");
                if (user.getRole() > 1) {
            %>
            <h4>Cursos criados</h4>
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
            </div>
            <div class="row">
                <div class="col s12">
                    <a class="waves-effect waves-light btn" href="cadastroCurso.jsp">Criar novo curso</a>
                </div>
            </div>
            <%
                }
            %>
            
        </div>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="../scripts/js.js"></script>
    </body>
</html>
