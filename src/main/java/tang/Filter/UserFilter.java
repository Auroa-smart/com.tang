package tang.Filter;

import tang.Entity.User2;
import tang.util.Constant;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class UserFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        //过滤器。从Session获取用户
        User2 user = (User2) request.getSession().getAttribute(Constant.USER_SESSION);

        //2是管理员
        if(user.getRole()==1){
            String path = ((HttpServletRequest) req).getContextPath();
            request.getRequestDispatcher("/jsp/error2.jsp").forward(request,response);
        }else{
            filterChain.doFilter(request,response);

        }
    }

    @Override
    public void destroy() {

    }
}
