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
                <form class="col s12 card" method="POST" action="../WalletController">
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">attach_money</i>
                            <input id="icon_prefix2" type="number" name="valor" class="validate" required/>
                            <label for="icon_prefix2">Valor do deposito</label>
                        </div>
                        <input id="icon_prefix2" type="hidden" class="validate" value="deposito"/>
                        <button class="btn waves-effect waves-light" type="submit" name="action" value="deposito">Realizar deposito
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>

                <form class="col s12 card" method="POST" action="../WalletController">
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">attach_money</i>
                            <input id="icon_prefix2" type="number" name="valor" class="validate" required/>
                            <label for="icon_prefix2">Valor da retirada</label>
                        </div>
                        <input id="icon_prefix2" type="hidden" class="validate" value="deposito"/>
                        <button class="btn waves-effect waves-light" type="submit" name="action" value="retirada">Solicitar retirada
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="../scripts/js.js"></script>    
                <%
        if(request.getParameter("erro") != null){
        
            %>
        <script>
                 M.toast({html: 'Não foi possivel realizar operação'});
        </script>
            <%
        }
        %>
    </body>
</html>
