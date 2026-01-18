<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" />

<div class="login-container">

    <div class="login-card">

        <h2 class="login-title">Login</h2>

        <!-- Message -->
        <c:if test="${not empty msg}">
            <div class="login-msg ${status}">
                ${msg}
            </div>
        </c:if>

        <form action="/amz.com/verify-login" method="post">

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Enter username" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter password" required>
            </div>

            <button type="submit" class="btn btn-primary login-btn-form">
                Login
            </button>

            <p class="login-note">
                Don’t have an account?
                <a href="/amz.com/register">Register</a>
            </p>

        </form>

    </div>
</div>

<jsp:include page="footer.jsp" />
