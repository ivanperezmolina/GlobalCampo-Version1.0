<%-- 
    Document   : nuevotratamiento
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
        <title>Nuevo Tratamiento</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");

            //Conexión con la base de datos
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalcampo", "root", "");
            Statement s = conexion.createStatement();
            
            //Sentencias SQL
            String insercion = "INSERT INTO tratamiento (FecTra, DesTra, TipTra, CodCul, CodFer) ";
            insercion += "VALUES ('";
            insercion += request.getParameter("FecTra") + "', '";
            insercion += request.getParameter("DesTra") + "', '";
            insercion += request.getParameter("TipTra") + "', ";
            insercion += request.getParameter("CodCul") + ", ";
            insercion += request.getParameter("CodFer") + ") ";

            //out.print(insercion);
            s.execute(insercion);

            conexion.close();//Aseguro que se guarda la insercion
        %>

        <script>
            //Redirecciona a la pagina principal
            location.replace("indexTratamiento.jsp");
        </script>


    </body>
</html>
