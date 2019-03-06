<%-- 
    Document   : actualizarecolecta
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
        <title>Actualiza Recolecta</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");

            //Conexión con base de datos
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalcampo", "root", "");
            Statement s = conexion.createStatement();

            //Creación de la sentencia SQL
            String actualizacion = "UPDATE recolecta SET FecRec='";
            actualizacion += request.getParameter("FecRec");
            actualizacion += "',KilRec=";
            actualizacion += request.getParameter("KilRec");
            actualizacion += ",TraCul=";
            actualizacion += request.getParameter("TraCul");
            actualizacion += ",DNIPerRec='";
            actualizacion += request.getParameter("DNIPerRec");
            actualizacion += "',DesRec='";
            actualizacion += request.getParameter("DesRec");
            actualizacion += "',CodCul=";
            actualizacion += request.getParameter("CodCul");
            actualizacion += " WHERE CodRec=";
            actualizacion += request.getParameter("CodRec");

            //Para comprobaciones--> out.print(actualizacion);
            s.execute(actualizacion);

            conexion.close();//Aseguro que se guarda la insercion
%>


        <script>
            //Redirecciona a la pagina principal
            location.replace("indexRecolecta.jsp");
        </script>
    </body>
</html>
