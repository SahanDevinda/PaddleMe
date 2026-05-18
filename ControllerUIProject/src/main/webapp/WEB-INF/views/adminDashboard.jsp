<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Admin Dashboard — PeddleMe</title>
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

                .page-header {
                    padding: 48px 0 32px;
                    position: relative
                }

                .page-header h1 {
                    font-size: 2rem;
                    font-weight: 800;
                    color: #fff
                }

                .page-header .lead {
                    color: rgba(232, 236, 241, 0.5);
                    font-size: 0.95rem
                }

                .header-divider {
                    border: none;
                    border-top: 1px solid rgba(255, 255, 255, 0.06);
                    margin: 24px 0 0
                }

                .stats-card {
                    border-radius: 14px;
                    padding: 24px;
                    margin-bottom: 20px;
                    transition: all 0.3s;
                    border: 1px solid rgba(255, 255, 255, 0.06);
                    position: relative;
                    overflow: hidden
                }

                .stats-card::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    height: 3px
                }

                .stats-card:hover {
                    transform: translateY(-4px);
                    box-shadow: 0 12px 40px rgba(0, 0, 0, 0.3)
                }

                .stats-card h6 {
                    font-size: 0.8rem;
                    font-weight: 600;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    opacity: 0.8;
                    margin-bottom: 8px
                }

                .stats-card h3 {
                    font-size: 2rem;
                    font-weight: 800;
                    margin: 0 0 4px;
                    color: #fff
                }

                .stats-card small {
                    opacity: 0.6;
                    font-size: 0.8rem
                }

                .sc-blue {
                    background: linear-gradient(145deg, rgba(0, 86, 166, 0.2), rgba(0, 86, 166, 0.05));
                    color: #e8ecf1
                }

                .sc-blue::before {
                    background: linear-gradient(90deg, #0056A6, #1A5F9C)
                }

                .sc-green {
                    background: linear-gradient(145deg, rgba(50, 205, 50, 0.15), rgba(50, 205, 50, 0.03));
                    color: #e8ecf1
                }

                .sc-green::before {
                    background: linear-gradient(90deg, #32CD32, #A4C639)
                }

                .sc-amber {
                    background: linear-gradient(145deg, rgba(245, 158, 11, 0.15), rgba(245, 158, 11, 0.03));
                    color: #e8ecf1
                }

                .sc-amber::before {
                    background: linear-gradient(90deg, #f59e0b, #fbbf24)
                }

                .sc-cyan {
                    background: linear-gradient(145deg, rgba(6, 182, 212, 0.15), rgba(6, 182, 212, 0.03));
                    color: #e8ecf1
                }

                .sc-cyan::before {
                    background: linear-gradient(90deg, #06b6d4, #67e8f9)
                }

                .action-card {
                    background: rgba(10, 30, 56, 0.7);
                    border: 1px solid rgba(255, 255, 255, 0.06);
                    border-radius: 14px;
                    overflow: hidden;
                    margin-bottom: 20px;
                    transition: all 0.3s
                }

                .action-card:hover {
                    border-color: rgba(0, 86, 166, 0.2)
                }

                .action-card .card-header {
                    background: linear-gradient(135deg, rgba(0, 86, 166, 0.2), rgba(50, 205, 50, 0.08));
                    border-bottom: 1px solid rgba(255, 255, 255, 0.04);
                    padding: 18px 24px
                }

                .action-card .card-header h4 {
                    font-size: 1.1rem;
                    font-weight: 700;
                    margin: 0;
                    color: #e8ecf1
                }

                .action-card .card-body {
                    padding: 24px
                }

                .action-card .card-body p {
                    color: rgba(232, 236, 241, 0.5);
                    font-size: 0.9rem;
                    margin-bottom: 16px
                }

                .btn-action {
                    display: inline-block;
                    padding: 10px 20px;
                    border-radius: 8px;
                    font-weight: 600;
                    font-size: 0.88rem;
                    text-decoration: none;
                    transition: all 0.2s;
                    margin: 4px
                }

                .btn-action-primary {
                    background: linear-gradient(135deg, #0056A6, #1A5F9C);
                    color: #fff;
                    border: none
                }

                .btn-action-primary:hover {
                    box-shadow: 0 4px 16px rgba(0, 86, 166, 0.3);
                    color: #fff
                }

                .btn-action-success {
                    background: rgba(50, 205, 50, 0.1);
                    color: #32CD32;
                    border: 1px solid rgba(50, 205, 50, 0.3)
                }

                .btn-action-success:hover {
                    background: rgba(50, 205, 50, 0.2);
                    color: #32CD32
                }

                .data-table {
                    width: 100%;
                    border-collapse: separate;
                    border-spacing: 0
                }

                .data-table thead th {
                    background: rgba(0, 86, 166, 0.1);
                    color: #60a5fa;
                    font-weight: 700;
                    font-size: 0.8rem;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    padding: 14px 16px;
                    border: none
                }

                .data-table thead th:first-child {
                    border-radius: 8px 0 0 0
                }

                .data-table thead th:last-child {
                    border-radius: 0 8px 0 0
                }

                .data-table tbody td {
                    padding: 14px 16px;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.04);
                    color: rgba(232, 236, 241, 0.7);
                    font-size: 0.88rem
                }

                .data-table tbody tr:hover td {
                    background: rgba(0, 86, 166, 0.04)
                }

                .badge-done {
                    background: rgba(50, 205, 50, 0.12);
                    color: #32CD32;
                    font-weight: 600;
                    padding: 4px 12px;
                    border-radius: 10px;
                    font-size: 0.78rem
                }

                .text-muted-dark {
                    color: rgba(232, 236, 241, 0.4);
                    text-align: center;
                    padding: 32px;
                    font-size: 0.9rem
                }
            </style>
        </head>

        <body>
            <nav class="navbar navbar-expand-lg"
                style="background:rgba(8,20,40,0.88);backdrop-filter:blur(20px);border-bottom:1px solid rgba(255,255,255,0.08);padding:12px 0;position:sticky;top:0;z-index:1000;">
                <div class="container">
                    <jsp:include page="navbar.jsp" />
                </div>
            </nav>
            <div class="container">
                <div class="page-header">
                    <h1>Admin Dashboard</h1>
                    <p class="lead">Welcome back, ${sessionScope.loggedUser.username}!</p>
                    <hr class="header-divider">
                </div>
                <div class="row mb-4">
                    <div class="col-md-3">
                        <div class="stats-card sc-blue">
                            <h6>Total Users</h6>
                            <h3>${totalUsers != null ? totalUsers : 0}</h3><small>Registered Members</small>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card sc-green">
                            <h6>Total Bikes</h6>
                            <h3>${totalBikes != null ? totalBikes : 0}</h3><small>Available Bikes</small>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card sc-amber">
                            <h6>Active Reservations</h6>
                            <h3>${activeReservations != null ? activeReservations : 0}</h3><small>Current
                                Bookings</small>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card sc-cyan">
                            <h6>Total Revenue</h6>
                            <h3>$${totalRevenue != null ? totalRevenue : 0}</h3><small>Lifetime Revenue</small>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="action-card">
                            <div class="card-header">
                                <h4>User Management</h4>
                            </div>
                            <div class="card-body">
                                <p>Manage all registered users, view profiles, and control access.</p>
                                <div>
                                    <a href="${pageContext.request.contextPath}/admin/users"
                                        class="btn-action btn-action-primary">View All Users</a>
                                    <a href="${pageContext.request.contextPath}/admin/users/add"
                                        class="btn-action btn-action-success">Add New User</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="action-card">
                            <div class="card-header">
                                <h4>Bike Management</h4>
                            </div>
                            <div class="card-body">
                                <p>Add, edit, or remove bikes from the inventory system.</p>
                                <div>
                                    <a href="${pageContext.request.contextPath}/admin/bikes"
                                        class="btn-action btn-action-primary">View All Bikes</a>
                                    <a href="${pageContext.request.contextPath}/admin/bikes/add"
                                        class="btn-action btn-action-success">Add New Bike</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <div class="action-card">
                            <div class="card-header">
                                <h4>Recent Activities</h4>
                            </div>
                            <div class="card-body" style="padding:0;">
                                <c:if test="${not empty recentActivities}">
                                    <div class="table-responsive">
                                        <table class="data-table">
                                            <thead>
                                                <tr>
                                                    <th>Activity</th>
                                                    <th>User</th>
                                                    <th>Date</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${recentActivities}" var="activity">
                                                    <tr>
                                                        <td>${activity.description}</td>
                                                        <td>${activity.userName}</td>
                                                        <td>${activity.date}</td>
                                                        <td><span class="badge-done">Completed</span></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if>
                                <c:if test="${empty recentActivities}">
                                    <p class="text-muted-dark">No recent activities to display.</p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>