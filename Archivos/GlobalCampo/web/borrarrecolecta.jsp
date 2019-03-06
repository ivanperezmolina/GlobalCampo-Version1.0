<%-- 
    Document   : borraserie
    Author     : Iván Pérez Molina
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borra Serie</title>
    </head>
    <body>
       <!-- <h1><%=request.getParameter("CodRec")%></h1>-->

        <%
            //Conexión con la base de datos 
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalcampo", "root", "");
            Statement s = conexion.createStatement();

            //Sentencia SQL
            String borrado = "DELETE FROM recolecta WHERE CodRec=";
            borrado += request.getParameter("CodRec");

            s.execute(borrado);//Ejecuto borrado 

            conexion.close();//Aseguro que se guarda la insercion
        %>


        <script>
            //Redirecciona a la pagina principal
            location.replace("indexRecolecta.jsp");
        </script>
    </body>
</html>
