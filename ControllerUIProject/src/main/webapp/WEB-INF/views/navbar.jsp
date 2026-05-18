<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <nav class="navbar navbar-expand-lg" id="mainNav"
            style="background:rgba(8,20,40,0.88);backdrop-filter:blur(20px);-webkit-backdrop-filter:blur(20px);border-bottom:1px solid rgba(255,255,255,0.08);padding:12px 0;position:sticky;top:0;z-index:1000;">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/"
                    style="text-decoration:none;">
                    <div
                        style="background:linear-gradient(135deg,#0056A6,#32CD32);padding:6px 10px;border-radius:8px;display:flex;align-items:center;">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2.5"
                            stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="5" cy="18" r="3" />
                            <circle cx="19" cy="18" r="3" />
                            <path d="M12 2l-3.5 7h7z" />
                            <path d="M5 18l3-7h6l3 7" />
                        </svg>
                    </div>
                    <span style="color:#fff;font-weight:800;font-size:1.15rem;letter-spacing:-0.5px;">PeddleMe</span>
                </a>
                <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarNav" style="filter:invert(1);">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center gap-1">
                        <c:if test="${not empty sessionScope.loggedUser}">
                            <li class="nav-item">
                                <span class="nav-link"
                                    style="color:rgba(255,255,255,0.7);font-size:0.88rem;font-weight:500;">
                                    Hello, <span
                                        style="color:#32CD32;font-weight:600;">${sessionScope.loggedUser.username}</span>
                                </span>
                            </li>
                            <c:if test="${sessionScope.loggedUser.userType == 'ADMIN'}">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/admin" class="btn btn-sm ms-1"
                                        style="background:linear-gradient(135deg,#0056A6,#1A5F9C);color:#fff;font-weight:600;border:none;border-radius:6px;padding:6px 16px;font-size:0.85rem;">Admin</a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/bikes" class="nav-link"
                                    style="color:rgba(255,255,255,0.7);font-size:0.88rem;font-weight:500;transition:color 0.2s;"
                                    onmouseover="this.style.color='#32CD32'"
                                    onmouseout="this.style.color='rgba(255,255,255,0.7)'">Bikes</a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/my-reservations" class="nav-link"
                                    style="color:rgba(255,255,255,0.7);font-size:0.88rem;font-weight:500;transition:color 0.2s;"
                                    onmouseover="this.style.color='#32CD32'"
                                    onmouseout="this.style.color='rgba(255,255,255,0.7)'">My Reservations</a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/profile/update" class="nav-link"
                                    style="color:rgba(255,255,255,0.7);font-size:0.88rem;font-weight:500;transition:color 0.2s;"
                                    onmouseover="this.style.color='#32CD32'"
                                    onmouseout="this.style.color='rgba(255,255,255,0.7)'">Profile</a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm ms-1"
                                    style="border:1px solid rgba(248,81,73,0.5);color:#f85149;background:transparent;border-radius:6px;padding:6px 16px;font-size:0.85rem;font-weight:500;transition:all 0.2s;"
                                    onmouseover="this.style.background='rgba(248,81,73,0.15)'"
                                    onmouseout="this.style.background='transparent'">Logout</a>
                            </li>
                        </c:if>
                        <c:if test="${empty sessionScope.loggedUser}">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/login" class="nav-link"
                                    style="color:rgba(255,255,255,0.7);font-size:0.88rem;font-weight:500;transition:color 0.2s;"
                                    onmouseover="this.style.color='#32CD32'"
                                    onmouseout="this.style.color='rgba(255,255,255,0.7)'">Sign in</a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/register" class="btn btn-sm ms-1"
                                    style="border:1px solid rgba(50,205,50,0.5);color:#32CD32;background:transparent;border-radius:6px;padding:6px 16px;font-size:0.85rem;font-weight:600;transition:all 0.2s;"
                                    onmouseover="this.style.background='rgba(50,205,50,0.1)';this.style.borderColor='#32CD32'"
                                    onmouseout="this.style.background='transparent';this.style.borderColor='rgba(50,205,50,0.5)'">Sign
                                    up</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>