<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" />

<div class="register-container">

    <div class="register-card">

        <h2 class="register-title">Create Account</h2>

        <form action="/amz.com/registerUser" method="post">

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label>Mobile No</label>
                <input type="text" name="mobile" placeholder="Enter mobile number" required>
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Choose a username" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Create a password" required>
            </div>

            <button type="submit" class="btn btn-primary register-btn">
                Register
            </button>

            <p class="register-note">
                Already have an account?
                <a href="/amz.com/login">Login here</a>
            </p>

        </form>

    </div>
</div>

<jsp:include page="footer.jsp" />
