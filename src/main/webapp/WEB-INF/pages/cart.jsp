<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" />

<div class="cart-container">
    <h2>My Cart</h2>

    <!-- Empty cart message -->
    <c:if test="${empty products}">
        <div class="empty">
            Your cart is empty 😔
        </div>
    </c:if>

    <!-- Cart items -->
    <c:if test="${not empty products}">

        <table>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <c:set var="grandTotal" value="0"/>

                <c:forEach var="p" items="${products}">
                    <tr>
                        <td>${p.product_name}</td>
                        <td>₹${p.price}</td>
                        <td>
                            ₹${p.price}
                            <c:set var="grandTotal"
                                   value="${grandTotal + p.price}" />
                        </td>
                        <td>
                            <a href="removeFromCart/${p.product_id}"
                               onclick="return confirm('Remove product?')">
                                <button class="btn-remove">Remove</button>
                            </a>
                        </td>
                    </tr>
                </c:forEach>

                <tr class="total-row">
                    <td colspan="3"><strong>Grand Total</strong></td>
                    <td><strong>₹${grandTotal}</strong></td>
                </tr>
            </tbody>
        </table>

        <div class="buy-now-container">
            <form action="/amz.com/buyNow" method="post">
                <input type="hidden" name="amount" value="${grandTotal}">
                <button type="submit" class="btn-buy">
                    Buy Now
                </button>
            </form>
        </div>

    </c:if>
</div>

<jsp:include page="footer.jsp" />
