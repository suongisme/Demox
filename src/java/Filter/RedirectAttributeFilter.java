package Filter;

import constant.AppConstant;
import utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;
import java.util.Objects;

public class RedirectAttributeFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(
        ServletRequest servletRequest,
        ServletResponse servletResponse,
        FilterChain filterChain
    ) throws IOException, ServletException {
        if (servletRequest instanceof HttpServletRequest httpServletRequest) {
            final Map<String, Object> redirectAttributeMap = SessionUtils.getAttributeSession(
                httpServletRequest,
                AppConstant.REDIRECT_ATTRIBUTE,
                Map.class
            );
            if (Objects.nonNull(redirectAttributeMap)) {
                redirectAttributeMap.forEach(httpServletRequest::setAttribute);
            }
            SessionUtils.clean(
                httpServletRequest,
                AppConstant.REDIRECT_ATTRIBUTE
            );

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
