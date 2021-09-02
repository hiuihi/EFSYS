package cn.fungus.interceptor;

import cn.fungus.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 配置拦截器，拦截未登录用户
 * @author zhaohualuo
 * @version 2019年5月8日
 * @since 1.0
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
        //执行完毕，返回前拦截
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
        //处理过程中执行拦截
    }


    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        //在拦截点执行前拦截，如果返回true则不执行拦截点后的操作（拦截成功）
        //返回false则不执行拦截
        User user=(User) session.getAttribute("user");
        if(user == null) {
            //登录失败，跳转到登录页
            response.sendRedirect(request.getContextPath());
            return false;
        }else{
            //登陆成功，不拦截
            return true;
        }
    }

}
