<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description"
                content="PeddleMe - Sri Lanka's premium bike rental platform. Find, book and ride in minutes.">
            <title>PeddleMe — Peddle the City</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
                rel="stylesheet">
            <style>
                *,
                *::before,
                *::after {
                    box-sizing: border-box
                }

                body {
                    font-family: 'Inter', sans-serif;
                    margin: 0;
                    background: #091a2a;
                    color: #e8ecf1;
                    overflow-x: hidden
                }

                .hero {
                    position: relative;
                    padding: 80px 0 60px;
                    overflow: hidden
                }

                .hero::before {
                    content: '';
                    position: absolute;
                    top: -300px;
                    left: 50%;
                    transform: translateX(-50%);
                    width: 1200px;
                    height: 1200px;
                    background: radial-gradient(ellipse, rgba(0, 86, 166, 0.15) 0%, rgba(50, 205, 50, 0.06) 35%, transparent 65%);
                    pointer-events: none;
                    z-index: 0
                }

                .hero::after {
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    right: 0;
                    height: 120px;
                    background: linear-gradient(to top, #091a2a, transparent);
                    pointer-events: none;
                    z-index: 1
                }

                .hero-row {
                    position: relative;
                    z-index: 2;
                    display: flex;
                    align-items: center;
                    flex-wrap: wrap
                }

                .hero-text {
                    flex: 1;
                    min-width: 320px
                }

                .hero-badge {
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    background: rgba(50, 205, 50, 0.1);
                    border: 1px solid rgba(50, 205, 50, 0.3);
                    color: #32CD32;
                    font-size: 0.8rem;
                    font-weight: 600;
                    padding: 6px 16px;
                    border-radius: 20px;
                    margin-bottom: 24px
                }

                .hero-badge .dot {
                    width: 6px;
                    height: 6px;
                    background: #32CD32;
                    border-radius: 50%;
                    animation: pulse 2s ease-in-out infinite
                }

                @keyframes pulse {

                    0%,
                    100% {
                        opacity: 1
                    }

                    50% {
                        opacity: 0.3
                    }
                }

                .hero-text h1 {
                    font-size: 3.4rem;
                    font-weight: 900;
                    letter-spacing: -2px;
                    line-height: 1.1;
                    margin-bottom: 20px;
                    color: #fff
                }

                .hero-text h1 .grad {
                    background: linear-gradient(135deg, #32CD32, #A4C639);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text
                }

                .hero-text .lead {
                    color: rgba(232, 236, 241, 0.55);
                    font-size: 1.05rem;
                    line-height: 1.7;
                    max-width: 480px;
                    margin-bottom: 32px
                }

                .hero-buttons {
                    display: flex;
                    gap: 12px;
                    flex-wrap: wrap;
                    margin-bottom: 40px
                }

                .btn-glow {
                    background: linear-gradient(135deg, #0056A6, #1A5F9C);
                    color: #fff;
                    font-weight: 700;
                    border: none;
                    padding: 14px 36px;
                    border-radius: 12px;
                    font-size: 0.95rem;
                    text-decoration: none;
                    transition: all 0.3s;
                    box-shadow: 0 4px 24px rgba(0, 86, 166, 0.35)
                }

                .btn-glow:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 36px rgba(0, 86, 166, 0.55);
                    color: #fff
                }

                .btn-green {
                    background: linear-gradient(135deg, #32CD32, #28a428);
                    color: #fff;
                    font-weight: 700;
                    border: none;
                    padding: 14px 36px;
                    border-radius: 12px;
                    font-size: 0.95rem;
                    text-decoration: none;
                    transition: all 0.3s;
                    box-shadow: 0 4px 24px rgba(50, 205, 50, 0.25)
                }

                .btn-green:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 36px rgba(50, 205, 50, 0.45);
                    color: #fff
                }

                .btn-ghost {
                    background: transparent;
                    color: #e8ecf1;
                    font-weight: 600;
                    border: 1px solid rgba(255, 255, 255, 0.18);
                    padding: 14px 36px;
                    border-radius: 12px;
                    font-size: 0.95rem;
                    text-decoration: none;
                    transition: all 0.3s
                }

                .btn-ghost:hover {
                    background: rgba(255, 255, 255, 0.06);
                    border-color: rgba(255, 255, 255, 0.35);
                    color: #fff
                }

                .hero-stats {
                    display: flex;
                    gap: 32px;
                    flex-wrap: wrap
                }

                .hero-stat .num {
                    font-size: 1.6rem;
                    font-weight: 900;
                    color: #32CD32
                }

                .hero-stat .lbl {
                    color: rgba(232, 236, 241, 0.4);
                    font-size: 0.78rem;
                    font-weight: 500;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    margin-top: 2px
                }

                .hero-visual {
                    flex: 1;
                    min-width: 320px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    position: relative
                }

                .hero-img-wrap {
                    position: relative;
                    animation: heroFloat 4s ease-in-out infinite
                }

                @keyframes heroFloat {

                    0%,
                    100% {
                        transform: translateY(0)
                    }

                    50% {
                        transform: translateY(-18px)
                    }
                }

                .hero-img-wrap img {
                    width: 100%;
                    max-width: 420px;
                    height: auto;
                    filter: drop-shadow(0 20px 60px rgba(0, 86, 166, 0.35));
                    border-radius: 20px
                }

                .hero-img-glow {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    width: 350px;
                    height: 350px;
                    background: radial-gradient(circle, rgba(0, 86, 166, 0.2) 0%, rgba(50, 205, 50, 0.08) 40%, transparent 70%);
                    pointer-events: none;
                    z-index: -1
                }

                .hero-road {
                    position: absolute;
                    bottom: -30px;
                    left: 50%;
                    transform: translateX(-50%);
                    width: 320px;
                    height: 8px;
                    background: linear-gradient(90deg, transparent, rgba(50, 205, 50, 0.3), rgba(0, 86, 166, 0.3), transparent);
                    border-radius: 50%;
                    filter: blur(6px)
                }

                .transport-strip {
                    position: relative;
                    z-index: 2;
                    padding: 40px 0;
                    border-top: 1px solid rgba(255, 255, 255, 0.05);
                    border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                    background: rgba(8, 20, 40, 0.5)
                }

                .strip-inner {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 48px;
                    flex-wrap: wrap
                }

                .strip-item {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                    color: rgba(232, 236, 241, 0.5);
                    font-size: 0.88rem;
                    font-weight: 500
                }

                .strip-icon {
                    width: 36px;
                    height: 36px;
                    border-radius: 10px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 1.1rem
                }

                .si-1 {
                    background: rgba(0, 86, 166, 0.15);
                    color: #60a5fa
                }

                .si-2 {
                    background: rgba(50, 205, 50, 0.12);
                    color: #32CD32
                }

                .si-3 {
                    background: rgba(0, 86, 166, 0.15);
                    color: #60a5fa
                }

                .si-4 {
                    background: rgba(50, 205, 50, 0.12);
                    color: #A4C639
                }

                .how-section {
                    padding: 80px 0;
                    position: relative
                }

                .sec-badge {
                    display: inline-block;
                    background: rgba(0, 86, 166, 0.12);
                    color: #60a5fa;
                    font-size: 0.78rem;
                    font-weight: 700;
                    padding: 6px 16px;
                    border-radius: 20px;
                    border: 1px solid rgba(0, 86, 166, 0.25);
                    margin-bottom: 14px;
                    text-transform: uppercase;
                    letter-spacing: 0.5px
                }

                .sec-title {
                    font-size: 2.2rem;
                    font-weight: 800;
                    letter-spacing: -1px;
                    margin-bottom: 10px;
                    color: #fff
                }

                .sec-sub {
                    color: rgba(232, 236, 241, 0.45);
                    font-size: 1rem;
                    margin-bottom: 48px
                }

                .step-card {
                    background: rgba(10, 30, 56, 0.6);
                    border: 1px solid rgba(255, 255, 255, 0.06);
                    border-radius: 16px;
                    padding: 32px 28px;
                    text-align: center;
                    transition: all 0.3s;
                    height: 100%;
                    position: relative;
                    overflow: hidden
                }

                .step-card::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    height: 3px;
                    background: linear-gradient(90deg, transparent, var(--accent), transparent);
                    opacity: 0;
                    transition: opacity 0.3s
                }

                .step-card:hover {
                    border-color: rgba(0, 86, 166, 0.3);
                    transform: translateY(-4px);
                    box-shadow: 0 16px 48px rgba(0, 0, 0, 0.3)
                }

                .step-card:hover::before {
                    opacity: 1
                }

                .step-num {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 18px;
                    font-weight: 800;
                    font-size: 0.9rem
                }

                .sn-1 {
                    background: rgba(0, 86, 166, 0.2);
                    color: #60a5fa;
                    --accent: #0056A6
                }

                .sn-2 {
                    background: rgba(50, 205, 50, 0.15);
                    color: #32CD32;
                    --accent: #32CD32
                }

                .sn-3 {
                    background: rgba(0, 86, 166, 0.2);
                    color: #60a5fa;
                    --accent: #1A5F9C
                }

                .step-icon {
                    font-size: 2.2rem;
                    margin-bottom: 14px
                }

                .step-card h5 {
                    font-weight: 700;
                    font-size: 1rem;
                    margin-bottom: 8px;
                    color: #e8ecf1
                }

                .step-card p {
                    color: rgba(232, 236, 241, 0.45);
                    font-size: 0.88rem;
                    line-height: 1.6;
                    margin: 0
                }

                .features-section {
                    padding: 80px 0
                }

                .feat-card {
                    background: rgba(10, 30, 56, 0.5);
                    border: 1px solid rgba(255, 255, 255, 0.06);
                    border-radius: 16px;
                    padding: 28px 24px;
                    transition: all 0.3s;
                    height: 100%;
                    text-align: center
                }

                .feat-card:hover {
                    border-color: rgba(0, 86, 166, 0.25);
                    transform: translateY(-3px);
                    box-shadow: 0 12px 36px rgba(0, 0, 0, 0.25)
                }

                .feat-icon {
                    width: 64px;
                    height: 64px;
                    border-radius: 14px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 18px;
                    font-size: 2rem
                }

                .fi-1 {
                    background: linear-gradient(135deg, rgba(0, 86, 166, 0.2), rgba(0, 86, 166, 0.05))
                }

                .fi-2 {
                    background: linear-gradient(135deg, rgba(50, 205, 50, 0.2), rgba(50, 205, 50, 0.05))
                }

                .fi-3 {
                    background: linear-gradient(135deg, rgba(0, 86, 166, 0.2), rgba(0, 86, 166, 0.05))
                }

                .fi-4 {
                    background: linear-gradient(135deg, rgba(50, 205, 50, 0.2), rgba(50, 205, 50, 0.05))
                }

                .fi-5 {
                    background: linear-gradient(135deg, rgba(0, 86, 166, 0.2), rgba(0, 86, 166, 0.05))
                }

                .fi-6 {
                    background: linear-gradient(135deg, rgba(50, 205, 50, 0.2), rgba(50, 205, 50, 0.05))
                }

                .feat-card h6 {
                    font-weight: 700;
                    font-size: 0.95rem;
                    margin-bottom: 6px;
                    color: #e8ecf1
                }

                .feat-card p {
                    color: rgba(232, 236, 241, 0.4);
                    font-size: 0.84rem;
                    line-height: 1.6;
                    margin: 0
                }

                .cta-banner {
                    padding: 60px 0;
                    text-align: center
                }

                .cta-box {
                    background: linear-gradient(135deg, rgba(0, 86, 166, 0.15), rgba(50, 205, 50, 0.08));
                    border: 1px solid rgba(0, 86, 166, 0.25);
                    border-radius: 20px;
                    padding: 48px 40px;
                    max-width: 680px;
                    margin: 0 auto;
                    position: relative;
                    overflow: hidden
                }

                .cta-box h3 {
                    font-size: 1.6rem;
                    font-weight: 800;
                    margin-bottom: 10px;
                    color: #fff
                }

                .cta-box p {
                    color: rgba(232, 236, 241, 0.5);
                    margin-bottom: 24px;
                    font-size: 0.95rem
                }

                /* ── Footer ── */
                .site-footer {
                    background: rgba(6, 14, 28, 0.95);
                    border-top: 1px solid rgba(255, 255, 255, 0.06);
                    padding: 48px 0 28px
                }

                .footer-grid {
                    display: grid;
                    grid-template-columns: 2fr 1fr 1fr 1fr;
                    gap: 40px;
                    margin-bottom: 36px
                }

                .footer-brand .brand-name {
                    font-weight: 800;
                    font-size: 1.2rem;
                    color: #fff;
                    margin-bottom: 10px
                }

                .footer-brand .brand-name span {
                    background: linear-gradient(135deg, #32CD32, #A4C639);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text
                }

                .footer-brand p {
                    color: rgba(232, 236, 241, 0.4);
                    font-size: 0.85rem;
                    line-height: 1.7;
                    max-width: 280px
                }

                .footer-col h6 {
                    font-weight: 700;
                    font-size: 0.82rem;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                    color: rgba(232, 236, 241, 0.6);
                    margin-bottom: 16px
                }

                .footer-col a {
                    display: block;
                    color: rgba(232, 236, 241, 0.4);
                    font-size: 0.88rem;
                    text-decoration: none;
                    padding: 4px 0;
                    transition: color 0.2s
                }

                .footer-col a:hover {
                    color: #32CD32
                }

                .footer-divider {
                    border: none;
                    border-top: 1px solid rgba(255, 255, 255, 0.06);
                    margin: 0 0 20px
                }

                .footer-bottom {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    flex-wrap: wrap;
                    gap: 12px
                }

                .footer-bottom p {
                    color: rgba(232, 236, 241, 0.3);
                    font-size: 0.82rem;
                    margin: 0
                }

                .footer-bottom .social-links {
                    display: flex;
                    gap: 12px
                }

                .footer-bottom .social-links a {
                    width: 34px;
                    height: 34px;
                    border-radius: 8px;
                    border: 1px solid rgba(255, 255, 255, 0.08);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: rgba(232, 236, 241, 0.4);
                    text-decoration: none;
                    font-size: 0.85rem;
                    transition: all 0.2s
                }

                .footer-bottom .social-links a:hover {
                    border-color: rgba(50, 205, 50, 0.4);
                    color: #32CD32;
                    background: rgba(50, 205, 50, 0.06)
                }

                @media(max-width:768px) {
                    .footer-grid {
                        grid-template-columns: 1fr 1fr;
                        gap: 24px
                    }
                }

                @media(max-width:480px) {
                    .footer-grid {
                        grid-template-columns: 1fr
                    }
                }

                .scroll-top {
                    position: fixed;
                    bottom: 24px;
                    right: 24px;
                    width: 40px;
                    height: 40px;
                    background: rgba(10, 30, 56, 0.9);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    border-radius: 10px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: rgba(255, 255, 255, 0.5);
                    text-decoration: none;
                    transition: all 0.2s;
                    z-index: 999
                }

                .scroll-top:hover {
                    border-color: rgba(50, 205, 50, 0.5);
                    color: #32CD32
                }

                @media(max-width:768px) {
                    .hero-text h1 {
                        font-size: 2.4rem
                    }

                    .hero-visual {
                        margin-top: 40px
                    }

                    .strip-inner {
                        gap: 24px
                    }
                }
            </style>
        </head>

        <body>
            <%@ include file="navbar.jsp" %>
                <section class="hero">
                    <div class="container">
                        <div class="hero-row">
                            <div class="hero-text">
                                <div class="hero-badge"><span class="dot"></span>Sri Lanka's #1 Bike Rental Platform
                                </div>
                                <h1>PeddleMe.<br><span class="grad">Your daily ride, Made Simple.</span></h1>
                                <p class="lead">Book city & mountain bikes in seconds. Affordable hourly rates,
                                    real-time availability, and seamless reservations — all in one place.</p>
                                <div class="hero-buttons">
                                    <a href="${pageContext.request.contextPath}/register" class="btn-green">Get Started
                                        Free</a>
                                    <a href="${pageContext.request.contextPath}/login" class="btn-ghost">Sign in</a>
                                </div>
                                <div class="hero-stats">
                                    <div class="hero-stat">
                                        <div class="num">500+</div>
                                        <div class="lbl">Happy Riders</div>
                                    </div>
                                    <div class="hero-stat">
                                        <div class="num">50+</div>
                                        <div class="lbl">Bikes Available</div>
                                    </div>
                                    <div class="hero-stat">
                                        <div class="num">4.9★</div>
                                        <div class="lbl">User Rating</div>
                                    </div>
                                </div>
                            </div>
                            <div class="hero-visual">
                                <div class="hero-img-wrap">
                                    <div class="hero-img-glow"></div>
                                    <img src="${pageContext.request.contextPath}/images/bicycle_rider_hero.png"
                                        alt="Boy riding a bicycle - PeddleMe Platform">
                                    <div class="hero-road"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <div class="transport-strip">
                    <div class="container">
                        <div class="strip-inner">
                            <div class="strip-item">
                                <div class="strip-icon si-1">🚲</div><span>City Bikes</span>
                            </div>
                            <div class="strip-item">
                                <div class="strip-icon si-2">🏔️</div><span>Mountain Bikes</span>
                            </div>
                            <div class="strip-item">
                                <div class="strip-icon si-3">⚡</div><span>Instant Booking</span>
                            </div>
                            <div class="strip-item">
                                <div class="strip-icon si-4">📍</div><span>Island-wide</span>
                            </div>
                        </div>
                    </div>
                </div>

                <section class="how-section" id="howItWorks">
                    <div class="container text-center">
                        <span class="sec-badge">How It Works</span>
                        <h2 class="sec-title">Book a bike in 3 easy steps</h2>
                        <p class="sec-sub">No hassle. No hidden fees. Just ride.</p>
                        <div class="row g-4">
                            <div class="col-md-4">
                                <div class="step-card" style="--accent:#0056A6">
                                    <div class="step-num sn-1">1</div>
                                    <div class="step-icon">🔍</div>
                                    <h5>Browse & Choose</h5>
                                    <p>Explore our fleet of city and mountain bikes. Filter by type, brand, and price.
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="step-card" style="--accent:#32CD32">
                                    <div class="step-num sn-2">2</div>
                                    <div class="step-icon">📅</div>
                                    <h5>Pick Your Dates</h5>
                                    <p>Select your start and end dates. See real-time availability and total cost
                                        instantly.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="step-card" style="--accent:#1A5F9C">
                                    <div class="step-num sn-3">3</div>
                                    <div class="step-icon">🚴</div>
                                    <h5>Ride & Enjoy</h5>
                                    <p>Confirm your booking and hit the road. Track your reservations from your
                                        dashboard.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="features-section" id="featuresSection">
                    <div class="container text-center">
                        <span class="sec-badge">Features</span>
                        <h2 class="sec-title">Built for riders, by riders</h2>
                        <p class="sec-sub">Everything you need for a seamless bike rental experience.</p>
                        <div class="row g-4">
                            <div class="col-md-4 col-sm-6">
                                <div class="feat-card">
                                    <div class="feat-icon fi-1">⚡</div>
                                    <h6>Instant Booking</h6>
                                    <p>Reserve your bike in seconds with our streamlined booking flow.</p>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="feat-card">
                                    <div class="feat-icon fi-2">🛡️</div>
                                    <h6>Secure Platform</h6>
                                    <p>Your data and payments are protected with industry-standard security.</p>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="feat-card">
                                    <div class="feat-icon fi-3">💰</div>
                                    <h6>Transparent Pricing</h6>
                                    <p>Clear hourly rates with zero hidden fees. Pay only for what you ride.</p>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="feat-card">
                                    <div class="feat-icon fi-4">📊</div>
                                    <h6>Ride Dashboard</h6>
                                    <p>Track all your reservations, costs, and ride history in one place.</p>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="feat-card">
                                    <div class="feat-icon fi-5">🚲</div>
                                    <h6>Diverse Fleet</h6>
                                    <p>From city cruisers to mountain bikes — find the perfect ride for any terrain.</p>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="feat-card">
                                    <div class="feat-icon fi-6">✅</div>
                                    <h6>Easy Cancellation</h6>
                                    <p>Plans changed? Cancel your booking hassle-free from your dashboard.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="cta-banner">
                    <div class="container">
                        <div class="cta-box">
                            <h3>Ready to ride? 🚴</h3>
                            <p>Join hundreds of riders across Sri Lanka. Your next adventure is one click away.</p>
                            <a href="${pageContext.request.contextPath}/register" class="btn-green">Create Free
                                Account</a>
                        </div>
                    </div>
                </section>

                <footer class="site-footer">
                    <div class="container">
                        <div class="footer-grid">
                            <div class="footer-brand">
                                <div class="brand-name">🚲 Peddle<span>Me</span></div>
                                <p>Sri Lanka's favourite bike rental platform. Ride smarter, explore further,
                                    and make every journey count.</p>
                            </div>
                            <div class="footer-col">
                                <h6>Platform</h6>
                                <a href="${pageContext.request.contextPath}/">Home</a>
                                <a href="${pageContext.request.contextPath}/bikes">Browse Bikes</a>
                                <a href="${pageContext.request.contextPath}/register">Sign Up</a>
                                <a href="${pageContext.request.contextPath}/login">Sign In</a>
                            </div>
                            <div class="footer-col">
                                <h6>Support</h6>
                                <a href="${pageContext.request.contextPath}/contact">Contact Us</a>
                                <a href="#">FAQ</a>
                                <a href="#">Terms of Service</a>
                                <a href="#">Privacy Policy</a>
                            </div>
                            <div class="footer-col">
                                <h6>Contact</h6>
                                <a href="tel:070XXXXXXX">📞 070XXXXXXX</a>
                                <a href="mailto:support@peddleme.lk">✉️ support@peddleme.lk</a>
                                <a href="#">📍 Colombo, Sri Lanka</a>
                            </div>
                        </div>
                        <hr class="footer-divider">
                        <div class="footer-bottom">
                            <p>&copy; 2026 PeddleMe — SE1020 Weekend Group 07</p>
                            <div class="social-links">
                                <a href="#" title="Facebook">f</a>
                                <a href="#" title="Instagram">ig</a>
                                <a href="#" title="Twitter">𝕏</a>
                            </div>
                        </div>
                    </div>
                </footer>
                <a href="#" class="scroll-top" title="Back to top"><svg width="16" height="16" viewBox="0 0 24 24"
                        fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
                        stroke-linejoin="round">
                        <polyline points="18 15 12 9 6 15" />
                    </svg></a>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>