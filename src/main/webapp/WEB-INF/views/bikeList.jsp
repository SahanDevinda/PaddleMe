<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Bikes — PeddleMe</title>
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
                    padding: 60px 0 50px;
                    position: relative;
                    overflow: hidden
                }

                .page-hero::before {
                    content: '';
                    position: absolute;
                    top: -200px;
                    left: 50%;
                    transform: translateX(-50%);
                    width: 800px;
                    height: 800px;
                    background: radial-gradient(circle, rgba(0, 86, 166, 0.1) 0%, transparent 70%);
                    pointer-events: none
                }

                .page-hero h1 {
                    font-size: 2.4rem;
                    font-weight: 800;
                    letter-spacing: -1px;
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

                .btn-accent {
                    background: linear-gradient(135deg, #0056A6, #1A5F9C);
                    color: #fff;
                    font-weight: 700;
                    border: none;
                    padding: 10px 24px;
                    border-radius: 8px;
                    text-decoration: none;
                    transition: all 0.3s;
                    font-size: 0.9rem
                }

                .btn-accent:hover {
                    box-shadow: 0 4px 20px rgba(0, 86, 166, 0.4);
                    transform: translateY(-1px);
                    color: #fff
                }

                .bike-card {
                    background: rgba(10, 30, 56, 0.7);
                    border: 1px solid rgba(255, 255, 255, 0.06);
                    border-radius: 14px;
                    overflow: hidden;
                    transition: all 0.3s
                }

                .bike-card:hover {
                    border-color: rgba(0, 86, 166, 0.3);
                    transform: translateY(-4px);
                    box-shadow: 0 12px 40px rgba(0, 0, 0, 0.3)
                }

                .bike-card-body {
                    padding: 24px
                }

                .bike-card-body h5 {
                    font-weight: 700;
                    font-size: 1.05rem;
                    margin: 0;
                    color: #e8ecf1
                }

                .price-badge {
                    background: linear-gradient(135deg, #32CD32, #28a428);
                    color: #fff;
                    font-weight: 700;
                    padding: 4px 12px;
                    border-radius: 20px;
                    font-size: 0.78rem
                }

                .bike-meta {
                    color: rgba(232, 236, 241, 0.5);
                    font-size: 0.85rem
                }

                .bike-meta strong {
                    color: rgba(232, 236, 241, 0.7)
                }

                .bike-desc {
                    color: rgba(232, 236, 241, 0.4);
                    font-size: 0.82rem;
                    line-height: 1.6
                }

                .badge-select {
                    background: rgba(0, 86, 166, 0.15);
                    color: #60a5fa;
                    padding: 4px 12px;
                    border-radius: 8px;
                    font-size: 0.8rem;
                    font-weight: 600
                }

                .bike-id {
                    color: rgba(232, 236, 241, 0.3);
                    font-size: 0.8rem
                }

                .btn-book {
                    background: linear-gradient(135deg, #0056A6, #1A5F9C);
                    color: #fff;
                    font-weight: 700;
                    border: none;
                    width: 100%;
                    padding: 10px;
                    border-radius: 8px;
                    text-decoration: none;
                    display: block;
                    text-align: center;
                    transition: all 0.3s;
                    font-size: 0.9rem
                }

                .btn-book:hover {
                    box-shadow: 0 4px 20px rgba(0, 86, 166, 0.4);
                    color: #fff
                }

                .btn-delete {
                    background: rgba(248, 81, 73, 0.1);
                    color: #f85149;
                    border: 1px solid rgba(248, 81, 73, 0.3);
                    width: 100%;
                    padding: 10px;
                    border-radius: 8px;
                    font-weight: 600;
                    font-size: 0.9rem;
                    cursor: pointer;
                    transition: all 0.2s
                }

                .btn-delete:hover {
                    background: rgba(248, 81, 73, 0.2);
                    border-color: rgba(248, 81, 73, 0.5)
                }

                .empty-state {
                    text-align: center;
                    padding: 60px 20px
                }

                .empty-state .icon {
                    font-size: 4rem;
                    margin-bottom: 16px
                }

                .empty-state h4 {
                    font-weight: 700;
                    color: rgba(232, 236, 241, 0.7)
                }

                .site-footer {
                    background: rgba(8, 16, 30, 0.9);
                    border-top: 1px solid rgba(255, 255, 255, 0.06);
                    padding: 28px 0;
                    text-align: center;
                    color: rgba(232, 236, 241, 0.3);
                    font-size: 0.85rem;
                    margin-top: 40px
                }
            </style>
        </head>

        <body>
            <%@ include file="navbar.jsp" %>
                <div class="page-hero">
                    <div class="container">
                        <h1>Find Your <span>Perfect Bike</span></h1>
                        <p>Browse our fleet and book instantly</p>
                        <c:if test="${user.userType != 'ADMIN'}"><a
                                href="${pageContext.request.contextPath}/my-reservations"
                                class="btn-accent mt-3 d-inline-block">My Reservations</a></c:if>
                    </div>
                </div>
                <div class="container" style="padding-bottom:60px;">
                    <c:if test="${empty bikes}">
                        <div class="empty-state">
                            <div class="icon">🚲</div>
                            <h4>No bikes available yet</h4>
                            <c:if test="${user.userType == 'ADMIN'}"><a
                                    href="${pageContext.request.contextPath}/admin/bikes/add"
                                    class="btn-accent mt-3 d-inline-block">Add First Bike</a></c:if>
                        </div>
                    </c:if>
                    <div class="row g-4">
                        <c:forEach var="bike" items="${bikes}">
                            <div class="col-md-4 col-sm-6">
                                <div class="bike-card">
                                    <div class="bike-card-body">
                                        <div class="d-flex justify-content-between align-items-start mb-2">
                                            <h5>${bike.bikeName}</h5><span class="price-badge">LKR
                                                ${bike.pricePerHour}/hr</span>
                                        </div>
                                        <p class="bike-meta mb-1"><strong>${bike.brand}</strong> &bull; ${bike.bikeType}
                                        </p>
                                        <p class="bike-desc mb-3">${bike.bikeDescription}</p>
                                        <div class="d-flex justify-content-between align-items-center mb-3"><span
                                                class="badge-select">Select Dates</span><span class="bike-id">ID:
                                                ${bike.bikeId}</span></div>
                                        <c:choose>
                                            <c:when test="${user.userType != 'ADMIN'}"><a
                                                    href="${pageContext.request.contextPath}/reserve/${bike.bikeId}"
                                                    class="btn-book">Book Now</a></c:when>
                                            <c:when test="${user.userType == 'ADMIN'}">
                                                <form action="${pageContext.request.contextPath}/admin/bikes/delete"
                                                    method="post"><input type="hidden" name="bikeId"
                                                        value="${bike.bikeId}"><button class="btn-delete"
                                                        onclick="return confirm('Delete this bike?')">Delete
                                                        Bike</button></form>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <footer class="site-footer">
                    <p style="margin:0">&copy; 2026 PeddleMe</p>
                </footer>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>
