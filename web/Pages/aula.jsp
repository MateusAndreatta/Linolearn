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
            <div class="row card">
                <div class="col s12">
                    <iframe id="ytplayer" type="text/html" width="1030" height="560"
                            src="https://www.youtube.com/embed/<% out.print(video.getPath());%>?autoplay=1"
                            frameborder="0"></iframe>
                </div>
                <div class="col s12 m7">
                    <h4><% out.print(video.getName());%></h4>
                    <p><% out.print(video.getDescription());%></p>
                    <form method="post" action="../VideoController">

                        <input type="hidden" name="videoId" value="<%out.print(video.getId());%>">
                        <input type="hidden" name="courseId" value="<%out.print(video.getCourseId());%>">
                        <%
                            if (watched) {
                        %>
                        <button class="btn waves-effect waves-light disabled margin-botton"  type="submit" name="action">Concluir
                            <i class="material-icons right">send</i>
                        </button>
                        <%} else {%>
                        <button class="btn waves-effect waves-light margin-botton" type="submit" name="action">Concluir
                            <i class="material-icons right">send</i>
                        </button>
                        <%}%>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="../scripts/js.js"></script>
    </body>
</html>
