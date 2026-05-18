<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Book Bike — PeddleMe</title>
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
                    margin: 0;
                    min-height: 100vh;
                    display: flex;
                    flex-direction: column
                }

                .book-wrapper {
                    flex: 1;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 40px 20px;
                    position: relative
                }

                .book-wrapper::before {
                    content: '';
                    position: absolute;
                    top: -100px;
                    left: 50%;
                    transform: translateX(-50%);
                    width: 600px;
                    height: 600px;
                    background: radial-gradient(circle, rgba(0, 86, 166, 0.12) 0%, rgba(50, 205, 50, 0.05) 40%, transparent 70%);
                    pointer-events: none
                }

                .book-card {
                    width: 100%;
                    max-width: 520px;
                    position: relative;
                    z-index: 1
                }

                .book-inner {
                    background: rgba(10, 30, 56, 0.7);
                    border: 1px solid rgba(255, 255, 255, 0.08);
                    border-radius: 14px;
                    overflow: hidden;
                    backdrop-filter: blur(12px)
                }

                .book-header {
                    background: linear-gradient(135deg, rgba(0, 86, 166, 0.25), rgba(50, 205, 50, 0.1));
                    padding: 32px;
                    text-align: center;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.04)
                }

                .book-header .emoji {
                    font-size: 3rem;
                    margin-bottom: 12px
                }

                .book-header h3 {
                    font-weight: 800;
                    font-size: 1.3rem;
                    margin: 0;
                    color: #fff
                }

                .book-header p {
                    color: rgba(232, 236, 241, 0.45);
                    margin: 6px 0 0;
                    font-size: 0.88rem
                }

                .book-body {
                    padding: 32px
                }

                .info-row {
                    display: flex;
                    justify-content: space-between;
                    padding: 12px 0;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.04)
                }

                .info-label {
                    color: rgba(232, 236, 241, 0.45);
                    font-size: 0.88rem
                }

                .info-value {
                    font-weight: 700;
                    color: #e8ecf1;
                    font-size: 0.9rem
                }

                .price-big {
                    font-size: 1.4rem;
                    font-weight: 900;
                    color: #32CD32
                }

                .form-label {
                    font-weight: 600;
                    font-size: 0.85rem;
                    color: rgba(232, 236, 241, 0.8);
                    margin-bottom: 6px
                }

                .form-control {
                    background: rgba(8, 20, 40, 0.8);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    color: #e8ecf1;
                    border-radius: 8px;
                    padding: 10px 14px;
                    font-size: 0.9rem;
                    transition: all 0.2s
                }

                .form-control:focus {
                    background: rgba(8, 20, 40, 0.9);
                    border-color: #0056A6;
                    box-shadow: 0 0 0 3px rgba(0, 86, 166, 0.2);
                    color: #e8ecf1
                }

                .form-control[type="date"]::-webkit-calendar-picker-indicator {
                    filter: invert(0.6) sepia(1) hue-rotate(180deg)
                }

                .btn-book {
                    background: linear-gradient(135deg, #32CD32, #28a428);
                    color: #fff;
                    font-weight: 700;
                    border: none;
                    width: 100%;
                    padding: 14px;
                    border-radius: 8px;
                    font-size: 1rem;
                    transition: all 0.3s;
                    cursor: pointer
                }

                .btn-book:hover {
                    box-shadow: 0 4px 20px rgba(50, 205, 50, 0.4);
                    transform: translateY(-1px)
                }

                .btn-outline-d {
                    background: transparent;
                    color: rgba(232, 236, 241, 0.7);
                    border: 1px solid rgba(255, 255, 255, 0.12);
                    width: 100%;
                    padding: 10px;
                    border-radius: 8px;
                    font-weight: 600;
                    font-size: 0.9rem;
                    text-decoration: none;
                    display: block;
                    text-align: center;
                    transition: all 0.2s
                }

                .btn-outline-d:hover {
                    background: rgba(255, 255, 255, 0.06);
                    border-color: rgba(255, 255, 255, 0.25);
                    color: #e8ecf1
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

                .alert-danger {
                    background: rgba(248, 81, 73, 0.1);
                    border: 1px solid rgba(248, 81, 73, 0.3);
                    color: #f85149;
                    border-radius: 8px
                }
            </style>
        </head>

        <body>
            <%@ include file="navbar.jsp" %>
                <div class="book-wrapper">
                    <div class="book-card">
                        <div class="book-inner">
                            <div class="book-header">
                                <div class="emoji">
                                    <c:choose>
                                        <c:when test="${bike.bikeType=='MOUNTAIN'}">🏔️</c:when>
                                        <c:otherwise>🚲</c:otherwise>
                                    </c:choose>
                                </div>
                                <h3>${bike.bikeName}</h3>
                                <p>${bike.bikeDescription}</p>
                            </div>
                            <div class="book-body">
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger py-2">${error}</div>
                                </c:if>
                                <div class="info-row"><span class="info-label">Brand</span><span
                                        class="info-value">${bike.brand}</span></div>
                                <div class="info-row"><span class="info-label">Type</span><span
                                        class="info-value">${bike.bikeType}</span></div>
                                <div class="info-row mb-4"><span class="info-label">Rate</span><span
                                        class="price-big">LKR ${bike.pricePerHour}/hr</span></div>
                                <form action="${pageContext.request.contextPath}/reserve" method="post">
                                    <input type="hidden" name="bikeId" value="${bike.bikeId}">
                                    <div class="mb-3"><label class="form-label">Start Date</label><input type="date"
                                            name="startDate" class="form-control" required></div>
                                    <div class="mb-4"><label class="form-label">End Date</label><input type="date"
                                            name="endDate" class="form-control" required></div>
                                    <button type="submit" class="btn-book">Confirm Booking 🚲</button>
                                </form>
                                <div class="text-center mt-3">
                                    <a href="${pageContext.request.contextPath}/my-reservations"
                                        class="btn-outline-d mb-2">My Reservations</a>
                                    <a href="${pageContext.request.contextPath}/bikes"
                                        class="back-link d-inline-block mt-2">← Back to Bikes</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>