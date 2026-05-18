<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Update Profile — PeddleMe</title>
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
                    max-width: 480px;
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

                .form-body {
                    padding: 32px
                }

                .current-info {
                    background: rgba(0, 86, 166, 0.08);
                    border: 1px solid rgba(0, 86, 166, 0.2);
                    border-radius: 10px;
                    padding: 18px;
                    margin-bottom: 28px
                }

                .current-info small {
                    color: rgba(232, 236, 241, 0.4);
                    font-size: 0.78rem;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    font-weight: 600
                }

                .current-info .user-name {
                    font-weight: 700;
                    color: #e8ecf1;
                    font-size: 1rem;
                    margin-top: 6px
                }

                .current-info .user-email {
                    color: rgba(232, 236, 241, 0.5);
                    font-size: 0.88rem
                }

                .current-info .user-role {
                    color: #32CD32;
                    font-size: 0.8rem;
                    font-weight: 700;
                    margin-top: 2px
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

                .form-control::placeholder {
                    color: rgba(232, 236, 241, 0.3)
                }

                .form-control:focus {
                    background: rgba(8, 20, 40, 0.9);
                    border-color: #0056A6;
                    box-shadow: 0 0 0 3px rgba(0, 86, 166, 0.2);
                    color: #e8ecf1
                }

                .btn-main {
                    background: linear-gradient(135deg, #0056A6, #1A5F9C);
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
                    box-shadow: 0 4px 20px rgba(0, 86, 166, 0.4);
                    transform: translateY(-1px)
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
                                <h4>✏️ Update Profile</h4>
                            </div>
                            <div class="form-body">
                                <c:if test="${not empty message}">
                                    <div class="alert alert-success py-2">${message}</div>
                                </c:if>
                                <div class="current-info"><small>Current Info</small>
                                    <div class="user-name">${user.username}</div>
                                    <div class="user-email">${user.email}</div>
                                    <div class="user-role">${user.role}</div>
                                </div>
                                <form action="${pageContext.request.contextPath}/profile/update" method="post">
                                    <div class="mb-3"><label class="form-label">New Email</label><input type="email"
                                            name="email" class="form-control" placeholder="Enter new email"></div>
                                    <div class="mb-4"><label class="form-label">New Password</label><input
                                            type="password" name="password" class="form-control"
                                            placeholder="Enter new password"></div>
                                    <button type="submit" class="btn-main">Save Changes</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>