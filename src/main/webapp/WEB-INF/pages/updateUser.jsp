<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" />

<div class="update-container">

    <div class="update-card">

        <h2 class="update-title">Update Profile</h2>

        <form action="/amz.com/updateProfile" method="post">

            <!-- Hidden ID -->
            <input type="hidden" name="user_id" value="${user.user_id}" />

            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" value="${user.name}" required>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" value="${user.email}" required>
            </div>

            <div class="form-group">
                <label>Mobile</label>
                <input type="text" name="mobile" value="${user.mobile}" required>
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" value="${user.username}" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" value="${user.password}" required>
            </div>

            <!-- Buttons -->
            <div class="update-actions">
                <button type="submit" class="btn btn-primary btn-save">
                    Save Changes
                </button>

                <a href="${pageContext.request.contextPath}/user"
                   class="btn btn-outline btn-cancel">
                    Cancel
                </a>
            </div>

        </form>

    </div>
</div>

<jsp:include page="footer.jsp" />
