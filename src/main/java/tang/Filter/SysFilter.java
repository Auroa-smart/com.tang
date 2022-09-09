package tang.Filter;

import tang.Entity.User2;
import tang.util.Constant;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SysFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        //过滤器。从Session获取用户
//        User user = (User) request.getSession().getAttribute(Constant.USER_SESSION);
        User2 user = (User2) request.getSession().getAttribute(Constant.USER_SESSION);

        if(user==null){
            String path = ((HttpServletRequest) req).getContextPath();
            request.getRequestDispatcher("/jsp/error.jsp").forward(request,response);
        }else{
            chain.doFilter(request,response);
        }
//
    }

    public void destroy() {

    }
}
