<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Add Bike — PeddleMe Admin</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
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

                .form-wrapper {
                    flex: 1;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 40px 20px;
                    position: relative
                }

                .form-wrapper::before {
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

                .form-card {
                    width: 100%;
                    max-width: 520px;
                    position: relative;
                    z-index: 1
                }

                .form-card-inner {
                    background: rgba(10, 30, 56, 0.7);
                    border: 1px solid rgba(255, 255, 255, 0.08);
                    border-radius: 14px;
                    overflow: hidden;
                    backdrop-filter: blur(12px)
                }

                .form-header {
                    background: linear-gradient(135deg, rgba(0, 86, 166, 0.2), rgba(50, 205, 50, 0.08));
                    padding: 24px 32px;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.04)
                }

                .form-header h4 {
                    font-weight: 800;
                    font-size: 1.15rem;
                    margin: 0;
                    color: #e8ecf1
                }

                .form-header p {
                    color: rgba(232, 236, 241, 0.45);
                    margin: 4px 0 0;
                    font-size: 0.88rem
                }

                .form-body {
                    padding: 32px
                }

                .form-label {
                    font-weight: 600;
                    font-size: 0.85rem;
                    color: rgba(232, 236, 241, 0.8);
                    margin-bottom: 6px
                }

                .form-control,
                .form-select {
                    background: rgba(8, 20, 40, 0.8);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    color: #e8ecf1;
                    border-radius: 8px;
                    padding: 10px 14px;
                    font-size: 0.9rem;
                    transition: all 0.2s
                }

                .form-control::placeholder {
                    color: rgba(232, 236, 241, 0.3)
                }

                .form-control:focus,
                .form-select:focus {
                    background: rgba(8, 20, 40, 0.9);
                    border-color: #0056A6;
                    box-shadow: 0 0 0 3px rgba(0, 86, 166, 0.2);
                    color: #e8ecf1
                }

                .form-select {
                    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%2332CD32' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
                    background-repeat: no-repeat;
                    background-position: right 12px center;
                    background-size: 16px 12px
                }

                .form-select option {
                    background: #0a1e38;
                    color: #e8ecf1
                }

                .btn-main {
                    background: linear-gradient(135deg, #32CD32, #28a428);
                    color: #fff;
                    font-weight: 700;
                    border: none;
                    width: 100%;
                    padding: 12px;
                    border-radius: 8px;
                    font-size: 0.95rem;
                    transition: all 0.3s;
                    cursor: pointer
                }

                .btn-main:hover {
                    box-shadow: 0 4px 20px rgba(50, 205, 50, 0.4);
                    transform: translateY(-1px)
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

                .alert-success {
                    background: rgba(50, 205, 50, 0.1);
                    border: 1px solid rgba(50, 205, 50, 0.3);
                    color: #32CD32;
                    border-radius: 8px
                }
            </style>
        </head>

        <body>
            <%@ include file="navbar.jsp" %>
                <div class="form-wrapper">
                    <div class="form-card">
                        <div class="form-card-inner">
                            <div class="form-header">
                                <h4>🚲 Register New Bike</h4>
                                <p>Add a new bike to the fleet</p>
                            </div>
                            <div class="form-body">
                                <c:if test="${not empty message}">
                                    <div class="alert alert-success py-2">${message}</div>
                                </c:if>
                                <form action="${pageContext.request.contextPath}/admin/bikes/add" method="post">
                                    <div class="mb-3"><label class="form-label">Bike Name</label><input type="text"
                                            name="name" class="form-control" required placeholder="e.g. Trek FX3"></div>
                                    <div class="mb-3"><label class="form-label">Brand</label><input type="text"
                                            name="brand" class="form-control" required
                                            placeholder="e.g. Trek, Giant, Hero"></div>
                                    <div class="mb-3"><label class="form-label">Price per Hour (LKR)</label><input
                                            type="number" name="price" class="form-control" required min="1"
                                            placeholder="e.g. 500"></div>
                                    <div class="mb-4"><label class="form-label">Bike Type</label><select name="type"
                                            class="form-select">
                                            <option value="CITY">🚲 City Bike</option>
                                            <option value="MOUNTAIN">🏔️ Mountain Bike</option>
                                        </select></div>
                                    <button type="submit" class="btn-main">Add Bike to Fleet</button>
                                </form>
                                <div class="text-center mt-4"><a href="${pageContext.request.contextPath}/bikes"
                                        class="back-link">← Back to Bikes</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>