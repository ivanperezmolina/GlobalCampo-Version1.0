<%-- 
    Document   : actualizafertilizante
    Author     : Iván Pérez Molina
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualiza Fertilizante</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");

            //Conexión con base de datos
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalcampo", "root", "");
            Statement s = conexion.createStatement();

            //Creación de la sentencia SQL
            String actualizacion = "UPDATE fertilizante SET NomFer='";
            actualizacion += request.getParameter("NomFer");
            actualizacion += "',DesFer='";
            actualizacion += request.getParameter("DesFer");
            actualizacion += "',TipCulFer='";
            actualizacion += request.getParameter("TipCulFer");
            actualizacion += "',UniFer='";
            actualizacion += request.getParameter("UniFer");
            actualizacion += "' WHERE CodFer=";
            actualizacion += request.getParameter("CodFer");

            //Para comprobar -->out.print(actualizacion);
            s.execute(actualizacion);

            conexion.close();//Aseguro que se guarda la insercion
%>


        <script>
            //Redirecciona a la pagina principal
            location.replace("indexFertilizante.jsp");
        </script>
    </body>
</html>
