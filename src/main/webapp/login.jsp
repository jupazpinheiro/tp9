
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3">
                        <div class="card-header custom-bg text-white">
                            <h3>Acesso</h3>
                            
                        </div>
                        <div class="card-body">
                            
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="mb-3">
                                  <label for="exampleInputEmail1" class="form-label">Usuário / e-mail</label>
                                  <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                  <label for="exampleInputPassword1" class="form-label">Senha</label>
                                  <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <div class="mb-3 form-check">
                                  <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Concordo com as Políticas&Serviços da empresa</label>
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg border-0">Enviar</button>
                                    <button type="reset" class="btn btn-primary custom-bg border-0">Limpar</button>
                                    <p>Caso não esteja cadastrado clique <a href="register.jsp">aqui!</a></p>
                            </form>
                        </div>
                        
                    </div>
                    
                </div>
            </div>
        </div>
    </body>
</html>
