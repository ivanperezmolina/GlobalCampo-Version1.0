package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;

public final class indexCultivo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>GlobalCampo - Gestión de cultivos</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css\" integrity=\"sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.7.1/css/all.css\" integrity=\"sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" integrity=\"sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"js/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"img/favicon/faviconcultivo.ico\" type=\"image/x-icon\">\n");
      out.write("        <link rel=\"icon\" href=\"img/favicon/faviconcultivo.ico\" type=\"image/x-icon\">\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .bd-placeholder-img {\n");
      out.write("                font-size: 1.125rem;\n");
      out.write("                text-anchor: middle;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @media (min-width: 768px) {\n");
      out.write("                .bd-placeholder-img-lg {\n");
      out.write("                    font-size: 3.5rem;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <body class=\"bg-light\" style=\"margin: 0;padding:0\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"py-4 text-center\">\n");
      out.write("                <img class=\"d-block mx-auto mb-4\" src=\"img/cultivo.png\" alt=\"\" width=\"72\" height=\"72\">\n");
      out.write("                <h2>GESTIÓN DE LOS CULTIVOS</h2>\n");
      out.write("                <p class=\"lead\">A continuación podra gestionar los cultivos de sus socios</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");

          request.setCharacterEncoding("UTF-8");
          
          //Conexión con la base de datos
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/globalcampo", "root", "");
          Statement s = conexion.createStatement();
          
          //Sentencia SQL
          ResultSet listado = s.executeQuery("SELECT * FROM cultivo");

          String estado = (request.getParameter("CodCul") == null) ? "listado" : "edicion";


        
      out.write("\n");
      out.write("\n");
      out.write("        <table class=\"table\">\n");
      out.write("            <tr><th>ID</th><th>Nombre</th><th>Descripción</th><th>Registro</th><th>Cooperativa habitual</th><th></th></tr>\n");
      out.write("            <form action=\"");
      out.print(estado.equals("listado") ? "nuevocultivo.jsp" : "actualizacultivo.jsp");
      out.write("\" method=\"get\">  \n");
      out.write("                <tr>\n");
      out.write("                    <td><!--td del CodRec-->\n");
      out.write("                        ");

                          if (estado.equals("edicion")) {
                        
      out.write("\n");
      out.write("                        <!--El valor que se imprime-->\n");
      out.write("                        <div class=\"form-group\"> \n");
      out.write("                            <input size=\"2\" type=\"text\" disabled=\"\" class=\"form-control\"\n");
      out.write("                                   value=\"");
      out.print(request.getParameter("CodCul"));
      out.write("\"><!--Enviarlo en el id-->\n");
      out.write("                        </div>\n");
      out.write("                        <!--El valor que se manda. Y no se ve-->\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <input name=\"CodCul\" type=\"hidden\" \n");
      out.write("                               value=\"");
      out.print(request.getParameter("CodCul"));
      out.write("\"><!--Enviarlo en el id-->\n");
      out.write("\n");
      out.write("                        ");


                          }

                        
      out.write("\n");
      out.write("\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                    <td>          \n");
      out.write("                        <div class=\"form-group\">                \n");
      out.write("                            <input value =\"");
      out.print( estado.equals("edicion") ? request.getParameter("NomCul") : "");
      out.write("\"\n");
      out.write("                                   type=\"text\" name=\"NomCul\" class=\"form-control\" >\n");
      out.write("                        </div>  \n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                    <td>            \n");
      out.write("                        <div class=\"form-group\">                \n");
      out.write("                            <input value =\"");
      out.print( estado.equals("edicion") ? request.getParameter("DesCul") : "");
      out.write("\" \n");
      out.write("                                   type=\"text\"  name=\"DesCul\" class=\"form-control\" >\n");
      out.write("                        </div>  \n");
      out.write("                    </td>\n");
      out.write("                    <td>            \n");
      out.write("                        <div class=\"form-group\">                \n");
      out.write("                            <input style=\"width:80px\" value =\"");
      out.print( estado.equals("edicion") ? request.getParameter("RegCul") : "");
      out.write("\"\n");
      out.write("                                   type=\"number\" name=\"RegCul\" class=\"form-control\" >\n");
      out.write("                        </div>  \n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                    <td>            \n");
      out.write("                        <div class=\"form-group\">                \n");
      out.write("                            <input  value =\"");
      out.print( estado.equals("edicion") ? request.getParameter("CopeCul") : "");
      out.write("\" \n");
      out.write("                                   type=\"text\" min=\"1\" name=\"CopeCul\" class=\"form-control\">\n");
      out.write("                        </div>  \n");
      out.write("                    </td>\n");
      out.write("                    <td> \n");
      out.write("                        ");

                          if (estado.equals("listado")) {
                        
      out.write("\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-primary\"><i class=\"fas fa-plus-circle\"></i></button>\n");
      out.write("                            ");
}
                              if (estado.equals("edicion")) {
                            
      out.write("\n");
      out.write("                        <button class=\"btn btn-success\"><i class=\"far fa-save\"></i></button>\n");
      out.write("                        <a href=\"indexCultivo.jsp\" class=\"btn btn-secondary\"><i class=\"fas fa-ban\"></i></a>\n");
      out.write("                            ");

                              }
                            
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </form>\n");
      out.write("\n");
      out.write("            ");

              while (listado.next()) {
            
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print(listado.getString("CodCul"));
      out.write("</td>\n");
      out.write("\n");
      out.write("                <td>");
      out.print(listado.getString("NomCul"));
      out.write("</td>\n");
      out.write("\n");
      out.write("                <td>");
      out.print(listado.getString("DesCul"));
      out.write("</td>\n");
      out.write("\n");
      out.write("                <td>");
      out.print(listado.getString("RegCul"));
      out.write("</td>\n");
      out.write("\n");
      out.write("                <td>");
      out.print(listado.getString("CopeCul"));
      out.write("</td>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <td><a class=\"btn btn-warning\" href=\"indexCultivo.jsp?CodCul=");
      out.print(listado.getString("CodCul"));
      out.write("&NomCul=");
      out.print(listado.getString("NomCul"));
      out.write("&DesCul=");
      out.print(listado.getString("DesCul"));
      out.write("&RegCul=");
      out.print(listado.getString("RegCul"));
      out.write("&CopeCul=");
      out.print(listado.getString("CopeCul"));
      out.write("\" role=\"button\"><i class=\"fas fa-pencil-alt\"></i></a>\n");
      out.write("\n");
      out.write("                    <a class=\"btn btn-danger\" href=\"borracultivo.jsp?CodCul=");
      out.print(listado.getString("CodCul"));
      out.write("\" role=\"button\"><i class=\"far fa-trash-alt\"></i></a></td>\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("            ");


              }
            
      out.write("\n");
      out.write("        </table>\n");
      out.write("        <hr><hr>\n");
      out.write("        <a href=\"newhtml2.html\" class=\"btn btn-success btn-lg btn-block\">Volver al panel de Control de GlobalCampo</a>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
