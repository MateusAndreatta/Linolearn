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
                </div>
                <div class="col s12">
                    <h4>Aulas</h4>
                    <ul class="collapsible">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">filter_drama</i>First</div>
                            <div class="collapsible-body">
                                <span>Lorem ipsum dolor sit amet.</span>
                                <a href="aula.jsp">Assitir a aula</a>
                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">place</i>Second</div>
                            <div class="collapsible-body">
                                <span>Lorem ipsum dolor sit amet.</span>
                                <a href="aula.jsp">Assitir a aula</a>
                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">whatshot</i>Third</div>
                            <div class="collapsible-body">
                                <span>Lorem ipsum dolor sit amet.</span>
                                <a href="aula.jsp">Assitir a aula</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
