package filtro;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author Aluno07
 */
@WebFilter(filterName = "VerificacaoFilter", urlPatterns = {"/*"})
public class VerificacaoFilter implements Filter {
    
    private static final boolean debug = true;
    private static final String[] paginasPublicas = {
        "/index.jsp",
        "/cadastro.jsp",
        "/WEB-INF/erro404.html",
        "/WEB-INF/erro405.hmtl",
        "/WEB-INF/erro500.html",
        "/WEB-INF/cadastroSucesso.jsp",
        "/cadastro.jsp",
        "/LoginServlet",
        "/CadastroServlet",
        "/img/lista.png",
        "/WEB-INF/web.xml"        
    };

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    public VerificacaoFilter() {
    }    
    

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String pagina = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        
        HttpSession session = httpRequest.getSession();

        boolean logado = session.getAttribute("usuario") != null;
        
        if(!logado && requerAutenticação(pagina, contextPath)){
            httpResponse.sendRedirect("index.jsp");
            return;
        } else if(logado && pagina.equals(contextPath + "/index.jsp")){
            httpResponse.sendRedirect("HomeServlet"); 
            return;
        }
        
        chain.doFilter(request, response); 
    }
    
    private boolean requerAutenticação(String pagina, String contentPath){
        for(String p : paginasPublicas){
            if(pagina.equals(contentPath + p)){
                return false;         
            }
        }
        return true;
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("VerificacaoFilter()");
        }
        StringBuffer sb = new StringBuffer("VerificacaoFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);                
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
