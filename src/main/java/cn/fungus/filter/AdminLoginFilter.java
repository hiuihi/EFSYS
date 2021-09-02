package cn.fungus.filter;

import cn.fungus.domain.Admin;
import cn.fungus.domain.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminLoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("过滤器初始化");

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("过滤器执行====");
        // 1. 得到HttpServletRequest
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        // 2. 得到session
        HttpSession session = request.getSession();
        // 3. 得到User对象
        Admin admin = (Admin) session.getAttribute("admin");
        // 4. 得到请求路径
        String url = request.getRequestURI();
        // 5. 判断session是否存在user对象  如果存在 表示已登录  不存在 则未登录   indexOf
        // indexOf 方法的作用   如果包含子字符串  则返回 子字符串的索引  如果不包含  则返回 -1
        if (admin == null && url.indexOf("showLogin.action") == -1) {
            System.out.println("登录信息不存在， 并且访问登录接口以外的其他接口,应进行拦截");
            response.sendRedirect(request.getContextPath()+"/back/showLogin.action");
//            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        } else {
            // 过滤器的放行
            System.out.println("登录信息已存在");
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
        System.out.println("过滤器销毁");
    }
}
