package cn.ssmshop.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author:黄广
 * @Description:后台拦截非法访问
 * @Date: Created in 19-1-30 下午4:19
 */
public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse
            response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        //判断当前请求地址是否是登录if
        if (!(uri.contains("Login") || uri.contains("login"))) {
            //非登录请求
            if (request.getSession().getAttribute("admin") != null) {
                //说明已经登录过，放行
                return true;
            } else {
                if (uri.contains("css") || uri.contains("js")
                        || uri.contains("im") || uri.contains("fonts")
                        || uri.contains("layer")) {
                    //如果是静态资源请求，放行
                    return true;
                } else {
                    //没有登录,跳转到登录界面
                    response.sendRedirect(request.getContextPath() + "/admin" +
                            "/toLogin");
                }
            }
        } else {
            //登录请求，直接放行
            return true;
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
