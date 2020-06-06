<%@page import="java.util.List"%>
<%@page import="Model.Course"%>
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
                <%
                    for (Course c : (List<Course>) request.getSession().getAttribute("buyedCourses")) {
                %>

                <div class="col s12 m3">
                    <div class="card">
                        <div class="card-image">
                            <img src="../imgs/uploads/<%out.print(c.getImagePath());%>">
                            <span class="card-title"><%out.print(c.getName());%></span>
                        </div>
                        <div class="card-content">
                            <p><%out.print(c.getDescription());%></p>
                        </div>
                        <div class="card-action">
                            <a href="../CourseController?id=<%out.print(c.getId());%>">Ver curso</a>
                        </div>
                    </div>
                </div>

                <%
                    }
                %>
            </div>
            
            <%

                User user = (User) session.getAttribute("user");
                if (user.getRole() > 1) {
            %>
            <h4>Cursos criados</h4>
            <div class="row">
                <%
                    for (Course c : (List<Course>) request.getSession().getAttribute("createdCourses")) {
                %>

                <div class="col s12 m3">
                    <div class="card">
                        <div class="card-image">
                            <img src="../imgs/uploads/<%out.print(c.getImagePath());%>">
                            <span class="card-title"><%out.print(c.getName());%></span>
                        </div>
                        <div class="card-content">
                            <p><%out.print(c.getDescription());%></p>
                        </div>
                        <div class="card-action">
                            <!--<a href="curso.jsp">Ver curso</a>-->
                            <a href="../CourseController?id=<%out.print(c.getId());%>">Ver curso</a>
                        </div>
                    </div>
                </div>

                <%
                    }
                %>
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
        <jsp:include page="footer.jsp" />
    </body>
</html>
