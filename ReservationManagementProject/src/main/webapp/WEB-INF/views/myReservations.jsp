<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>My Bookings — PeddleMe</title>
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
                    background: radial-gradient(circle, rgba(0, 86, 166, 0.08) 0%, transparent 70%);
                    pointer-events: none
                }

                .page-hero h1 {
                    font-size: 2.2rem;
                    font-weight: 800;
                    letter-spacing: -0.5px;
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

                .stat-card {
                    background: rgba(10, 30, 56, 0.7);
                    border: 1px solid rgba(255, 255, 255, 0.06);
                    border-radius: 14px;
                    padding: 22px;
                    text-align: center;
                    transition: all 0.3s
                }

                .stat-card:hover {
                    border-color: rgba(0, 86, 166, 0.2);
                    transform: translateY(-2px)
                }

                .stat-card small {
                    color: rgba(232, 236, 241, 0.4);
                    font-size: 0.8rem
                }

                .stat-card .val {
                    font-weight: 800;
                    font-size: 1.6rem;
                    color: #32CD32;
                    margin-top: 4px
                }

                .booking-card {
                    background: rgba(10, 30, 56, 0.7);
                    border: 1px solid rgba(255, 255, 255, 0.06);
                    border-radius: 14px;
                    margin-bottom: 16px;
                    padding: 24px;
                    transition: all 0.3s
                }

                .booking-card:hover {
                    border-color: rgba(0, 86, 166, 0.15)
                }

                .booking-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    flex-wrap: wrap;
                    gap: 8px
                }

                .booking-header h5 {
                    font-weight: 700;
                    margin: 0;
                    color: #e8ecf1;
                    font-size: 1rem
                }

                .booking-header .meta {
                    color: rgba(232, 236, 241, 0.35);
                    font-size: 0.82rem
                }

                .badge-active {
                    background: rgba(50, 205, 50, 0.12);
                    color: #32CD32;
                    font-weight: 700;
                    padding: 5px 14px;
                    border-radius: 20px;
                    font-size: 0.8rem;
                    border: 1px solid rgba(50, 205, 50, 0.3)
                }

                .badge-cancelled {
                    background: rgba(248, 81, 73, 0.1);
                    color: #f85149;
                    padding: 5px 14px;
                    border-radius: 20px;
                    font-size: 0.8rem;
                    border: 1px solid rgba(248, 81, 73, 0.25)
                }

                .badge-completed {
                    background: rgba(0, 86, 166, 0.12);
                    color: #60a5fa;
                    padding: 5px 14px;
                    border-radius: 20px;
                    font-size: 0.8rem;
                    border: 1px solid rgba(0, 86, 166, 0.25)
                }

                .booking-divider {
                    border: none;
                    border-top: 1px solid rgba(255, 255, 255, 0.04);
                    margin: 14px 0
                }

                .detail-label {
                    color: rgba(232, 236, 241, 0.4);
                    font-size: 0.78rem;
                    text-transform: uppercase;
                    letter-spacing: 0.3px;
                    font-weight: 600
                }

                .detail-value {
                    font-weight: 700;
                    color: #e8ecf1;
                    font-size: 0.92rem;
                    margin-top: 2px
                }

                .cost-label {
                    font-weight: 900;
                    font-size: 1.05rem;
                    color: #32CD32
                }

                .btn-cancel {
                    background: rgba(248, 81, 73, 0.1);
                    color: #f85149;
                    border: 1px solid rgba(248, 81, 73, 0.3);
                    padding: 7px 18px;
                    border-radius: 8px;
                    font-size: 0.82rem;
                    font-weight: 600;
                    cursor: pointer;
                    transition: all 0.2s
                }

                .btn-cancel:hover {
                    background: rgba(248, 81, 73, 0.2);
                    border-color: rgba(248, 81, 73, 0.5)
                }

                .btn-accent {
                    background: linear-gradient(135deg, #32CD32, #28a428);
                    color: #fff;
                    font-weight: 700;
                    border: none;
                    padding: 10px 30px;
                    border-radius: 8px;
                    text-decoration: none;
                    transition: all 0.3s;
                    font-size: 0.9rem;
                    display: inline-block
                }

                .btn-accent:hover {
                    box-shadow: 0 4px 20px rgba(50, 205, 50, 0.4);
                    color: #fff;
                    transform: translateY(-1px)
                }

                .btn-browse {
                    background: rgba(10, 30, 56, 0.9);
                    color: #32CD32;
                    border: 1px solid rgba(50, 205, 50, 0.3);
                    font-weight: 700;
                    padding: 10px 30px;
                    border-radius: 8px;
                    text-decoration: none;
                    transition: all 0.2s;
                    font-size: 0.9rem;
                    display: inline-block
                }

                .btn-browse:hover {
                    background: rgba(50, 205, 50, 0.08);
                    color: #5fe05f
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
                        <h1>My <span>Reservations</span></h1>
                        <p>Track your reservations</p>
                    </div>
                </div>
                <div class="container" style="padding-bottom:60px;">
                    <div class="row g-3 mb-4">
                        <div class="col-md-4">
                            <div class="stat-card"><small>Total Reservations</small>
                                <div class="val">${totalReservations != null ? totalReservations : 0}</div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stat-card"><small>Active Reservations</small>
                                <div class="val">${activeReservations != null ? activeReservations : 0}</div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stat-card"><small>Total Cost</small>
                                <div class="val">LKR ${reservationTotalCost != null ? reservationTotalCost : 0}</div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${empty reservations}">
                        <div class="empty-state">
                            <div class="icon">📋</div>
                            <h4>No bookings yet</h4>
                            <a href="${pageContext.request.contextPath}/bikes" class="btn-accent mt-3">Browse Bikes</a>
                        </div>
                    </c:if>
                    <c:forEach var="r" items="${reservations}">
                        <div class="booking-card">
                            <div class="booking-header">
                                <div>
                                    <h5>${r.bikeName}</h5><span class="meta">ID: ${r.reservationId} &bull; Bike:
                                        ${r.bikeId}</span>
                                </div>
                                <c:choose>
                                    <c:when test="${r.status=='ACTIVE'}"><span class="badge-active">Active</span>
                                    </c:when>
                                    <c:when test="${r.status=='CANCELLED'}"><span
                                            class="badge-cancelled">Cancelled</span></c:when>
                                    <c:otherwise><span class="badge-completed">Completed</span></c:otherwise>
                                </c:choose>
                            </div>
                            <hr class="booking-divider">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="detail-label">From</div>
                                    <div class="detail-value">${r.startDate}</div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="detail-label">To</div>
                                    <div class="detail-value">${r.endDate}</div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="detail-label">Total Cost</div>
                                    <div class="cost-label">LKR ${r.totalCost}</div>
                                </div>
                                <div class="col-sm-3 text-end">
                                    <c:if test="${r.status=='ACTIVE'}">
                                        <form action="${pageContext.request.contextPath}/reservations/cancel"
                                            method="post">
                                            <input type="hidden" name="reservationId" value="${r.reservationId}"><input
                                                type="hidden" name="bikeId" value="${r.bikeId}">
                                            <button class="btn-cancel"
                                                onclick="return confirm('Cancel this booking?')">Cancel Booking</button>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="text-center mt-4"><a href="${pageContext.request.contextPath}/bikes"
                            class="btn-browse">← Browse More Bikes</a></div>
                </div>
                <footer class="site-footer">
                    <p style="margin:0">&copy; 2025 PeddleMe</p>
                </footer>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>