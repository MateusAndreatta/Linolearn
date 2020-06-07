<%@page import="java.util.List"%>
<%@page import="Model.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
            <jsp:param name="title" value="Início"/>
        </jsp:include>
    </head>
    <body>

        <jsp:include page="navbar.jsp" />

        <main>
            <div class="container">

                <div class="row">
                    <div class="col s12 m3">
                        <h4>Olá ${sessionScope.user.getFirstName()}</h4>
                    </div>
                </div>

                <div class="row">

                    <%
                        for (Course c : (List<Course>) request.getSession().getAttribute("cursos")) {
                    %>

                    <div class="col s12 m3">
                        <div class="card">
                            <div class="card-image">
                                <img src="../imgs/uploads/<%out.print(c.getImagePath());%>">
                            </div>
                            <div class="card-content">
                                <span class="card-title bold"><%out.print(c.getName());%></span>
                                <p><%out.print(c.getDescription());%></p>
                                <br />
                                <p>R$ <% out.print(c.getPrice()); %> - Cb <b><% out.print(c.getCashbackPercentage()); %>%</b></p>
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
            </div>
        </main>
        <jsp:include page="footer.jsp" />
    </body>
</html>
