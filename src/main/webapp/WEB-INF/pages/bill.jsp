<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" />

<div class="bill-wrapper">
    <div class="bill-box">

        <h2>INVOICE</h2>

        <div class="bill-top">
            <div>
                <p><b>Customer:</b> ${username}</p>
                <p><b>Order ID:</b> ${orderId}</p>
            </div>
            <div>
                <p><b>Date:</b> ${orderDate}</p>
            </div>
        </div>

        <!-- Initialize grand total -->
        <c:set var="grandTotal" value="0" />

        <table>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Price (₹)</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="p" items="${products}">
                    <tr>
                        <td>${p.product_name}</td>
                        <td>₹${p.price}</td>
                    </tr>

                    <c:set var="grandTotal" value="${grandTotal + p.price}" />
                </c:forEach>

                <tr class="total">
                    <td>Total</td>
                    <td>₹${grandTotal}</td>
                </tr>
            </tbody>
        </table>

        <div class="bill-footer">
            <button onclick="window.print()">Print Bill</button>
        </div>

    </div>
</div>

<jsp:include page="footer.jsp" />
