<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" />

<div class="contact-wrapper">
    <div class="contact-box">

        <h2>Contact Us</h2>

        <c:if test="${not empty msg}">
            <p class="msg">${msg}</p>
        </c:if>

        <form action="contact" method="post">

            <label>Name</label>
            <input type="text" name="name" required>

            <label>Email</label>
            <input type="email" name="email" required>

            <label>Message</label>
            <textarea name="message" rows="4" required></textarea>

            <button type="submit">Send Message</button>

        </form>

    </div>
</div>

<jsp:include page="footer.jsp" />
