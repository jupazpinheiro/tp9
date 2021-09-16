 
package br.edu.infnet.ventura.servlets;

import br.edu.infnet.ventura.dao.UserDAO;
import br.edu.infnet.ventura.entites.User;
import br.edu.infnet.ventura.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           String email = request.getParameter("email");
           String password = request.getParameter("password");
           
           //validação
           
           //autenticação do usuário
           UserDAO userDao = new UserDAO(FactoryProvider.getFactory());
           User user = userDao.getUserByEmailAndPassword(email, password);
           //System.out.println(user);
           request.getSession();
           HttpSession httpSession = request.getSession();
           
           if (user==null){
               out.println("Dados não encontrados");
               httpSession.setAttribute("message", "Usuário/senha não encontrado");
               response.sendRedirect("login.jsp");
               return;
           }
           else{
               out.println("Acesso concedido "+ user.getUserName());
           
           //login - escolha do tipo de usuário 
           httpSession.setAttribute("current-user", user);
           if (user.getUserType().equals("admin")){
               response.sendRedirect("admin.jsp");
           } else if(user.getUserType().equals("normal")){
               response.sendRedirect("normal.jsp");
           }
           else{
               out.println("Usuário não encontrado");
           }
           
           
           
           
           }
           
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
