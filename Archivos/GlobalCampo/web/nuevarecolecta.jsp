<%-- 
    Document   : nuevarecolecta.jsp
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
        <title>Nueva Recolecta</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");

            //Conexión con la base de datos
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalcampo", "root", "");
            Statement s = conexion.createStatement();

            //Sentencia SQL
            String insercion = "INSERT INTO recolecta (FecRec, KilRec,TraCul, DNIPerRec, DesRec, CodCul) ";
            insercion += "VALUES ('";
            insercion += request.getParameter("FecRec") + "', ";
            insercion += request.getParameter("KilRec") + ", ";
            insercion += request.getParameter("TraCul") + ", '";
            insercion += request.getParameter("DNIPerRec") + "', '";
            insercion += request.getParameter("DesRec") + "', ";
            insercion += request.getParameter("CodCul") + ") ";

            //out.print(insercion);
            s.execute(insercion);

            conexion.close();//Aseguro que se guarda la insercion
        %>

        <script>
            //Redirecciona a la pagina principal
            location.replace("indexRecolecta.jsp");
        </script>


    </body>
</html>
