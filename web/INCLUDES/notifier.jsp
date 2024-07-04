<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${__success__ ne null}">
    <div id="__success__" style="display: none">
        ${__success__}
    </div>
</c:if>

<c:if test="${__error__ ne null}">
    <div id="__error__" style="display: none">
            ${__error__}
    </div>
</c:if>

