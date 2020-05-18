<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="head.jsp" >
            <jsp:param name="title" value="Deposito"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container">
            <div class="row">
                <form class="col s12 card" method="POST" action="../depositoController">
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">attach_money</i>
                            <input id="icon_prefix2" type="number" class="balidate"/>
                            <label for="icon_prefix2">Valor do deposito</label>
                        </div>
                        <button class="btn waves-effect waves-light" type="submit" name="action">Realizar deposito
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
