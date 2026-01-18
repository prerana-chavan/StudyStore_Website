<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" />

<h1 class="page-title">All Products</h1>

<c:if test="${not empty msg}">
    <h3 style="text-align:center; color:#374151;">${msg}</h3>
</c:if>

<div class="product-container">

    <c:forEach var="p" items="${products}">
        <div class="product-card">

            <img
                src="${pageContext.request.contextPath}/images/${p.imgUrl}"
                alt="${p.product_name}"
                class="product-img"
            />

            <h3 class="product-name">${p.product_name}</h3>

            <p class="category">${p.categroy}</p>

            <p class="price">₹ ${p.price}</p>

            <!--<p class="qty">Available: ${p.qty}</p> -->

            <form action="/amz.com/addToCart/${p.product_id}" method="post">
                <button type="submit" class="btn btn-buy">
                    Add To Cart
                </button>
            </form>

        </div>
    </c:forEach>

</div>

<jsp:include page="footer.jsp" />
