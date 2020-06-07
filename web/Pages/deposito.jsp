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

        <main>
            <div class="container">
                <div class="row">
                    <h2>Realizar depósito</h2>
                    <form class="col s12 card" method="POST" action="../WalletController">
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">attach_money</i>
                                <input id="icon_prefix2" type="number" name="valor" class="validate" required/>
                                <label for="icon_prefix2">Valor do depósito</label>
                            </div>
                            <input id="icon_prefix2" type="hidden" class="validate" value="deposito"/>
                            <div class="col s12 p-4">
                                <button class="btn right waves-effect waves-light" type="submit" name="action" value="deposito">Realizar depósito
                                    <i class="material-icons right">send</i>
                                </button>
                            </div>

                        </div>
                    </form>

                </div>
            </div>
        </main>
        
        <jsp:include page="footer.jsp" /> 
        
        <%
            if (request.getParameter("erro") != null) {

        %>
        <script>
            M.toast({html: 'Não foi possivel realizar operação'});
        </script>
        <%                }
        %>
    </body>
</html>
