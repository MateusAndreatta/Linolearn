<%@page import="Model.VideoWatched"%>
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
        <% Boolean buyed = (Boolean) session.getAttribute("buyed");%>
        <% User user = (User) session.getAttribute("user");%>
        <% Boolean owner = (user.getId() == curso.getOwner()) ? true : false;%>

        <div class="container">
            <div class="row card">
                <div class="col s12 m5">
                    <img class="img-course" src="../imgs/uploads/<% out.print(curso.getImagePath());%>">
                </div>
                <div class="col s12 m7">
                    <h4><% out.print(curso.getName());%>
                        <% if(owner) out.print("<a class='btn-floating btn-large waves-effect waves-light indigo right' href='updateCurso.jsp'><i class='material-icons'>edit</i></a>"); %>
                    </h4>
                    <h5><% out.print(curso.getDescription());%></h5>
                    <%
                        if (buyed) {
                            List<Video> v = (List<Video>) request.getSession().getAttribute("videos");
                            List<VideoWatched> vw = (List<VideoWatched>) request.getSession().getAttribute("videosWatched");
                            float porcentagem = 0;
                            if (vw.size() != 0) {
                                porcentagem = (vw.size() * 100) / v.size();
                            }

                    %>
                    <div class="progress tooltipped curso-progress" data-position="bottom" data-tooltip="Você já realizou <%out.print(porcentagem);%>% do curso!">a
                        <div class="determinate" style="width: <%out.print(porcentagem);%>%"></div>
                    </div>


                    <%
                        if (porcentagem == 100.0f) {
                    %>
                    <form method="post" action="">
                        <input type="hidden" name="courseId" value="<%out.print(curso.getId());%>">
                        <input type="hidden" name="coursePrice" value="<%out.print(curso.getPrice());%>">
                        <input type="hidden" name="courseOwner" value="<%out.print(curso.getOwner());%>">
                        <input type="hidden" name="coursePercentage" value="<%out.print(curso.getCashbackPercentage());%>">

                        <button class="btn waves-effect waves-light" type="submit" name="action">Resgatar linocoins!
                            <i class="material-icons right">send</i>
                        </button>
                    </form>
                    <%
                        }
                    %>


                    <%
                        }
                    %>


                    <%
                        if (!buyed) {
                    %>
                    <form method="post" action="../CourseController">

                        <input type="hidden" name="courseId" value="<%out.print(curso.getId());%>">
                        <input type="hidden" name="coursePrice" value="<%out.print(curso.getPrice());%>">
                        <input type="hidden" name="courseOwner" value="<%out.print(curso.getOwner());%>">
                        <input type="hidden" name="coursePercentage" value="<%out.print(curso.getCashbackPercentage());%>">

                        <button class="btn waves-effect waves-light" type="submit" name="action">Comprar curso
                            <i class="material-icons right">send</i>
                        </button>
                    </form>
                    <%
                        }
                    %>


                </div>
                <div class="col s12">
                    <h4>Aulas</h4>
                    <ul class="collapsible">
                        <%
                            for (Video v : (List<Video>) request.getSession().getAttribute("videos")) {
                                boolean watched = false;
                                for (VideoWatched vw : (List<VideoWatched>) request.getSession().getAttribute("videosWatched")) {
                                    if (vw.getIdVideo() == v.getId()) {
                                        watched = true;
                                    }
                                }
                        %>
                        <li>
                            <%
                                if (watched) {
                            %>
                            <div class="collapsible-header"><i class="material-icons">done</i><% out.print(v.getName());%> <% if(owner) out.print("<div class='options'><a><i class='material-icons'>edit</i></a><a><i class='material-icons'>delete</i></a></div>");%></div>
                            <%
                            } else {
                            %>
                            <div class="collapsible-header"><i class="material-icons">clear</i><% out.print(v.getName());%> <% if(owner) out.print("<div class='options'><a><i class='material-icons'>edit</i></a><a><i class='material-icons'>delete</i></a></div>");%></div>
                            <%
                                }
                            %>

                            <div class="collapsible-body">
                                <span><% out.print(v.getDescription());%></span>
                                <%
                                    if (buyed) {
                                %>
                                <a href="../VideoController?id=<%out.print(v.getId());%>">Assitir a aula</a>
                                <%
                                    }
                                %>
                            </div>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                    <%
                        if (user.getId() == curso.getOwner()) {
                    %>
                    <a class="waves-effect waves-light btn margin-botton" href="cadastroAula.jsp?id=<%out.print(curso.getId());%>">Cadastrar aulas</a>
                    <%
                        }
                    %>

                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
        <%
            if (request.getParameter("erro") != null) {

        %>
        <script>
            M.toast({html: 'Não foi possivel comprar o curso'});
        </script>
        <%                }
        %>
    </body>
</html>
