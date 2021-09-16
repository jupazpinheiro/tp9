<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4" >
                    <div class="card">
                        <%@include file="components/message.jsp" %>
                        
                        <div class="card-body px-5">
                            <div class="imgage-center">
                                <img src="img/register.png" style="max-width: 100px;" class="img-fluid" alt="">
                            </div>

                            <h3 class="text-center my-3">Novo por aqui?</h3>
                           
                            <form action="RegisterServlet" method="post">
                            
                                <div class="form-group">
                                    <label for="name">Usuário</label>
                                    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Digite o usuário">
                                    <small class="form-text text-muted">Não compartilhamos dados.</small>
                                </div>
                                <div class="form-group">
                                    <label for="email">e-mail</label>
                                    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Digite o e-mail">
                                </div>
                                <div class="form-group">
                                    <label for="password">Senha</label>
                                    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="password" placeholder="Digite a senha">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Contato</label>
                                    <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="phone" placeholder="Digite um telefone para contato">
                                </div>
                                <div class="form-group">
                                    <label for="address">Endereço</label>
                                    <textarea name="user_address" style="height:200px"; class="form-control" placeholder="Endereço"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg border-0">Enviar</button>
                                    <button type="reset" class="btn btn-primary custom-bg border-0">Limpar</button>
                                    
                                </div>
                            </form>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
