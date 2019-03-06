<%-- 
    Document   : indexFertilizante
    Created on : 05-mar-2019, 18:10:49
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
        <title>GlobalCampo - Gestión de fertilizantes</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="js/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
          <link rel="shortcut icon" href="img/favicon/faviconfertilizante.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon/faviconfertilizante.ico" type="image/x-icon">
        
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
                <img class="d-block mx-auto mb-4" src="img/fertilizantes.png" alt="" width="72" height="72">
                <h2>GESTIÓN DE LOS FERTILIZANTES</h2>
                <p class="lead">A continuación podra gestionar los fertilizantes procedentes de sus proveedores</p>
            </div>
        </div>
        <%
          request.setCharacterEncoding("UTF-8");
          
          //Conexión con la base de datos
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalcampo", "root", "");
          Statement s = conexion.createStatement();
          
          //Sentencia SQL
          ResultSet listado = s.executeQuery("SELECT * FROM fertilizante");

          String estado = (request.getParameter("CodFer") == null) ? "listado" : "edicion";


        %>

        <table class="table">
            <tr><th>ID</th><th>Nombre</th><th>Descripción</th><th>Tipo de cultivo indicado</th><th>Unidad</th><th></th></tr>
            <form action="<%=estado.equals("listado") ? "nuevofertilizante.jsp" : "actualizafertilizante.jsp"%>" method="get">  
                <tr>
                    <td><!--td del CodRec-->
                        <%
                          if (estado.equals("edicion")) {
                        %>
                        <!--El valor que se imprime-->
                        <div class="form-group"> 
                            <input size="2" type="text" disabled="" class="form-control"
                                   value="<%=request.getParameter("CodFer")%>"><!--Enviarlo en el id-->
                        </div>
                        
                        <!--El valor que se manda. Y no se ve-->
                        <input name="CodFer" type="hidden" 
                               value="<%=request.getParameter("CodFer")%>"><!--Enviarlo en el id-->

                        <%
                          }
                        %>

                    </td>

                    <td>           
                        <div class="form-group">                
                            <input value ="<%= estado.equals("edicion") ? request.getParameter("NomFer") : ""%>"
                                   type="text" name="NomFer" class="form-control" >
                        </div>  
                    </td>

                    <td>            
                        <div class="form-group">                
                            <input value ="<%= estado.equals("edicion") ? request.getParameter("DesFer") : ""%>" 
                                   type="text"  name="DesFer" class="form-control" >
                        </div>  
                    </td>
                    <td>            
                        <div class="form-group">                
                            <input style="width:170px" value ="<%= estado.equals("edicion") ? request.getParameter("TipCulFer") : ""%>"
                                   type="text" name="TipCulFer" class="form-control" >
                        </div>  
                    </td>

                    <td>            
                        <div class="form-group">                
                            <input style="width:100px" value ="<%= estado.equals("edicion") ? request.getParameter("UniFer") : ""%>" 
                                   type="text" name="UniFer" class="form-control">
                        </div>  
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
                        <a href="indexFertilizante.jsp" class="btn btn-secondary"><i class="fas fa-ban"></i></a>
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
                <td><%=listado.getString("CodFer")%></td>

                <td><%=listado.getString("NomFer")%></td>

                <td><%=listado.getString("DesFer")%></td>

                <td><%=listado.getString("TipCulFer")%></td>

                <td><%=listado.getString("UniFer")%></td>


                <td><a class="btn btn-warning" href="indexFertilizante.jsp?CodFer=<%=listado.getString("CodFer")%>&NomFer=<%=listado.getString("NomFer")%>&DesFer=<%=listado.getString("DesFer")%>&TipCulFer=<%=listado.getString("TipCulFer")%>&UniFer=<%=listado.getString("UniFer")%>" role="button"><i class="fas fa-pencil-alt"></i></a>

                    <a class="btn btn-danger" href="borrafertilizante.jsp?CodFer=<%=listado.getString("CodFer")%>" role="button"><i class="far fa-trash-alt"></i></a></td>

            </tr>
            <%
              }
            %>
        </table>
        <hr><hr>
        <a href="newhtml2.html" class="btn btn-success btn-lg btn-block">Volver al panel de Control de GlobalCampo</a>

    </body>
</html>
