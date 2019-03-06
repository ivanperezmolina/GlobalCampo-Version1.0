<%-- 
    Document   : nuevofertilizante
    Author     : Iván Pérez Molina
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Fertilizante</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");

            //Conexion con la base de datos
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalcampo", "root", "");
            Statement s = conexion.createStatement();

            //Sentencias SQL
            String insercion = "INSERT INTO fertilizante (NomFer, DesFer, TipCulFer, UniFer) ";
            insercion += "VALUES ('";
            insercion += request.getParameter("NomFer") + "', '";
            insercion += request.getParameter("DesFer") + "', '";
            insercion += request.getParameter("TipCulFer") + "', '";
            insercion += request.getParameter("UniFer") + "') ";

            //out.print(insercion);
            s.execute(insercion);

            conexion.close();//Aseguro que se guarda la insercion
        %>

        <script>
            //Redirecciona a la pagina principal
            location.replace("indexFertilizante.jsp");
        </script>


    </body>
</html>
