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

        <div class="container">
            <div class="row card">
                <div class="col s12 m5">
                    <img src="../imgs/uploads/<% out.print(curso.getImagePath());%>">
                </div>
                <div class="col s12 m7">
                    <h4><% out.print(curso.getName());%></h4>
                    <h5><% out.print(curso.getDescription());%></h5>
                    <%
                        if (buyed) {
                            List<Video> v = (List<Video>) request.getSession().getAttribute("videos");
                            List<VideoWatched> vw = (List<VideoWatched>) request.getSession().getAttribute("videosWatched");
                            float porcentagem = (vw.size() * 100) / v.size();
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
                            <div class="collapsible-header"><i class="material-icons">done</i><% out.print(v.getName());%></div>
                            <%
                            } else {
                            %>
                            <div class="collapsible-header"><i class="material-icons">clear</i><% out.print(v.getName());%></div>
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
