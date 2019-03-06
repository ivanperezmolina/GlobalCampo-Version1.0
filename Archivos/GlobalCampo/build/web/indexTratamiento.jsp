<%-- 
    Document   : indexTratamiento
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
        <title>GlobalCampo - Gestión de tratamientos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="js/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="img/favicon/faviconatomizador.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon/faviconatomizador.ico" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
                <img class="d-block mx-auto mb-4" src="img/atomizador.png" alt="" width="72" height="72">
                <h2>GESTIÓN DE LOS TRATAMIENTOS APLICADOS</h2>
                <p class="lead">A continuación podra gestionar los fertilizantes que ha aplicado en sus cultivos</p>
            </div>
        </div>
        <%
          request.setCharacterEncoding("UTF-8");

          //Conexión con la base de Datos
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalcampo", "root", "");
          Statement s = conexion.createStatement();
          Statement s2 = conexion.createStatement();
          Statement s3 = conexion.createStatement();
          
          //Sentencias SQL. Una para listar y otra para saber a que corresponde Cod
          ResultSet listado = s.executeQuery("SELECT * FROM tratamiento JOIN cultivo on tratamiento.CodCul = cultivo.CodCul JOIN fertilizante on fertilizante.CodFer=tratamiento.CodFer");
          ResultSet listado2 = s2.executeQuery("SELECT CodCul, NomCul FROM cultivo");
          ResultSet listado3 = s3.executeQuery("SELECT CodFer, NomFer FROM fertilizante");

          String estado = (request.getParameter("CodTra") == null) ? "listado" : "edicion";


        %>

        <table class="table">
            <tr><th>ID</th><th>Fecha</th><th>Descripción</th><th>Tipo de Tratamiento</th><th>Finca</th><th>Fertilizante</th><th></th></tr>
            <form action="<%=estado.equals("listado") ? "nuevotratamiento.jsp" : "actualizatratamiento.jsp"%>" method="get">  
                <tr>
                    <td><!--td del CodRec-->
                        <%
                          if (estado.equals("edicion")) {
                        %>
                        <!--El valor que se imprime-->
                        <div class="form-group"> 
                            <input size="2" type="text" disabled="" class="form-control"
                                   value="<%=request.getParameter("CodTra")%>"><!--Enviarlo en el id-->
                        </div>
                        
                        <!--El valor que se manda. Y no se ve-->
                        <input name="CodTra" type="hidden" 
                               value="<%=request.getParameter("CodTra")%>"><!--Enviarlo en el id-->

                        <%
                          }
                        %>

                    </td>

                    <td>           
                        <div class="form-group">                
                            <input value ="<%= estado.equals("edicion") ? request.getParameter("FecTra") : ""%>"
                                   type="date" name="FecTra" class="form-control" >
                        </div>  
                    </td>

                    <td>            
                        <div class="form-group">                
                            <input value ="<%= estado.equals("edicion") ? request.getParameter("DesTra") : ""%>" 
                                   type="text"  name="DesTra" class="form-control" >
                        </div>  
                    </td>
                    <td>            
                        <div class="form-group">                
                            <input value ="<%= estado.equals("edicion") ? request.getParameter("TipTra") : ""%>"
                                   type="text" name="TipTra" class="form-control" >
                        </div>  
                    </td>

                    <td>            
                        <div class="form-group">               
                            <%                      
                            out.print("<select class=\"custom-select\" name=\"CodCul\" required=\"required\">");
                            while (listado2.next()) {
                            out.print("<option value=\"" + listado2.getString("CodCul") + "\">" + listado2.getString("NomCul") +"</option>");
                            }
                            out.print("</select>");
                            
                            %>
                        </div>  
                        
                            <input name="CodCul" type="hidden" 
                               value="<%=request.getParameter("NomCul")%>">
                    </td>
                       <td>            
                        <div class="form-group">               
                            <%                   
                            out.print("<select class=\"custom-select\" name=\"CodFer\" required=\"required\">");
                            while (listado3.next()) {
                            out.print("<option value=\"" + listado3.getString("CodFer") + "\">" + listado3.getString("NomFer") +"</option>");
                            }
                            out.print("</select>");
                            
                            %>
                        </div>  
                        
                            <input name="CodFer" type="hidden" 
                               value="<%=request.getParameter("NomFer")%>">
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
                        <a href="indexTratamiento.jsp" class="btn btn-secondary"><i class="fas fa-ban"></i></a>
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
                <td><%=listado.getString("CodTra")%></td>

                <td><%=listado.getString("FecTra")%></td>

                <td><%=listado.getString("DesTra")%></td>

                <td><%=listado.getString("TipTra")%></td>

                <td><%=listado.getString("NomCul")%></td>

                <td><%=listado.getString("NomFer")%></td>


                <td><a class="btn btn-warning" href="indexTratamiento.jsp?CodTra=<%=listado.getString("CodTra")%>&FecTra=<%=listado.getString("FecTra")%>&DesTra=<%=listado.getString("DesTra")%>&TipTra=<%=listado.getString("TipTra")%>&CodCul=<%=listado.getString("CodCul")%>&CodFer=<%=listado.getString("CodFer")%>" role="button"><i class="fas fa-pencil-alt"></i></a>

                    <a class="btn btn-danger" href="borratratamiento.jsp?CodTra=<%=listado.getString("CodTra")%>" role="button"><i class="far fa-trash-alt"></i></a></td>

            </tr>
            <%
              }
            %>
        </table>
        <hr><hr>
        <a href="newhtml2.html" class="btn btn-success btn-lg btn-block">Volver al panel de Control de GlobalCampo</a>

    </body>
</html>
