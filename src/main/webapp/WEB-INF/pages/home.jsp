<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" />

<!-- USER HOME -->
<section class="home-dashboard">

    <div class="welcome-card">

        <!-- Subtle success badge -->
        <div class="login-success">
            ✅ Login successful
        </div>

        <h1>
            Welcome, <span class="user-name">${username}</span>
        </h1>

        <p class="welcome-text">
            We’re glad to have you back at <b>StudyStore</b>.  
            Start shopping your favourite stationery items.
        </p>

        <div class="home-buttons">
            <a href="/amz.com/allProducts" class="btn btn-primary">
                🛒 Browse Products
            </a>

            <a href="${pageContext.request.contextPath}/orders" class="btn btn-outline">
                📦 My Orders
            </a>

            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">
                Logout
            </a>
        </div>

    </div>

</section>

<!-- INFO -->
<section class="home-info">

    <div class="info-card">
        <div class="icon">📚</div>
        <h3>Quality Stationery</h3>
        <p>Books and stationery curated for students.</p>
    </div>

    <div class="info-card">
        <div class="icon">⚡</div>
        <h3>Fast Shopping</h3>
        <p>Simple browsing and smooth checkout.</p>
    </div>

    <div class="info-card">
        <div class="icon">🔐</div>
        <h3>Secure Account</h3>
        <p>Your profile and orders are safe with us.</p>
    </div>

</section>

<jsp:include page="footer.jsp" />
