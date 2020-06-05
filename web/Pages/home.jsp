<%@page import="java.util.List"%>
<%@page import="Model.Course"%>
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

                <%
                    for (Course c : (List<Course>) request.getSession().getAttribute("cursos")) {
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

        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
