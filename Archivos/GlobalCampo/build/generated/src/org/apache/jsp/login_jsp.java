package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"Mark Otto, Jacob Thornton, and Bootstrap contributors\">\n");
      out.write("        <meta name=\"generator\" content=\"Jekyll v3.8.5\">\n");
      out.write("        <title>Signin Template · Bootstrap</title>\n");
      out.write("\n");
      out.write("        <link rel=\"canonical\" href=\"https://getbootstrap.com/docs/4.3/examples/sign-in/\">\n");
      out.write("\n");
      out.write("        <!-- Bootstrap core CSS -->\n");
      out.write("        <link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .bd-placeholder-img {\n");
      out.write("                font-size: 1.125rem;\n");
      out.write("                text-anchor: middle;\n");
      out.write("                -webkit-user-select: none;\n");
      out.write("                -moz-user-select: none;\n");
      out.write("                -ms-user-select: none;\n");
      out.write("                user-select: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @media (min-width: 768px) {\n");
      out.write("                .bd-placeholder-img-lg {\n");
      out.write("                    font-size: 3.5rem;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                html,\n");
      out.write("                body {\n");
      out.write("                    height: 100%;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                body {\n");
      out.write("                    display: -ms-flexbox;\n");
      out.write("                    display: flex;\n");
      out.write("                    -ms-flex-align: center;\n");
      out.write("                    align-items: center;\n");
      out.write("                    padding-top: 40px;\n");
      out.write("                    padding-bottom: 40px;\n");
      out.write("                    background-color: #f5f5f5;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                .form-signin {\n");
      out.write("                    width: 100%;\n");
      out.write("                    max-width: 330px;\n");
      out.write("                    padding: 15px;\n");
      out.write("                    margin: auto;\n");
      out.write("                }\n");
      out.write("                .form-signin .checkbox {\n");
      out.write("                    font-weight: 400;\n");
      out.write("                }\n");
      out.write("                .form-signin .form-control {\n");
      out.write("                    position: relative;\n");
      out.write("                    box-sizing: border-box;\n");
      out.write("                    height: auto;\n");
      out.write("                    padding: 10px;\n");
      out.write("                    font-size: 16px;\n");
      out.write("                }\n");
      out.write("                .form-signin .form-control:focus {\n");
      out.write("                    z-index: 2;\n");
      out.write("                }\n");
      out.write("                .form-signin input[type=\"email\"] {\n");
      out.write("                    margin-bottom: -1px;\n");
      out.write("                    border-bottom-right-radius: 0;\n");
      out.write("                    border-bottom-left-radius: 0;\n");
      out.write("                }\n");
      out.write("                .form-signin input[type=\"password\"] {\n");
      out.write("                    margin-bottom: 10px;\n");
      out.write("                    border-top-left-radius: 0;\n");
      out.write("                    border-top-right-radius: 0;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <!-- Custom styles for this template -->\n");
      out.write("        <link href=\"signin.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    <body class=\"text-center\" action=\"bienvenida.jsp\" method=\"get\">\n");
      out.write("        <form class=\"form-signin\">\n");
      out.write("            <img class=\"mb-4\" src=\"img/icono2.png\" alt=\"\" width=\"72\" height=\"72\">\n");
      out.write("            <h1 class=\"h3 mb-3 font-weight-normal\">Inicio de sesión</h1>\n");
      out.write("            <label for=\"inputEmail\" class=\"sr-only\">Direccion de Email</label>\n");
      out.write("            <input type=\"email\" id=\"inputEmail\" class=\"form-control\" placeholder=\"Email\" required autofocus>\n");
      out.write("            <label for=\"inputPassword\" class=\"sr-only\">Contraseña:</label>\n");
      out.write("            <input type=\"password\" id=\"inputPassword\" class=\"form-control\" placeholder=\"Contraseña\" required>\n");
      out.write("            <div class=\"checkbox mb-3\">\n");
      out.write("                <label>\n");
      out.write("                    <input type=\"checkbox\" value=\"remember-me\"> Recuerdame\n");
      out.write("                </label>\n");
      out.write("            </div>\n");
      out.write("           \n");
      out.write("            <button type=\"button\" class=\"btn btn-info\"><a href=\"bienvenida.jsp\" style=\"color:black\">ENTRAR</a></button>\n");
      out.write("            <p class=\"mt-5 mb-3 text-muted\">&copy; Iván Pérez Molina</p>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
