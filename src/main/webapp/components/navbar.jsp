<%@page import="br.edu.infnet.ventura.entites.User"%>
<!--controle on/off -->
<%
    User user1 = (User) session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
         <a class="navbar-brand" href="index.jsp">VenturaHR</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(página atual)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Ação</a>
          <a class="dropdown-item" href="#">Outra ação</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Algo mais aqui</a>
        </div>
      </li>
      
    </ul>
    <ul class="navbar-nav ml-auto">
        <%
         if (user1 == null){
             %>
            <li class="nav-item active">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="register.jsp">Register</a>
            </li>
         <% }
         else{
         %>
            <li class="nav-item active">
                <a class="nav-link" href="#"> <%= user1.getUserName() %> </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="LogoutServlet">Logout</a>
            </li>
         <%
             }
        %>
        
    </ul>
  </div>
    </div>
</nav>
