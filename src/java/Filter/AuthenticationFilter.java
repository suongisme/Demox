package Filter;

import constant.AppConstant;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(
        ServletRequest servletRequest,
        ServletResponse servletResponse,
        FilterChain filterChain
    ) throws IOException, ServletException {
        if (servletRequest instanceof HttpServletRequest httpServletRequest && servletResponse instanceof HttpServletResponse httpServletResponse) {
            final HttpSession httpSession = httpServletRequest.getSession();
            final Object session = httpSession.getAttribute(AppConstant.SESSION_KEY);
            if (Objects.isNull(session)) {
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/LoginServlet");
                return;
            }
        }
        filterChain.doFilter(
            servletRequest,
            servletResponse
        );
    }

    @Override
    public void destroy() {

    }
}
