<%-- 
    Document   : index
    Created on : 14/09/2021, 12:11:45
    Author     : ppedr
--%>

<%@page import="br.edu.infnet.ventura.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VenturaHR</title>
        
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Hello World!</h1>
        <h1>Criando um objeto</h1>
        <%
        out.println(FactoryProvider.getFactory());
        %>
        
        
    </body>
</html>
