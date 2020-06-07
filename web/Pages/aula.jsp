<%@page import="Model.VideoWatched"%>
<%@page import="java.util.List"%>
<%@page import="Model.Video"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
            <jsp:param name="title" value="Video-aula"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />

        <main>
            <% Video video = (Video) session.getAttribute("video");%>
            <%
                boolean watched = false;
                for (VideoWatched vw : (List<VideoWatched>) request.getSession().getAttribute("videosWatched")) {
                    if (vw.getIdVideo() == video.getId()) {
                        watched = true;
                    }
                }
            %>
            <div class="container">
                <div class="row">
                    <div class="col s12" style="margin-top: 40px;">
                        <iframe id="ytplayer" type="text/html" width="100%" height="500px"
                                src="https://www.youtube.com/embed/<% out.print(video.getPath());%>?autoplay=1"
                                frameborder="0"></iframe>
                    </div>
                    <div class="col s12">
                        <h4><% out.print(video.getName());%></h4>
                        <p><% out.print(video.getDescription());%></p>
                        <form method="post" action="../VideoController">

                            <input type="hidden" name="videoId" value="<%out.print(video.getId());%>">
                            <input type="hidden" name="courseID" value="<%out.print(video.getCourseId());%>">
                            <%
                                if (watched) {
                            %>
                            <button class="btn right disabled"  type="submit" name="action">Vídeo já assistido
                                <i class="right material-icons" style="padding-right: 0; margin-right: -40px!important;">checked</i>
                            </button>
                            <%} else {%>
                            
                            <button class="btn right waves-effect waves-light margin-botton" type="submit" name="action" value="watch">Concluir
                                <i class="material-icons right" style="padding-right: 0;">check</i>
                            </button>
                            <%}%>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="footer.jsp" />
    </body>
</html>
