<%@page import="br.edu.infnet.ventura.entites.Category"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.infnet.ventura.dao.CategoryDao"%>
<%@page import="br.edu.infnet.ventura.helper.FactoryProvider"%>
<%@page import="br.edu.infnet.ventura.entites.User"%>
<!-- proteção do admin--> 
<%
    User user = (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "Login não realizado");
        response.sendRedirect("login.jsp");
        return;
    }
    else{
        if(user.getUserType().equals("normal")){
            session.setAttribute("message", "Sem autorização para acesso!");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
            
            <div class="row">
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 130;" class="img-fluid" src="img/helmet.png" />
                            </div>
                            <h1 class="text-uppercase text-muted">Candidatos</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 130;" class="img-fluid" src="img/diagram.png" />
                            </div>
                            <h1 class="text-uppercase text-muted">Areas</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 130;" class="img-fluid" src="img/box.png" />
                            </div>
                            <h1 class="text-uppercase text-muted">Vagas</h1>
                        </div>
                    </div>
                </div>
                
                
                </div>
            <div class="row mt-3">
                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 130;" class="img-fluid" src="img/boxes.png" />
                            </div>
                            <h1 class="text-uppercase text-muted">Adicionar áreas</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 130;" class="img-fluid" src="img/shopping-basket.png" />
                            </div>
                            <h1 class="text-uppercase text-muted">Adicionar vagas</h1>
                        </div>
                    </div>
                </div>

            </div>
            </div>
        </div>
        
        
        <!--add areas-->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Detalhes</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                
              </div>
              <div class="modal-body">
                  <form action="ProductOperationServlet" method="post">
                      <input type="hidden" name="operation" value="addcategory">
                      
                      <div class="form-group">
                          <input type="text" class="form-control" placeholder="Nova área" name="catTitle" required />
                      </div>
                      <div class="form-group">
                          <textarea style="height: 300px;" class="form-control" placeholder="Descrição" name="catDescription" required ></textarea>
                      </div>
                      <div class="container">
                          <button class="btn btn-outline-success">Adicionar</button>
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                      </div>
                  </form>
                  
                  
              </div>
              
            </div>
          </div>
        </div>
        
        <!--add areas-->
        <!--add vagas -->
        
        
        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Detalhe de vagas</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                      <input type="hidden" name="operation" value="addproduct" />
                      <div class="form-group">
                          <input type="text" class="form-control" placeholder="Título da vaga" name="pName" required />                          
                      </div>
                      <div class="form-group">
                          <textarea style="height: 150px;" class="form-control" placeholder="Descrição da vaga" name="pDesc" ></textarea>                          
                      </div>
                      <div class="form-group">
                          <input type="number" class="form-control" placeholder="Salário" name="pPrice" required />                          
                      </div>
                      <div class="form-group">
                          <input type="number" class="form-control" placeholder="Horas" name="pDiscount" required />                          
                      </div>
                      <div class="form-group">
                          <input type="number" class="form-control" placeholder="Vagas disponíveis" name="pQuantity" required />                          
                      </div>
                      <%
                          CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                          List<Category> list=cdao.getCategories();
                          %>
                      
                      
                      <div class="form-group">
                          <select name="catId" id="">
                              
                              <%
                                  for(Category c:list){
                              %>
                              <option value="<%= c.getCategoryId() %>"><%= c.getCategory()%></option>
                              <% } %>
                          </select>                          
                      </div>
                      
                      <div class="form-group">
                          <label for="Insira a logo da empresa"></label>
                          <br>
                          <input type="file" id="pPic" name="pPic" required />
                      </div>
                      <div class="container">
                           <br>
                          <button class="btn btn-outline-success">Adicionar</button>
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                      </div>
                          
                      
                  </form>             
                                                      
              </div>
            </div>
          </div>
        </div>
        <!--add vagas -->
    </body>
</html>
