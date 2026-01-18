<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" />

<div class="list-container">

    <h2 class="page-title">All Users</h2>
	<h3>${msg}</h3>

    <table class="users-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Mobile</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="u" items="${usersList}">
                <tr>
                    <td>${u.user_id}</td>
                    <td>${u.name}</td>
                    <td>${u.email}</td>
                    <td>${u.username}</td>
                    <td>${u.mobile}</td>

                    <td>
                        <a href="updateProfile/${u.user_id}" class="btn-update">
                            Update
                        </a>
                    </td>

                    <td>
                        <a href="deleteProfileByAdmin/${u.user_id}"
                           class="btn-delete"
                           onclick="return confirm('Delete user?')">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

<jsp:include page="footer.jsp" />
