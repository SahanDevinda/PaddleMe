<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="Get in touch with PeddleMe — Sri Lanka's premium bike rental platform.">
            <title>Contact Us — PeddleMe</title>
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

                /* ── Hero ── */
                .contact-hero {
                    position: relative;
                    padding: 80px 0 50px;
                    text-align: center;
                    overflow: hidden
                }

                .contact-hero::before {
                    content: '';
                    position: absolute;
                    top: -250px;
                    left: 50%;
                    transform: translateX(-50%);
                    width: 1000px;
                    height: 1000px;
                    background: radial-gradient(ellipse, rgba(0, 86, 166, 0.14) 0%, rgba(50, 205, 50, 0.06) 35%, transparent 65%);
                    pointer-events: none;
                    z-index: 0
                }

                .contact-hero .container {
                    position: relative;
                    z-index: 1
                }

                .hero-emoji {
                    font-size: 3.5rem;
                    margin-bottom: 16px;
                    display: block;
                    animation: heroFloat 3s ease-in-out infinite
                }

                @keyframes heroFloat {
                    0%, 100% { transform: translateY(0) }
                    50% { transform: translateY(-12px) }
                }

                .contact-hero h1 {
                    font-size: 2.8rem;
                    font-weight: 900;
                    letter-spacing: -1.5px;
                    margin-bottom: 14px;
                    color: #fff
                }

                .contact-hero h1 .grad {
                    background: linear-gradient(135deg, #32CD32, #A4C639);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text
                }

                .contact-hero .lead {
                    color: rgba(232, 236, 241, 0.5);
                    font-size: 1.05rem;
                    max-width: 560px;
                    margin: 0 auto;
                    line-height: 1.7
                }

                /* ── Quote Banner ── */
                .quote-banner {
                    padding: 40px 0;
                    text-align: center;
                    border-top: 1px solid rgba(255, 255, 255, 0.04);
                    border-bottom: 1px solid rgba(255, 255, 255, 0.04);
                    background: rgba(8, 20, 40, 0.5)
                }

                .quote-text {
                    font-size: 1.15rem;
                    font-weight: 600;
                    font-style: italic;
                    color: rgba(232, 236, 241, 0.65);
                    max-width: 600px;
                    margin: 0 auto;
                    line-height: 1.8
                }

                .quote-text span {
                    color: #32CD32;
                    font-weight: 700
                }

                /* ── Contact Cards ── */
                .contact-section {
                    padding: 70px 0
                }

                .contact-card {
                    background: rgba(10, 30, 56, 0.7);
                    border: 1px solid rgba(255, 255, 255, 0.06);
                    border-radius: 16px;
                    padding: 40px 32px;
                    text-align: center;
                    transition: all 0.35s;
                    height: 100%;
                    position: relative;
                    overflow: hidden;
                    backdrop-filter: blur(10px)
                }

                .contact-card::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    height: 3px;
                    background: linear-gradient(90deg, transparent, var(--accent, #0056A6), transparent);
                    opacity: 0;
                    transition: opacity 0.35s
                }

                .contact-card:hover {
                    border-color: rgba(0, 86, 166, 0.3);
                    transform: translateY(-6px);
                    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.35)
                }

                .contact-card:hover::before {
                    opacity: 1
                }

                .card-icon {
                    width: 72px;
                    height: 72px;
                    border-radius: 16px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0 auto 20px;
                    font-size: 2rem
                }

                .ci-phone {
                    background: linear-gradient(135deg, rgba(0, 86, 166, 0.2), rgba(0, 86, 166, 0.05))
                }

                .ci-email {
                    background: linear-gradient(135deg, rgba(50, 205, 50, 0.2), rgba(50, 205, 50, 0.05))
                }

                .ci-location {
                    background: linear-gradient(135deg, rgba(96, 165, 250, 0.2), rgba(96, 165, 250, 0.05))
                }

                .ci-hours {
                    background: linear-gradient(135deg, rgba(164, 198, 57, 0.2), rgba(164, 198, 57, 0.05))
                }

                .contact-card h5 {
                    font-weight: 700;
                    font-size: 1.05rem;
                    margin-bottom: 8px;
                    color: #e8ecf1
                }

                .contact-card .info-value {
                    font-weight: 800;
                    font-size: 1.1rem;
                    color: #32CD32;
                    margin-bottom: 6px
                }

                .contact-card .info-sub {
                    color: rgba(232, 236, 241, 0.4);
                    font-size: 0.85rem;
                    line-height: 1.6
                }

                /* ── Message Form ── */
                .form-section {
                    padding: 0 0 80px
                }

                .form-wrapper {
                    max-width: 640px;
                    margin: 0 auto
                }

                .form-inner {
                    background: rgba(10, 30, 56, 0.7);
                    border: 1px solid rgba(255, 255, 255, 0.06);
                    border-radius: 16px;
                    overflow: hidden;
                    backdrop-filter: blur(12px)
                }

                .form-header {
                    background: linear-gradient(135deg, rgba(0, 86, 166, 0.2), rgba(50, 205, 50, 0.08));
                    padding: 28px 36px;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.04);
                    text-align: center
                }

                .form-header h3 {
                    font-weight: 800;
                    font-size: 1.3rem;
                    margin: 0 0 4px;
                    color: #fff
                }

                .form-header p {
                    color: rgba(232, 236, 241, 0.45);
                    font-size: 0.88rem;
                    margin: 0
                }

                .form-body {
                    padding: 36px
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

                textarea.form-control {
                    resize: vertical;
                    min-height: 120px
                }

                .btn-send {
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

                .btn-send:hover {
                    box-shadow: 0 6px 24px rgba(50, 205, 50, 0.4);
                    transform: translateY(-2px)
                }

                /* ── FAQ Strip ── */
                .faq-section {
                    padding: 60px 0;
                    border-top: 1px solid rgba(255, 255, 255, 0.04)
                }

                .faq-card {
                    background: rgba(10, 30, 56, 0.5);
                    border: 1px solid rgba(255, 255, 255, 0.06);
                    border-radius: 14px;
                    padding: 24px;
                    transition: all 0.3s;
                    height: 100%
                }

                .faq-card:hover {
                    border-color: rgba(0, 86, 166, 0.2);
                    transform: translateY(-3px)
                }

                .faq-card h6 {
                    font-weight: 700;
                    font-size: 0.95rem;
                    color: #e8ecf1;
                    margin-bottom: 8px
                }

                .faq-card p {
                    color: rgba(232, 236, 241, 0.4);
                    font-size: 0.84rem;
                    line-height: 1.6;
                    margin: 0
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
                    font-size: 2rem;
                    font-weight: 800;
                    letter-spacing: -1px;
                    margin-bottom: 10px;
                    color: #fff
                }

                .sec-sub {
                    color: rgba(232, 236, 241, 0.45);
                    font-size: 1rem;
                    margin-bottom: 40px
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
                    .contact-hero h1 {
                        font-size: 2rem
                    }

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
            </style>
        </head>

        <body>
            <%@ include file="navbar.jsp" %>

                <!-- Hero -->
                <section class="contact-hero">
                    <div class="container">
                        <span class="hero-emoji">📬</span>
                        <h1>Let's <span class="grad">Connect</span></h1>
                        <p class="lead">Got a question, feedback, or just want to say hi? We're all ears.
                            Every great ride starts with a conversation.</p>
                    </div>
                </section>

                <!-- Quote -->
                <div class="quote-banner">
                    <div class="container">
                        <p class="quote-text">"Life is like riding a bicycle — to keep your balance,
                            you must keep <span>moving forward</span>." &mdash; Albert Einstein</p>
                    </div>
                </div>

                <!-- Contact Cards -->
                <section class="contact-section">
                    <div class="container">
                        <div class="row g-4">
                            <div class="col-md-6 col-lg-3">
                                <div class="contact-card" style="--accent:#0056A6">
                                    <div class="card-icon ci-phone">📞</div>
                                    <h5>Call Us</h5>
                                    <div class="info-value">070XXXXXXX</div>
                                    <p class="info-sub">Mon — Sat, 8 AM to 8 PM.<br>We pick up faster than you pedal!</p>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="contact-card" style="--accent:#32CD32">
                                    <div class="card-icon ci-email">✉️</div>
                                    <h5>Email Us</h5>
                                    <div class="info-value">support@peddleme.lk</div>
                                    <p class="info-sub">Drop us a line anytime.<br>We reply within 24 hours — pinky promise.</p>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="contact-card" style="--accent:#60a5fa">
                                    <div class="card-icon ci-location">📍</div>
                                    <h5>Visit Us</h5>
                                    <div class="info-value">Colombo, Sri Lanka</div>
                                    <p class="info-sub">SLIIT Campus, Malabe.<br>Come say hello — bikes & coffee await!</p>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="contact-card" style="--accent:#A4C639">
                                    <div class="card-icon ci-hours">🕐</div>
                                    <h5>Working Hours</h5>
                                    <div class="info-value">8 AM — 8 PM</div>
                                    <p class="info-sub">Monday to Saturday.<br>Sundays? We're out riding too! 🚴</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Contact Form -->
                <section class="form-section">
                    <div class="container">
                        <div class="form-wrapper">
                            <div class="form-inner">
                                <div class="form-header">
                                    <h3>✍️ Send Us a Message</h3>
                                    <p>Whether it's a flat tire or a feature request — we've got you covered.</p>
                                </div>
                                <div class="form-body">
                                    <form>
                                        <div class="mb-3">
                                            <label class="form-label">Your Name</label>
                                            <input type="text" class="form-control" placeholder="e.g. Kasun Perera">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Email Address</label>
                                            <input type="email" class="form-control" placeholder="kasun@email.com">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Subject</label>
                                            <input type="text" class="form-control"
                                                placeholder="e.g. Booking inquiry, Partnership, Feedback">
                                        </div>
                                        <div class="mb-4">
                                            <label class="form-label">Message</label>
                                            <textarea class="form-control"
                                                placeholder="Tell us what's on your mind..."></textarea>
                                        </div>
                                        <button type="submit" class="btn-send">Send Message 🚀</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- FAQ Strip -->
                <section class="faq-section">
                    <div class="container text-center">
                        <span class="sec-badge">FAQ</span>
                        <h2 class="sec-title">Common Questions</h2>
                        <p class="sec-sub">Quick answers to help you hit the road faster.</p>
                        <div class="row g-4 text-start">
                            <div class="col-md-4">
                                <div class="faq-card">
                                    <h6>🔑 How do I book a bike?</h6>
                                    <p>Simply create a free account, browse our fleet, pick your dates, and confirm.
                                        It takes less than 60 seconds!</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="faq-card">
                                    <h6>💳 What payment methods do you accept?</h6>
                                    <p>We accept cash on pickup and all major bank transfers.
                                        Online payments coming soon!</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="faq-card">
                                    <h6>🔄 Can I cancel my reservation?</h6>
                                    <p>Absolutely! You can cancel any active booking from your dashboard
                                        — no hidden fees, no questions asked.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Footer -->
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

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>
