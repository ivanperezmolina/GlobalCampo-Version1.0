package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;

public final class indexRecolecta_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>GlobalCampo - Gestión de recolectas</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css\" integrity=\"sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.7.1/css/all.css\" integrity=\"sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\" integrity=\"sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"js/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"img/favicon/faviconoliva.ico\" type=\"image/x-icon\">\n");
      out.write("        <link rel=\"icon\" href=\"img/favicon/faviconoliva.ico\" type=\"image/x-icon\">\n");
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
      out.write("                <img class=\"d-block mx-auto mb-4\" src=\"img/iconol.png\" alt=\"\" width=\"72\" height=\"72\">\n");
      out.write("                <h2>GESTIÓN DE LA RECOLECTA DE ACEITUNAS</h2>\n");
      out.write("                <p class=\"lead\">A continuación podra gestionar las recolectas de aceitunas que haya hecho en su cultivos</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");

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


        
      out.write("\n");
      out.write("\n");
      out.write("        <table class=\"table\">\n");
      out.write("            <tr><th>ID</th><th>Fecha</th><th>Kilos</th><th>Trabajadores</th><th>Persona encargada</th><th>Descripción</th><th>Finca</th><th></th></tr>\n");
      out.write("            <form action=\"");
      out.print(estado.equals("listado") ? "nuevarecolecta.jsp" : "actualizarrecolecta.jsp");
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
      out.print(request.getParameter("CodRec"));
      out.write("\"><!--Enviarlo en el id-->\n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                        <!--El valor que se manda. Y no se ve-->\n");
      out.write("                        <input name=\"CodRec\" type=\"hidden\" \n");
      out.write("                               value=\"");
      out.print(request.getParameter("CodRec"));
      out.write("\"><!--Enviarlo en el id-->\n");
      out.write("\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                    <td>           \n");
      out.write("                        <div class=\"form-group\">                \n");
      out.write("                            <input value =\"");
      out.print( estado.equals("edicion") ? request.getParameter("FecRec") : "");
      out.write("\"\n");
      out.write("                                   type=\"date\" name=\"FecRec\" class=\"form-control\" >\n");
      out.write("                        </div>  \n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                    <td>            \n");
      out.write("                        <div class=\"form-group\">                \n");
      out.write("                            <input style=\"width:80px\" value =\"");
      out.print( estado.equals("edicion") ? request.getParameter("KilRec") : "");
      out.write("\" \n");
      out.write("                                   type=\"number\" min=\"0\" name=\"KilRec\" class=\"form-control\">\n");
      out.write("                        </div>  \n");
      out.write("                    </td>\n");
      out.write("                    <td>            \n");
      out.write("                        <div class=\"form-group\">                \n");
      out.write("                            <input style=\"width:80px\" value =\"");
      out.print( estado.equals("edicion") ? request.getParameter("TraCul") : "");
      out.write("\" \n");
      out.write("                                   type=\"number\" min=\"0\" name=\"TraCul\" class=\"form-control\" >\n");
      out.write("                        </div>  \n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                    <td>            \n");
      out.write("                        <div class=\"form-group\">                \n");
      out.write("                            <input style=\"width:130px\"value =\"");
      out.print( estado.equals("edicion") ? request.getParameter("DNIPerRec") : "");
      out.write("\" \n");
      out.write("                                   type=\"text\" name=\"DNIPerRec\" class=\"form-control\" >\n");
      out.write("                        </div>  \n");
      out.write("                    </td>\n");
      out.write("                    <td>            \n");
      out.write("                        <div class=\"form-group\">                \n");
      out.write("                            <input value =\"");
      out.print( estado.equals("edicion") ? request.getParameter("DesRec") : "");
      out.write("\" \n");
      out.write("                                   type=\"text\"  name=\"DesRec\" class=\"form-control\" >\n");
      out.write("                        </div>  \n");
      out.write("                    </td>\n");
      out.write("                    <td>            \n");
      out.write("                        <div class=\"form-group\">               \n");
      out.write("                            ");

                                out.print("<select class=\"custom-select\" name=\"CodCul\" required=\"required\">");
                                while (listado2.next()) {
                                    out.print("<option value=\"" + listado2.getString("CodCul") + "\">" + listado2.getString("NomCul") + "</option>");
                                }
                                out.print("</select>");
                            
      out.write("\n");
      out.write("                        </div>  \n");
      out.write("                        \n");
      out.write("                        <input name=\"CodCul\" type=\"hidden\" \n");
      out.write("                               value=\"");
      out.print(request.getParameter("NomCul"));
      out.write("\">\n");
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
      out.write("                        <a href=\"indexRecolecta.jsp\" class=\"btn btn-secondary\"><i class=\"fas fa-ban\"></i></a>\n");
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
      out.print(listado.getString("CodRec"));
      out.write("</td>\n");
      out.write("\n");
      out.write("                <td>");
      out.print(listado.getString("FecRec"));
      out.write("</td>\n");
      out.write("\n");
      out.write("                <td>");
      out.print(listado.getString("KilRec"));
      out.write("</td>\n");
      out.write("\n");
      out.write("                <td>");
      out.print(listado.getString("TraCul"));
      out.write("</td>\n");
      out.write("\n");
      out.write("                <td>");
      out.print(listado.getString("DNIPerRec"));
      out.write("</td>\n");
      out.write("\n");
      out.write("                <td>");
      out.print(listado.getString("DesRec"));
      out.write("</td>\n");
      out.write("\n");
      out.write("                <td>");
      out.print(listado.getString("NomCul"));
      out.write("</td>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <td><a class=\"btn btn-warning\" href=\"indexRecolecta.jsp?CodRec=");
      out.print(listado.getString("CodRec"));
      out.write("&FecRec=");
      out.print(listado.getString("FecRec"));
      out.write("&KilRec=");
      out.print(listado.getString("KilRec"));
      out.write("&TraCul=");
      out.print(listado.getString("TraCul"));
      out.write("&DNIPerRec=");
      out.print(listado.getString("DNIPerRec"));
      out.write("&DesRec=");
      out.print(listado.getString("DesRec"));
      out.write("&CodCul=");
      out.print(listado.getString("CodCul"));
      out.write("\" role=\"button\"><i class=\"fas fa-pencil-alt\"></i></a>\n");
      out.write("\n");
      out.write("                    <a class=\"btn btn-danger\" href=\"borrarrecolecta.jsp?CodRec=");
      out.print(listado.getString("CodRec"));
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
