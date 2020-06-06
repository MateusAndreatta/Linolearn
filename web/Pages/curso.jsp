<%@page import="Model.User"%>
<%@page import="Model.Video"%>
<%@page import="java.util.List"%>
<%@page import="Model.Course"%>
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
        <% Course curso = (Course) session.getAttribute("course");%>
        <div class="container">
            <div class="row card">
                <div class="col s12 m5">
                    <img src="../imgs/uploads/<% out.print(curso.getImagePath());%>">
                </div>
                <div class="col s12 m7">
                    <h4><% out.print(curso.getName());%></h4>
                    <h5><% out.print(curso.getDescription());%></h5>
                    <div class="progress tooltipped curso-progress" data-position="bottom" data-tooltip="Você já realizou 70% do curso!">a
                        <div class="determinate" style="width: 70%"></div>
                    </div>
                    <!--SE O usuario ja comprou o curso nao precisa mostrar esse forms-->
                    <form method="post" action="../CourseController">
                        
                        <input type="hidden" name="courseId" value="<%out.print(curso.getId());%>">
                        <input type="hidden" name="coursePrice" value="<%out.print(curso.getPrice());%>">
                        <input type="hidden" name="courseOwner" value="<%out.print(curso.getOwner());%>">
                        <input type="hidden" name="coursePercentage" value="<%out.print(curso.getCashbackPercentage());%>">

                        <button class="btn waves-effect waves-light" type="submit" name="action">Comprar curso
                            <i class="material-icons right">send</i>
                        </button>
                    </form>

                </div>
                <div class="col s12">
                    <h4>Aulas</h4>
                    <ul class="collapsible">
                        <%
                            for (Video v : (List<Video>) request.getSession().getAttribute("videos")) {
                        %>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">filter_drama</i><% out.print(v.getName());%></div>
                            <div class="collapsible-body">
                                <span><% out.print(v.getDescription());%></span>
                                <a href="../VideoController?id=<%out.print(v.getId());%>">Assitir a aula</a>
                            </div>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
