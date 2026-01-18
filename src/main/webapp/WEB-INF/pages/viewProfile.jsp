<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" />

<div class="profile-wrapper">
    <div class="profile-box">

        <h2>My Profile</h2>

        <div class="row">
            <span class="label">Name</span>
            <span>${user.name}</span>
        </div>

        <div class="row">
            <span class="label">Email</span>
            <span>${user.email}</span>
        </div>

        <div class="row">
            <span class="label">Mobile</span>
            <span>${user.mobile}</span>
        </div>

        <div class="row">
            <span class="label">Username</span>
            <span>${user.username}</span>
        </div>

        <div class="btn-group">
            <a href="/amz.com/updateProfile/${user.user_id}"
               class="btn btn-update">
                Update Profile
            </a>

            <a href="/amz.com/deleteProfile/${user.user_id}"
               class="btn btn-delete"
               onclick="return confirm('Are you sure you want to delete your profile?')">
                Delete Profile
            </a>
        </div>

    </div>
</div>

<jsp:include page="footer.jsp" />
