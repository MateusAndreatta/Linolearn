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
        <% Boolean cashback = (Boolean) session.getAttribute("userGotCashback");%>
        <% User user = (User) session.getAttribute("user");%>
        <% Boolean owner = (user.getId() == curso.getOwner()) ? true : false;%>

        <main>
        <div class="container">
            <div class="row">
                <div class="col s12 m6" style="display: flex;flex-direction: column;justify-content: center;align-items: center;">
                    <img class="img-course" src="../imgs/uploads/<% out.print(curso.getImagePath());%>">
                </div>
                <div class="col s12 m6">
                    <h4><% out.print(curso.getName());%>
                        <% if(owner) out.print("<a class='btn-floating btn-small waves-effect waves-light blue' href='updateCurso.jsp'><i class='material-icons'>edit</i></a>"); %>
                    </h4>
                    <h6><% out.print(curso.getDescription());%></h6>
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
                    <form method="post" action="../TransactionController?action=<%out.print(Util.Constants.TransactionType.RESGATAR);%>">

                        <input type="hidden" name="courseId" value="<%out.print(curso.getId());%>">
                        <input type="hidden" name="coursePrice" value="<%out.print(curso.getPrice());%>">
                        <input type="hidden" name="courseOwner" value="<%out.print(curso.getOwner());%>">
                        <input type="hidden" name="coursePercentage" value="<%out.print(curso.getCashbackPercentage());%>">
                        <%
                            if (!cashback) {
                        %>
                        <button class="btn right waves-effect waves-light" type="submit" name="action">Resgatar linocoins!
                            <i class="material-icons right">send</i>
                        </button>
                        <%
                        } else {
                        %>
                        
                        <div class="col s12">
                            
                            <% if(!owner) { %>
                                <button class="btn right waves-effect waves-light disabled" type="submit" name="action">Cashback resgatado!
                                    <i class="material-icons right"  style="padding-right: 0;margin-right: -40px;">checked</i>
                                </button>
                            <% } %>
                        </div>
                        <%
                            }
                        %>
                    </form>
                    <%
                        }
                    %>


                    <%                        }
                    %>


                    <%
                        if (!buyed) {
                    %>
                    <form method="post" action="../TransactionController?action=<%out.print(Util.Constants.TransactionType.COMPRAR);%>">

                        <input type="hidden" name="courseId" value="<%out.print(curso.getId());%>">
                        <input type="hidden" name="coursePrice" value="<%out.print(curso.getPrice());%>">
                        <input type="hidden" name="courseOwner" value="<%out.print(curso.getOwner());%>">
                        <input type="hidden" name="coursePercentage" value="<%out.print(curso.getCashbackPercentage());%>">
                        
                        <% if(!owner) { %>
                        <div class="col s12">
                            <br />
                            <br />
                                <button class="btn right waves-effect waves-light" type="submit" name="action">Comprar curso por R$<%out.print(curso.getPrice());%>
                                    <i class="material-icons right">send</i>
                                </button>
                        </div>
                        <% } %>
                        
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
                            <div class="collapsible-header"><i class="material-icons">done</i><% out.print(v.getName());%> <% if(owner) out.print("<div class='options'><a href='../VideoController?id="+ v.getId()+ "&action=edit" +"'><i class='blue-text material-icons  hoverOptions'>edit</i></a><a href='../VideoController?id="+ v.getId()+ "&action=delete" +"'><i class='material-icons hoverOptions'>delete</i></a></div>");%></div>
                                <%
                                } else {
                                %>
                            <div class="collapsible-header"><i class="material-icons">clear</i><% out.print(v.getName());%> <% if(owner) out.print("<div class='options'><a href='../VideoController?id="+ v.getId()+ "&action=edit" +"'><i class='blue-text material-icons hoverOptions'>edit</i></a><a href='../VideoController?id="+ v.getId()+ "&action=delete" +"'><i class='red-text material-icons hoverOptions'>delete</i></a></div>");%></div>
                                <%
                                    }
                                %>

                            <div class="collapsible-body">
                                <span><% out.print(v.getDescription());%></span>
                                <%
                                    if (buyed) {
                                %>
                                <br />
                                <br />
                                    <a href="../VideoController?id=<%out.print(v.getId());%>&action=watch">Assitir a aula</a>
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
        
        </main>
                    
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
