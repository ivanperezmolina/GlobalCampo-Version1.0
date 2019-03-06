<%-- 
    Document   : actualizarpoda
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
        <title>Actualiza Poda</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");

            //Conexión con base de datos
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalcampo", "root", "");
            Statement s = conexion.createStatement();
            
            //Creación de la sentencia SQL
            String actualizacion = "UPDATE poda SET FecPod='";
            actualizacion += request.getParameter("FecPod");
            actualizacion += "',OliPod=";
            actualizacion += request.getParameter("OliPod");
            actualizacion += ",DesPod='";
            actualizacion += request.getParameter("DesPod");
            actualizacion += "',CodCul=";
            actualizacion += request.getParameter("CodCul");
            actualizacion += " WHERE CodPod=";
            actualizacion += request.getParameter("CodPod");

            //Para comprobaciones--> out.print(actualizacion);
            s.execute(actualizacion);

            conexion.close();//Aseguro que se guarda la insercion
%>


        <script>
            //Redirecciona a la pagina principal
            location.replace("indexPoda.jsp");
        </script>
    </body>
</html>
