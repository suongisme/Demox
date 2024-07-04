package utils;

import Model.User;
import constant.AppConstant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

public class SessionUtils {

    private SessionUtils() {}

    public static <T> T getAttributeSession(HttpServletRequest request, String key, Class<T> returnType) {
        final HttpSession httpSession = request.getSession();
        final Object session = httpSession.getAttribute(key);
        if (Objects.isNull(session)) {
            return null;
        }
        return returnType.cast(session);
    }

    public static void clean(
        HttpServletRequest request,
        String key
    ) {
        final HttpSession httpSession = request.getSession();
        httpSession.removeAttribute(key);
    }

    public static void redirectAttribute(HttpServletRequest request, String key, Object value) {
        final HttpSession httpSession = request.getSession();
        Object redirectAttribute = httpSession.getAttribute(AppConstant.REDIRECT_ATTRIBUTE);
        if (Objects.isNull(redirectAttribute) || !(redirectAttribute instanceof Map<?,?>)) {
            redirectAttribute = new HashMap<>();
        }
        final Map<String, Object> redirectAttributeMap = (Map<String, Object>) redirectAttribute;
        redirectAttributeMap.put(
            key,
            value
        );
        httpSession.setAttribute(
            AppConstant.REDIRECT_ATTRIBUTE,
            redirectAttributeMap
        );
    }
}
