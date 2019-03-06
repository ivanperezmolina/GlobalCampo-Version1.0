<%-- 
    Document   : actualizarcultivo
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
        <title>Actualizar Cultivo</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            
            //Conexión con base de datos
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalcampo", "root", "");
            Statement s = conexion.createStatement();

            //Creación de la sentencia SQL
            String actualizacion = "UPDATE cultivo SET NomCul='";
            actualizacion += request.getParameter("NomCul");
            actualizacion += "',DesCul='";
            actualizacion += request.getParameter("DesCul");
            actualizacion += "',RegCul=";
            actualizacion += request.getParameter("RegCul");
            actualizacion += ",CopeCul='";
            actualizacion += request.getParameter("CopeCul");
            actualizacion += "' WHERE CodCul=";
            actualizacion += request.getParameter("CodCul");

            //Para comprobar -->out.print(actualizacion);
            s.execute(actualizacion);

            conexion.close();//Aseguro que se guarda la insercion
%>


        <script>
            //Redirecciona a la pagina principal
            location.replace("indexCultivo.jsp");
        </script>
    </body>
</html>
