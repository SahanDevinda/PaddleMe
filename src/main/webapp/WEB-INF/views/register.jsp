<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Sign up — PeddleMe</title>
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

                .auth-wrapper {
                    flex: 1;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 40px 20px;
                    position: relative
                }

                .auth-wrapper::before {
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

                .auth-card {
                    width: 100%;
                    max-width: 460px;
                    position: relative;
                    z-index: 1
                }

                .auth-header {
                    text-align: center;
                    margin-bottom: 28px
                }

                .auth-logo {
                    width: 56px;
                    height: 56px;
                    background: linear-gradient(135deg, #0056A6, #32CD32);
                    border-radius: 14px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 20px;
                    box-shadow: 0 0 40px rgba(0, 86, 166, 0.3)
                }

                .auth-header h2 {
                    font-size: 1.5rem;
                    font-weight: 700;
                    margin-bottom: 6px;
                    color: #fff
                }

                .auth-header p {
                    color: rgba(232, 236, 241, 0.5);
                    font-size: 0.9rem;
                    margin: 0
                }

                .auth-body {
                    background: rgba(10, 30, 56, 0.7);
                    border: 1px solid rgba(255, 255, 255, 0.08);
                    border-radius: 14px;
                    padding: 32px;
                    backdrop-filter: blur(12px)
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

                .auth-footer {
                    text-align: center;
                    margin-top: 24px;
                    color: rgba(232, 236, 241, 0.5);
                    font-size: 0.88rem
                }

                .auth-footer a {
                    color: #32CD32;
                    font-weight: 600;
                    text-decoration: none
                }

                .auth-footer a:hover {
                    text-decoration: underline;
                    color: #5fe05f
                }

                .alert-danger {
                    background: rgba(248, 81, 73, 0.1);
                    border: 1px solid rgba(248, 81, 73, 0.3);
                    color: #f85149;
                    border-radius: 8px
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
                <div class="auth-wrapper">
                    <div class="auth-card">
                        <div class="auth-header">
                            <div class="auth-logo"><svg width="28" height="28" viewBox="0 0 24 24" fill="none"
                                    stroke="white" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="5" cy="18" r="3" />
                                    <circle cx="19" cy="18" r="3" />
                                    <path d="M12 2l-3.5 7h7z" />
                                    <path d="M5 18l3-7h6l3 7" />
                                </svg></div>
                            <h2>
                                <c:choose>
                                    <c:when test="${adminAddUser}">Add New User</c:when>
                                    <c:otherwise>Create your account</c:otherwise>
                                </c:choose>
                            </h2>
                            <p>
                                <c:choose>
                                    <c:when test="${adminAddUser}">Add a new user to the platform</c:when>
                                    <c:otherwise>Join PeddleMe and start riding today</c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        <div class="auth-body">
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger py-2 mb-3">${error}</div>
                            </c:if>
                            <c:if test="${not empty message}">
                                <div class="alert alert-success py-2 mb-3">${message}</div>
                            </c:if>
                            <form action="${formAction}" method="post">
                                <div class="mb-3"><label class="form-label">Username</label><input type="text"
                                        name="username" class="form-control" required placeholder="e.g. johndoe"></div>
                                <div class="mb-3"><label class="form-label">Email Address</label><input type="email"
                                        name="email" class="form-control" required placeholder="john@email.com"></div>
                                <div class="mb-3"><label class="form-label">Password</label><input type="password"
                                        name="password" class="form-control" required placeholder="••••••••"></div>
                                <div class="mb-4"><label class="form-label">Account Type</label><select name="userType"
                                        class="form-select">
                                        <option value="REGULAR">Regular User</option>
                                        <option value="ADMIN">Admin</option>
                                    </select></div>
                                <button type="submit" class="btn-main">
                                    <c:choose>
                                        <c:when test="${adminAddUser}">Add User</c:when>
                                        <c:otherwise>Create Account</c:otherwise>
                                    </c:choose>
                                </button>
                            </form>
                        </div>
                        <div class="auth-footer">
                            <c:choose>
                                <c:when test="${adminAddUser}"><a
                                        href="${pageContext.request.contextPath}/admin/users">← Back to User
                                        Management</a></c:when>
                                <c:otherwise>Already have an account? <a
                                        href="${pageContext.request.contextPath}/login">Sign in</a></c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>