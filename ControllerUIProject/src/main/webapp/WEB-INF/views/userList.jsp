<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>User Management — Admin</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
                rel="stylesheet">
            <style>
                * {
                    box-sizing: border-box
                }

                body {
                    font-family: 'Inter', sans-serif;
                    background: #091a2a;
                    color: #e8ecf1;
                    margin: 0
                }

                .page-hero {
                    padding: 48px 0 40px;
                    position: relative
                }

                .page-hero h1 {
                    font-size: 2.2rem;
                    font-weight: 800;
                    color: #fff
                }

                .page-hero h1 span {
                    background: linear-gradient(135deg, #32CD32, #A4C639);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text
                }

                .page-hero p {
                    color: rgba(232, 236, 241, 0.5);
                    margin: 0
                }

                .btn-add {
                    background: linear-gradient(135deg, #32CD32, #28a428);
                    color: #fff;
                    font-weight: 700;
                    border: none;
                    padding: 10px 24px;
                    border-radius: 8px;
                    text-decoration: none;
                    transition: all 0.3s;
                    font-size: 0.9rem
                }

                .btn-add:hover {
                    box-shadow: 0 4px 20px rgba(50, 205, 50, 0.4);
                    transform: translateY(-1px);
                    color: #fff
                }

                .table-wrapper {
                    background: rgba(10, 30, 56, 0.7);
                    border: 1px solid rgba(255, 255, 255, 0.06);
                    border-radius: 14px;
                    overflow: hidden
                }

                .data-table {
                    width: 100%;
                    border-collapse: separate;
                    border-spacing: 0;
                    margin: 0
                }

                .data-table thead th {
                    background: rgba(0, 86, 166, 0.1);
                    color: #60a5fa;
                    font-weight: 700;
                    font-size: 0.8rem;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    padding: 16px 18px;
                    border: none
                }

                .data-table tbody td {
                    padding: 14px 18px;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.04);
                    font-size: 0.88rem;
                    vertical-align: middle
                }

                .data-table tbody tr:last-child td {
                    border-bottom: none
                }

                .data-table tbody tr:hover td {
                    background: rgba(0, 86, 166, 0.04)
                }

                .user-id {
                    color: rgba(232, 236, 241, 0.35);
                    font-size: 0.82rem
                }

                .user-name {
                    font-weight: 700;
                    color: #e8ecf1
                }

                .user-email {
                    color: rgba(232, 236, 241, 0.6)
                }

                .user-role {
                    color: rgba(232, 236, 241, 0.5)
                }

                .badge-admin {
                    background: linear-gradient(135deg, rgba(0, 86, 166, 0.2), rgba(0, 86, 166, 0.1));
                    color: #60a5fa;
                    font-weight: 700;
                    padding: 4px 12px;
                    border-radius: 10px;
                    font-size: 0.78rem;
                    border: 1px solid rgba(0, 86, 166, 0.3)
                }

                .badge-regular {
                    background: rgba(255, 255, 255, 0.05);
                    color: rgba(232, 236, 241, 0.5);
                    padding: 4px 12px;
                    border-radius: 10px;
                    font-size: 0.78rem;
                    border: 1px solid rgba(255, 255, 255, 0.08)
                }

                .btn-del {
                    background: rgba(248, 81, 73, 0.1);
                    color: #f85149;
                    border: 1px solid rgba(248, 81, 73, 0.3);
                    padding: 5px 14px;
                    border-radius: 6px;
                    font-size: 0.82rem;
                    font-weight: 600;
                    cursor: pointer;
                    transition: all 0.2s
                }

                .btn-del:hover {
                    background: rgba(248, 81, 73, 0.2);
                    border-color: rgba(248, 81, 73, 0.5)
                }

                .back-link {
                    color: #32CD32;
                    text-decoration: none;
                    font-weight: 600;
                    font-size: 0.9rem
                }

                .back-link:hover {
                    color: #5fe05f
                }
            </style>
        </head>

        <body>
            <%@ include file="navbar.jsp" %>
                <div class="page-hero">
                    <div class="container d-flex justify-content-between align-items-center flex-wrap gap-3">
                        <div>
                            <h1>User <span>Management</span></h1>
                            <p>Manage all registered users</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/register" class="btn-add">+ Add User</a>
                    </div>
                </div>
                <div class="container" style="padding-bottom:60px;">
                    <div class="table-wrapper">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>User ID</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Type</th>
                                    <th>Role</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <td class="user-id">${user.userId}</td>
                                        <td class="user-name">${user.username}</td>
                                        <td class="user-email">${user.email}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${user.userType=='ADMIN'}"><span
                                                        class="badge-admin">ADMIN</span></c:when>
                                                <c:otherwise><span class="badge-regular">REGULAR</span></c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="user-role">${user.role}</td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/admin/users/delete"
                                                method="post" style="display:inline;"><input type="hidden" name="userId"
                                                    value="${user.userId}"><button type="submit" class="btn-del"
                                                    onclick="return confirm('Delete ${user.username}?')">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-center mt-4"><a href="${pageContext.request.contextPath}/admin" class="back-link">←
                            Back to Dashboard</a></div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>