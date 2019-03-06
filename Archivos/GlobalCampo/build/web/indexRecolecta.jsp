<%-- 
    Document   : index
    Author     : Iván Pérez Molina
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GlobalCampo - Gestión de recolectas</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="js/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="img/favicon/faviconoliva.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon/faviconoliva.ico" type="image/x-icon">
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>

    </head>


    <body class="bg-light" style="margin: 0;padding:0">
        <div class="container">
            <div class="py-4 text-center">
                <img class="d-block mx-auto mb-4" src="img/iconol.png" alt="" width="72" height="72">
                <h2>GESTIÓN DE LA RECOLECTA DE ACEITUNAS</h2>
                <p class="lead">A continuación podra gestionar las recolectas de aceitunas que haya hecho en su cultivos</p>
            </div>
        </div>
        <%
            request.setCharacterEncoding("UTF-8");
            
            //Conexión con la base de datos
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalcampo", "root", "");
            Statement s = conexion.createStatement();
            Statement s2 = conexion.createStatement();

            //Sentencias SQL. Una para listar y otra para saber a que corresponde Cod
            ResultSet listado = s.executeQuery("SELECT * FROM recolecta JOIN cultivo on recolecta.CodCul = cultivo.CodCul");
            ResultSet listado2 = s2.executeQuery("SELECT CodCul, NomCul FROM cultivo");

            String estado = (request.getParameter("CodRec") == null) ? "listado" : "edicion";


        %>

        <table class="table">
            <tr><th>ID</th><th>Fecha</th><th>Kilos</th><th>Trabajadores</th><th>Persona encargada</th><th>Descripción</th><th>Finca</th><th></th></tr>
            <form action="<%=estado.equals("listado") ? "nuevarecolecta.jsp" : "actualizarrecolecta.jsp"%>" method="get">  
                <tr>
                    <td><!--td del CodRec-->
                        <%
                            if (estado.equals("edicion")) {
                        %>
                        <!--El valor que se imprime-->
                        <div class="form-group"> 
                            <input size="2" type="text" disabled="" class="form-control"
                                   value="<%=request.getParameter("CodRec")%>"><!--Enviarlo en el id-->
                        </div>
                        
                        <!--El valor que se manda. Y no se ve-->
                        <input name="CodRec" type="hidden" 
                               value="<%=request.getParameter("CodRec")%>"><!--Enviarlo en el id-->

                        <%
                            }
                        %>

                    </td>

                    <td>           
                        <div class="form-group">                
                            <input value ="<%= estado.equals("edicion") ? request.getParameter("FecRec") : ""%>"
                                   type="date" name="FecRec" class="form-control" >
                        </div>  
                    </td>

                    <td>            
                        <div class="form-group">                
                            <input style="width:80px" value ="<%= estado.equals("edicion") ? request.getParameter("KilRec") : ""%>" 
                                   type="number" min="0" name="KilRec" class="form-control">
                        </div>  
                    </td>
                    <td>            
                        <div class="form-group">                
                            <input style="width:80px" value ="<%= estado.equals("edicion") ? request.getParameter("TraCul") : ""%>" 
                                   type="number" min="0" name="TraCul" class="form-control" >
                        </div>  
                    </td>

                    <td>            
                        <div class="form-group">                
                            <input style="width:130px"value ="<%= estado.equals("edicion") ? request.getParameter("DNIPerRec") : ""%>" 
                                   type="text" name="DNIPerRec" class="form-control" >
                        </div>  
                    </td>
                    <td>            
                        <div class="form-group">                
                            <input value ="<%= estado.equals("edicion") ? request.getParameter("DesRec") : ""%>" 
                                   type="text"  name="DesRec" class="form-control" >
                        </div>  
                    </td>
                    <td>            
                        <div class="form-group">               
                            <%
                                out.print("<select class=\"custom-select\" name=\"CodCul\" required=\"required\">");
                                while (listado2.next()) {
                                    out.print("<option value=\"" + listado2.getString("CodCul") + "\">" + listado2.getString("NomCul") + "</option>");
                                }
                                out.print("</select>");
                            %>
                        </div>  
                        
                        <input name="CodCul" type="hidden" 
                               value="<%=request.getParameter("NomCul")%>">
                    </td>
                    <td> 
                        <%
                            if (estado.equals("listado")) {
                        %>
                        <button type="submit" class="btn btn-primary"><i class="fas fa-plus-circle"></i></button>
                            <%}
                                if (estado.equals("edicion")) {
                            %>
                        <button class="btn btn-success"><i class="far fa-save"></i></button>
                        <a href="indexRecolecta.jsp" class="btn btn-secondary"><i class="fas fa-ban"></i></a>
                            <%
                                }
                            %>
                    </td>
                </tr>
            </form>

            <%
                while (listado.next()) {
            %>
            <tr>
                <td><%=listado.getString("CodRec")%></td>

                <td><%=listado.getString("FecRec")%></td>

                <td><%=listado.getString("KilRec")%></td>

                <td><%=listado.getString("TraCul")%></td>

                <td><%=listado.getString("DNIPerRec")%></td>

                <td><%=listado.getString("DesRec")%></td>

                <td><%=listado.getString("NomCul")%></td>


                <td><a class="btn btn-warning" href="indexRecolecta.jsp?CodRec=<%=listado.getString("CodRec")%>&FecRec=<%=listado.getString("FecRec")%>&KilRec=<%=listado.getString("KilRec")%>&TraCul=<%=listado.getString("TraCul")%>&DNIPerRec=<%=listado.getString("DNIPerRec")%>&DesRec=<%=listado.getString("DesRec")%>&CodCul=<%=listado.getString("CodCul")%>" role="button"><i class="fas fa-pencil-alt"></i></a>

                    <a class="btn btn-danger" href="borrarrecolecta.jsp?CodRec=<%=listado.getString("CodRec")%>" role="button"><i class="far fa-trash-alt"></i></a></td>

            </tr>
            <%
                }
            %>
        </table>
        <hr><hr>
        <a href="newhtml2.html" class="btn btn-success btn-lg btn-block">Volver al panel de Control de GlobalCampo</a>

    </body>
</html>

