
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException" %>
<%
    String tipoDashboard = request.getParameter("tipoDashboard");
    if (tipoDashboard != null) {
        if (tipoDashboard.equals("circulo")) {
            response.sendRedirect("DashboardPLANES.jsp");
        } else if (tipoDashboard.equals("barras")) {
            response.sendRedirect("DashboardVentas.jsp");
        } else {
            
            response.sendRedirect("error"); 
        }
    } else {
        
        response.sendRedirect("error"); 
    }
%>

