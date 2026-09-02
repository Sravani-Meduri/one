<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>NexusShop — Modern E‑Commerce</title>

    <!-- Fonts & Icons -->
    <link href="[fonts.googleapis.com](https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap)" rel="stylesheet">
    <link rel="stylesheet" href="[cdnjs.cloudflare.com](https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css)" integrity="" crossorigin="anonymous">

    <style>
        :root {
            --bg: #f8fafc;
            --card: #ffffff;
            --surface: #f1f5f9;
            --primary: #0f172a;
            --primary-light: #1e293b;
            --accent: #6366f1;
            --accent-hover: #4f46e5;
            --accent-soft: #eef2ff;
            --warm: #f97316;
            --warm-hover: #ea580c;
            --muted: #64748b;
            --muted-light: #94a3b8;
            --border: #e2e8f0;
            --success: #10b981;
            --danger: #ef4444;
            --star: #f59e0b;
            --radius: 14px;
            --radius-sm: 10px;
            --radius-pill: 999px;
            --container: 1200px;
            --shadow-sm: 0 1px 2px rgba(15, 23, 42, 0.04);
            --shadow: 0 1px 3px rgba(15, 23, 42, 0.06), 0 1px 2px rgba(15, 23, 42, 0.04);
            --shadow-md: 0 4px 6px rgba(15, 23, 42, 0.05), 0 2px 4px rgba(15, 23, 42, 0.04);
            --shadow-lg: 0 10px 25px rgba(15, 23, 42, 0.08), 0 4px 10px rgba(15, 23, 42, 0.04);
            --shadow-xl: 0 20px 40px rgba(15, 23, 42, 0.1);
            --transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            --transition-slow: 0.35s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Plus Jakarta Sans', system-ui, -apple-system, sans-serif;
            color: var(--primary);
            background: var(--bg);
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            line-height: 1.6;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        img {
            display: block;
            max-width: 100%;
        }

        .container {
            width: 100%;
            max-width: var(--container);
            margin: 0 auto;
            padding: 0 24px;
        }

        /* ── Header ── */
        header {
            position: sticky;
            top: 0;
            z-index: 40;
            background: rgba(255, 255, 255, 0.92);
            border-bottom: 1px solid var(--border);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
        }

        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            padding: 12px 0;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 800;
            font-size: 22px;
            color: var(--primary);
            letter-spacing: -0.03em;
        }

        .brand .accent {
            color: var(--accent);
        }

        nav.main-nav ul {
            display: flex;
            gap: 4px;
            list-style: none;
            align-items: center;
        }

        nav.main-nav li a {
            display: flex;
            gap: 7px;
            align-items: center;
            padding: 8px 14px;
            border-radius: var(--radius-sm);
            color: var(--primary);
            font-weight: 500;
            font-size: 14px;
            transition: var(--transition);
        }

        nav.main-nav li a:hover {
            background: var(--accent-soft);
            color: var(--accent);
        }

        .search {
            display: flex;
            align-items: center;
            gap: 8px;
            background: var(--surface);
            padding: 9px 16px;
            border-radius: var(--radius-pill);
            min-width: 240px;
            border: 2px solid transparent;
            transition: var(--transition);
        }

        .search:focus-within {
            border-color: var(--accent);
            background: var(--card);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
        }

        .search input {
            border: 0;
            background: transparent;
            outline: none;
            width: 100%;
            font-size: 14px;
            font-family: inherit;
            color: var(--primary);
        }

        .search input::placeholder {
            color: var(--muted-light);
        }

        .icon-btn {
            background: transparent;
            border: 0;
            cursor: pointer;
            color: var(--primary);
            font-size: 17px;
            padding: 8px;
            border-radius: var(--radius-sm);
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .icon-btn:hover {
            background: var(--surface);
            color: var(--accent);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .cart {
            position: relative;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 12px;
            border-radius: var(--radius-sm);
            transition: var(--transition);
            font-weight: 600;
        }

        .cart:hover {
            background: var(--accent-soft);
        }

        .cart-count {
            position: absolute;
            top: -4px;
            right: -4px;
            background: var(--warm);
            color: white;
            font-size: 11px;
            font-weight: 700;
            min-width: 20px;
            height: 20px;
            border-radius: var(--radius-pill);
            display: inline-grid;
            place-items: center;
            padding: 0 5px;
            box-shadow: 0 2px 6px rgba(249, 115, 22, 0.35);
            transition: transform 0.2s ease;
        }

        .cart-count:empty { display: none; }

        .mobile-toggle {
            display: none;
            border: 0;
            background: transparent;
            font-size: 22px;
            cursor: pointer;
            color: var(--primary);
            padding: 6px;
            border-radius: var(--radius-sm);
        }

        /* ── Hero ── */
        .hero {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            background:
                linear-gradient(135deg, rgba(15, 23, 42, 0.72), rgba(30, 41, 59, 0.65), rgba(99, 102, 241, 0.45)),
                url('[images.unsplash.com](https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80)') center/cover no-repeat;
            color: white;
            min-height: 440px;
            padding: 64px 20px;
            border-radius: 0 0 28px 28px;
            position: relative;
            overflow: hidden;
        }

        .hero::after {
            content: '';
            position: absolute;
            inset: 0;
            background: radial-gradient(ellipse at 30% 20%, rgba(99, 102, 241, 0.3), transparent 60%);
            pointer-events: none;
        }

        .hero .container {
            position: relative;
            z-index: 1;
        }

        .hero h1 {
            font-weight: 800;
            font-size: 48px;
            margin: 0 0 16px;
            letter-spacing: -0.03em;
            line-height: 1.15;
        }

        .hero p {
            margin: 0 auto 28px;
            opacity: 0.9;
            max-width: 700px;
            font-size: 17px;
            line-height: 1.7;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 12px 24px;
            border-radius: var(--radius-pill);
            font-weight: 600;
            cursor: pointer;
            border: 0;
            font-family: inherit;
            font-size: 15px;
            transition: var(--transition);
            white-space: nowrap;
        }

        .btn-primary {
            background: var(--warm);
            color: white;
            box-shadow: 0 4px 14px rgba(249, 115, 22, 0.35);
        }

        .btn-primary:hover {
            background: var(--warm-hover);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(249, 115, 22, 0.45);
        }

        .btn-ghost {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.25);
            color: white;
            backdrop-filter: blur(4px);
        }

        .btn-ghost:hover {
            background: rgba(255, 255, 255, 0.18);
            border-color: rgba(255, 255, 255, 0.45);
        }

        .btn-accent {
            background: var(--accent);
            color: white;
            box-shadow: 0 4px 14px rgba(99, 102, 241, 0.3);
        }

        .btn-accent:hover {
            background: var(--accent-hover);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(99, 102, 241, 0.4);
        }

        /* ── Sections ── */
        .section {
            padding: 56px 0;
        }

        .section-title {
            font-weight: 800;
            font-size: 30px;
            letter-spacing: -0.02em;
            margin-bottom: 6px;
        }

        .section-subtitle {
            color: var(--muted);
            font-size: 15px;
            margin-bottom: 32px;
        }

        .title {
            text-align: center;
            margin-bottom: 8px;
        }

        .grid {
            display: grid;
            gap: 20px;
        }

        /* ── Categories ── */
        .categories {
            grid-template-columns: repeat(6, 1fr);
        }

        .cat-card {
            background: var(--card);
            border-radius: var(--radius);
            padding: 24px 16px;
            text-align: center;
            box-shadow: var(--shadow);
            transition: var(--transition-slow);
            cursor: pointer;
            border: 2px solid transparent;
            position: relative;
            overflow: hidden;
        }

        .cat-card::before {
            content: '';
            position: absolute;
            inset: 0;
            background: var(--accent-soft);
            opacity: 0;
            transition: var(--transition-slow);
            border-radius: var(--radius);
        }

        .cat-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-xl);
            border-color: var(--accent);
        }

        .cat-card:hover::before {
            opacity: 1;
        }

        .cat-card .icon {
            font-size: 30px;
            color: var(--accent);
            margin-bottom: 10px;
            position: relative;
            z-index: 1;
            transition: var(--transition);
        }

        .cat-card:hover .icon {
            transform: scale(1.15);
        }

        .cat-card h4 {
            margin: 6px 0 0;
            font-size: 15px;
            font-weight: 600;
            position: relative;
            z-index: 1;
        }

        .cat-card .cat-subtitle {
            position: relative;
            z-index: 1;
        }

        /* ── Products ── */
        .products {
            grid-template-columns: repeat(4, 1fr);
        }

        .product {
            background: var(--card);
            border-radius: var(--radius);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            box-shadow: var(--shadow);
            transition: var(--transition-slow);
            border: 2px solid transparent;
            position: relative;
        }

        .product:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-xl);
            border-color: var(--border);
        }

        .product-img-wrap {
            position: relative;
            overflow: hidden;
        }

        .product img {
            width: 100%;
            height: 210px;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .product:hover img {
            transform: scale(1.06);
        }

        .product-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            z-index: 2;
            padding: 5px 10px;
            border-radius: var(--radius-pill);
            font-weight: 700;
            font-size: 12px;
            color: white;
            backdrop-filter: blur(4px);
            letter-spacing: 0.02em;
        }

        .badge-new {
            background: var(--success);
        }

        .badge-sale {
            background: var(--danger);
        }

        .product-body {
            padding: 16px;
            display: flex;
            flex-direction: column;
            gap: 8px;
            flex: 1;
        }

        .product-category {
            font-size: 12px;
            color: var(--muted);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            font-weight: 600;
        }

        .product h5 {
            margin: 0;
            font-size: 15px;
            font-weight: 700;
            line-height: 1.3;
        }

        .price-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 8px;
            margin-top: auto;
        }

        .price {
            font-weight: 800;
            font-size: 18px;
            color: var(--primary);
        }

        .old-price {
            color: var(--muted-light);
            text-decoration: line-through;
            font-weight: 500;
            font-size: 13px;
            margin-left: 6px;
        }

        .rating {
            color: var(--star);
            font-size: 13px;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .rating-count {
            color: var(--muted-light);
            font-size: 12px;
        }

        .product-footer {
            padding: 0 16px 16px;
            display: flex;
            gap: 10px;
        }

        .add-btn {
            flex: 1;
            background: var(--primary);
            color: white;
            border: 0;
            padding: 11px;
            border-radius: var(--radius-sm);
            cursor: pointer;
            font-weight: 600;
            font-family: inherit;
            font-size: 14px;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
        }

        .add-btn:hover {
            background: var(--primary-light);
            transform: translateY(-1px);
        }

        .wish-btn {
            background: var(--surface);
            border: 2px solid transparent;
            padding: 10px 12px;
            border-radius: var(--radius-sm);
            cursor: pointer;
            font-size: 16px;
            color: var(--muted);
            transition: var(--transition);
        }

        .wish-btn:hover {
            border-color: var(--danger);
            color: var(--danger);
            background: #fef2f2;
        }

        /* ── Deal Section ── */
        .deal {
            display: flex;
            gap: 0;
            background: var(--card);
            border-radius: var(--radius);
            overflow: hidden;
            align-items: stretch;
            box-shadow: var(--shadow-lg);
            border: 2px solid var(--border);
        }

        .deal-img-wrap {
            width: 50%;
            position: relative;
            overflow: hidden;
        }

        .deal img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .deal .content {
            padding: 36px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .deal h3 {
            font-size: 26px;
            font-weight: 800;
            margin-bottom: 6px;
        }

        .timer {
            display: flex;
            gap: 12px;
            margin: 20px 0;
        }

        .time-box {
            background: var(--primary);
            color: white;
            padding: 14px 18px;
            border-radius: var(--radius-sm);
            min-width: 72px;
            text-align: center;
            font-weight: 700;
            font-size: 22px;
            line-height: 1.1;
        }

        .time-box .label {
            font-size: 11px;
            font-weight: 500;
            opacity: 0.75;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .deal .price {
            font-size: 30px;
        }

        .deal-discount {
            background: var(--danger);
            color: white;
            padding: 6px 12px;
            border-radius: var(--radius-pill);
            font-weight: 700;
            font-size: 14px;
        }

        /* ── Testimonials ── */
        .testimonials {
            display: flex;
            gap: 16px;
            overflow-x: auto;
            padding: 8px 4px 16px;
            scroll-snap-type: x mandatory;
        }

        .testimonials::-webkit-scrollbar {
            height: 6px;
        }

        .testimonials::-webkit-scrollbar-track {
            background: var(--surface);
            border-radius: var(--radius-pill);
        }

        .testimonials::-webkit-scrollbar-thumb {
            background: var(--muted-light);
            border-radius: var(--radius-pill);
        }

        .testimonial {
            min-width: 340px;
            background: var(--card);
            padding: 24px;
            border-radius: var(--radius);
            box-shadow: var(--shadow-md);
            border: 2px solid var(--border);
            scroll-snap-align: start;
            transition: var(--transition);
        }

        .testimonial:hover {
            box-shadow: var(--shadow-lg);
            border-color: var(--accent);
        }

        .testimonial .avatar {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            object-fit: cover;
        }

        /* ── Newsletter ── */
        .newsletter {
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            color: white;
            border-radius: var(--radius);
            padding: 48px 32px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .newsletter::before {
            content: '';
            position: absolute;
            inset: 0;
            background: radial-gradient(ellipse at 70% 30%, rgba(99, 102, 241, 0.35), transparent 60%);
            pointer-events: none;
        }

        .newsletter > * {
            position: relative;
            z-index: 1;
        }

        .newsletter h3 {
            font-size: 26px;
            font-weight: 800;
            margin-bottom: 8px;
        }

        .newsletter p {
            opacity: 0.85;
            margin-bottom: 24px;
        }

        .newsletter-form {
            display: flex;
            justify-content: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .newsletter input {
            padding: 13px 18px;
            border-radius: var(--radius-pill);
            border: 2px solid transparent;
            width: 340px;
            max-width: 100%;
            font-family: inherit;
            font-size: 15px;
            outline: none;
            transition: var(--transition);
        }

        .newsletter input:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.2);
        }

        .newsletter .btn {
            box-shadow: 0 4px 14px rgba(249, 115, 22, 0.4);
        }

        /* ── Footer ── */
        footer {
            margin-top: 24px;
            padding: 44px 0 28px;
            border-top: 1px solid var(--border);
            color: var(--muted);
            font-size: 14px;
        }

        footer .footer-brand {
            font-weight: 800;
            font-size: 19px;
            color: var(--primary);
        }

        footer .footer-heading {
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 10px;
        }

        /* ── Utilities ── */
        .muted { color: var(--muted); }
        .text-center { text-align: center; }
        .mt-sm { margin-top: 8px; }
        .mt-md { margin-top: 16px; }
        .mt-lg { margin-top: 24px; }
        .gap-sm { gap: 8px; }
        .gap-md { gap: 16px; }
        .flex { display: flex; }
        .flex-wrap { flex-wrap: wrap; }
        .items-center { align-items: center; }
        .justify-between { justify-content: space-between; }

        /* ── Toast ── */
        .toast {
            position: fixed;
            bottom: 28px;
            right: 28px;
            background: var(--primary);
            color: white;
            padding: 14px 22px;
            border-radius: var(--radius-sm);
            font-weight: 600;
            font-size: 14px;
            z-index: 100;
            box-shadow: var(--shadow-xl);
            opacity: 0;
            transform: translateY(16px);
            transition: opacity 0.3s, transform 0.3s;
            pointer-events: none;
        }

        .toast.show {
            opacity: 1;
            transform: translateY(0);
        }

        /* ── Responsive ── */
        @media (max-width: 1200px) {
            .categories { grid-template-columns: repeat(3, 1fr); }
            .products { grid-template-columns: repeat(3, 1fr); }
        }

        @media (max-width: 900px) {
            nav.main-nav { display: none; }
            .mobile-toggle { display: inline-block; }
            .search { min-width: 180px; }
            .products { grid-template-columns: repeat(2, 1fr); }
            .categories { grid-template-columns: repeat(2, 1fr); }
            .deal { flex-direction: column; }
            .deal-img-wrap { width: 100%; height: 240px; }
            .hero h1 { font-size: 34px; }
        }

        @media (max-width: 600px) {
            .hero h1 { font-size: 26px; }
            .hero p { font-size: 15px; }
            .products { grid-template-columns: 1fr; }
            .categories { grid-template-columns: 1fr 1fr; }
            .section-title { font-size: 24px; }
            .search { display: none; }
            .header-actions .icon-btn.hide-mobile { display: none; }
            .deal .content { padding: 24px; }
            .deal h3 { font-size: 22px; }
            .newsletter { padding: 32px 18px; }
            .newsletter input { width: 100%; }
            .testimonial { min-width: 280px; }
            .hero { min-height: 360px; padding: 40px 16px; border-radius: 0 0 20px 20px; }
        }
    </style>

</head>

<body>
    <!-- Toast -->
    <div class="toast" id="toast"></div>

    <!-- Header -->
    <header>
        <div class="container header-inner" role="banner">
            <div style="display:flex;align-items:center;gap:18px;">
                <button class="mobile-toggle" id="mobileToggle" aria-label="Open menu"><i class="fas fa-bars"></i></button>
                <a class="brand" href="#">
                    <span>Nexus<span class="accent">Shop</span></span>
                </a>
            </div>

            <nav class="main-nav" id="mainNav" aria-label="Primary navigation">
                <ul>
                    <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="#" id="catMenuBtn"><i class="fas fa-th-large"></i> Categories <i class="fas fa-chevron-down" style="font-size:11px;"></i></a></li>
                    <li><a href="#"><i class="fas fa-fire"></i> Trending</a></li>
                    <li><a href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
                    <li><a href="#about"><i class="fas fa-info-circle"></i> About</a></li>
                </ul>
            </nav>

            <div style="display:flex;align-items:center;gap:12px;">
                <div class="search" role="search" aria-label="Product search">
                    <i class="fas fa-search" style="color:var(--muted-light);font-size:14px;"></i>
                    <input type="search" id="searchInput" placeholder="Search products..." aria-label="Search products" />
                </div>

                <div class="header-actions" role="group" aria-label="Header actions">
                    <a class="icon-btn hide-mobile" title="Account" href="#"><i class="far fa-user"></i></a>
                    <a class="icon-btn hide-mobile" title="Wishlist" href="#"><i class="far fa-heart"></i></a>
                    <a class="cart" href="#" id="cartBtn" title="View cart" aria-label="Cart">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="cart-count" id="cartCount">0</span>
                    </a>
                </div>
            </div>
        </div>

        <!-- Mobile menu -->
        <div id="mobileMenu" style="display:none; background:var(--card); border-top:1px solid var(--border);">
            <div class="container" style="padding:14px 0;">
                <nav aria-label="Mobile navigation">
                    <ul style="list-style:none;display:flex;flex-direction:column;gap:4px;">
                        <li><a href="#" style="display:block;padding:10px 8px;border-radius:var(--radius-sm);font-weight:500;">Home</a></li>
                        <li><a href="#" style="display:block;padding:10px 8px;border-radius:var(--radius-sm);font-weight:500;">Categories</a></li>
                        <li><a href="#" style="display:block;padding:10px 8px;border-radius:var(--radius-sm);font-weight:500;">Trending</a></li>
                        <li><a href="#deals" style="display:block;padding:10px 8px;border-radius:var(--radius-sm);font-weight:500;">Deals</a></li>
                        <li><a href="#about" style="display:block;padding:10px 8px;border-radius:var(--radius-sm);font-weight:500;">About</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <main>
        <!-- Hero -->
        <section class="hero" role="img" aria-label="Hero banner">
            <div class="container">
                <h1>New Winter Collection — Premium Picks</h1>
                <p>Discover the latest in fashion, tech & accessories — curated just for you. Limited-time deals & free shipping on selected items.</p>
                <div style="display:flex;gap:12px;justify-content:center;flex-wrap:wrap;">
                    <button class="btn btn-primary" id="shopNow">Shop Now <i class="fas fa-arrow-right"></i></button>
                    <button class="btn btn-ghost" id="exploreDeals">Explore Deals</button>
                </div>
            </div>
        </section>

        <!-- Categories -->
        <section class="section container" aria-labelledby="cat-title">
            <div class="title" id="cat-title">
                <h2 class="section-title">Shop by Category</h2>
                <p class="section-subtitle">Browse our curated range of products across popular categories.</p>
            </div>

            <div class="grid categories" id="categoriesGrid" aria-live="polite"></div>
        </section>

        <!-- Products -->
        <section class="section container" aria-labelledby="prod-title">
            <div class="title" id="prod-title">
                <h2 class="section-title">Trending Products</h2>
                <p class="section-subtitle">Popular picks based on what shoppers love right now.</p>
            </div>

            <div class="grid products" id="productsGrid" aria-live="polite"></div>
        </section>

        <!-- Deals -->
        <section id="deals" class="section container" aria-labelledby="deals-title">
            <div class="title" id="deals-title">
                <h2 class="section-title">Flash Sale</h2>
                <p class="section-subtitle">Limited-time offers — grab them before they're gone!</p>
            </div>

            <div class="deal">
                <div class="deal-img-wrap">
                    <img src="[images.unsplash.com](https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=1200&q=80)" alt="MacBook Air M2" />
                </div>
                <div class="content">
                    <h3>MacBook Air M2</h3>
                    <p class="muted">Thin, light and incredibly fast — now powered by the M2 chip.</p>

                    <div class="timer" aria-live="polite">
                        <div class="time-box">
                            <div id="dealDays">0</div>
                            <div class="label">Days</div>
                        </div>
                        <div class="time-box">
                            <div id="dealHours">00</div>
                            <div class="label">Hours</div>
                        </div>
                        <div class="time-box">
                            <div id="dealMinutes">00</div>
                            <div class="label">Minutes</div>
                        </div>
                        <div class="time-box">
                            <div id="dealSeconds">00</div>
                            <div class="label">Seconds</div>
                        </div>
                    </div>

                    <div style="display:flex;align-items:center;gap:14px;flex-wrap:wrap;">
                        <span class="price">$999 <span class="old-price">$1,199</span></span>
                        <span class="deal-discount">–17%</span>
                    </div>

                    <p class="mt-sm"><strong>12</strong> items left at this price!</p>
                    <div class="mt-lg">
                        <button class="btn btn-accent" id="buyDeal"><i class="fas fa-bolt"></i> Buy Now</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials -->
        <section class="section container" aria-labelledby="test-title">
            <div class="title" id="test-title">
                <h2 class="section-title">What Our Customers Say</h2>
                <p class="section-subtitle">Real reviews from verified buyers.</p>
            </div>

            <div class="testimonials" id="testimonials">
                <div class="testimonial">
                    <div class="rating" style="font-size:15px;">★★★★★</div>
                    <p style="margin:10px 0;">"Fast shipping and stellar support. The product exceeded all my expectations!"</p>
                    <div style="display:flex;align-items:center;gap:12px;margin-top:14px;">
                        <img class="avatar" src="[images.unsplash.com](https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80)" alt="Ava Martin" />
                        <div>
                            <div style="font-weight:700;">Ava Martin</div>
                            <div class="muted" style="font-size:12px;">Verified buyer</div>
                        </div>
                    </div>
                </div>

                <div class="testimonial">
                    <div class="rating" style="font-size:15px;">★★★★☆</div>
                    <p style="margin:10px 0;">"Great selection, smooth checkout. Definitely coming back for more."</p>
                    <div style="display:flex;align-items:center;gap:12px;margin-top:14px;">
                        <img class="avatar" src="[images.unsplash.com](https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80)" alt="Michael Lee" />
                        <div>
                            <div style="font-weight:700;">Michael Lee</div>
                            <div class="muted" style="font-size:12px;">Frequent buyer</div>
                        </div>
                    </div>
                </div>

                <div class="testimonial">
                    <div class="rating" style="font-size:15px;">★★★★★</div>
                    <p style="margin:10px 0;">"Impressive quality at this price point. Highly recommended!"</p>
                    <div style="display:flex;align-items:center;gap:12px;margin-top:14px;">
                        <img class="avatar" src="[images.unsplash.com](https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=80&q=80)" alt="Sarah Chen" />
                        <div>
                            <div style="font-weight:700;">Sarah Chen</div>
                            <div class="muted" style="font-size:12px;">Verified buyer</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Newsletter -->
        <section class="section container" aria-labelledby="news-title">
            <div class="newsletter" id="newsletter">
                <h3 id="news-title">Stay in the Loop</h3>
                <p>Subscribe for exclusive offers, new arrivals & insider deals.</p>
                <form class="newsletter-form" id="newsletterForm" onsubmit="return false;">
                    <input id="newsletterEmail" type="email" placeholder="Enter your email address" aria-label="Email address" required />
                    <button class="btn btn-primary" id="subscribeBtn" type="submit">Subscribe</button>
                </form>
                <div id="newsletterMsg" class="mt-md" style="font-size:14px;font-weight:600;display:none;"></div>
            </div>
        </section>
    </main>

    <footer>
        <div class="container" style="display:flex;flex-wrap:wrap;gap:32px;align-items:flex-start;justify-content:space-between;">
            <div style="max-width:340px;">
                <div class="footer-brand">Nexus<span style="color:var(--accent);">Shop</span></div>
                <p class="muted mt-sm">A modern e-commerce experience built with HTML, CSS & JavaScript. Clean, fast, and user-friendly.</p>
                <div class="mt-md flex gap-sm">
                    <a class="icon-btn" href="#" title="Facebook"><i class="fab fa-facebook"></i></a>
                    <a class="icon-btn" href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
                    <a class="icon-btn" href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
                </div>
            </div>

            <div class="flex" style="gap:48px;flex-wrap:wrap;">
                <div>
                    <div class="footer-heading">Company</div>
                    <div class="muted" style="line-height:2;">About<br />Careers<br />Press</div>
                </div>
                <div>
                    <div class="footer-heading">Support</div>
                    <div class="muted" style="line-height:2;">Help Center<br />Shipping & Returns<br />Contact Us</div>
                </div>
                <div>
                    <div class="footer-heading">Legal</div>
                    <div class="muted" style="line-height:2;">Privacy Policy<br />Terms of Service<br />Cookie Policy</div>
                </div>
            </div>
        </div>

        <div style="text-align:center;margin-top:28px;color:var(--muted-light);font-size:13px;">
            &copy; <span id="year"></span> NexusShop. All rights reserved.
        </div>
    </footer>

    <script>
        // ── Sample Data ──
        const CATEGORIES = [
            { id: 'phones',      name: 'Smartphones',  icon: 'fa-mobile-alt' },
            { id: 'laptops',     name: 'Laptops',      icon: 'fa-laptop' },
            { id: 'clothing',    name: 'Clothing',     icon: 'fa-tshirt' },
            { id: 'gadgets',     name: 'Gadgets',      icon: 'fa-headphones' },
            { id: 'footwear',    name: 'Footwear',     icon: 'fa-shoe-prints' },
            { id: 'accessories', name: 'Accessories',  icon: 'fa-watch' }
        ];

        const PRODUCTS = [
            { id: 1,  title: 'iPhone 14 Pro Max',     price: 1099, oldPrice: 1199, rating: 5, reviews: 128, badge: 'New',       img: '[images.unsplash.com](https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80)', category: 'phones' },
            { id: 2,  title: 'MacBook Pro 14"',        price: 1999,                           rating: 4, reviews: 86,                          img: '[images.unsplash.com](https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80)', category: 'laptops' },
            { id: 3,  title: 'Apple Watch Series 8',    price: 349,  oldPrice: 399,  rating: 5, reviews: 214, badge: '–25%',      img: '[images.unsplash.com](https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80)', category: 'accessories' },
            { id: 4,  title: 'Nike Air Max 270',        price: 150,                           rating: 4, reviews: 53,                          img: '[images.unsplash.com](https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80)', category: 'footwear' },
            { id: 5,  title: 'Sony A7 IV Camera',       price: 2499,                          rating: 5, reviews: 42,                          img: '[images.unsplash.com](https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80)', category: 'gadgets' },
            { id: 6,  title: 'Chanel No. 5',            price: 120,                           rating: 5, reviews: 189,                         img: '[images.unsplash.com](https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80)', category: 'accessories' },
            { id: 7,  title: 'Travel Backpack',         price: 79,   oldPrice: 99,   rating: 4, reviews: 67,                          img: '[images.unsplash.com](https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80)', category: 'accessories' },
            { id: 8,  title: 'Sony WH-1000XM5',         price: 399,                           rating: 5, reviews: 156,                         img: '[images.unsplash.com](https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80)', category: 'gadgets' }
        ];

        // ── DOM refs ──
        const categoriesGrid  = document.getElementById('categoriesGrid');
        const productsGrid    = document.getElementById('productsGrid');
        const cartCountEl     = document.getElementById('cartCount');
        const searchInput     = document.getElementById('searchInput');
        const toast           = document.getElementById('toast');

        let cartCount = 0;

        // ── Toast helper ──
        function showToast(message) {
            toast.textContent = message;
            toast.classList.add('show');
            clearTimeout(toast._timeout);
            toast._timeout = setTimeout(() => toast.classList.remove('show'), 2000);
        }

        // ── Render categories ──
        function renderCategories() {
            categoriesGrid.innerHTML = '';
            CATEGORIES.forEach(cat => {
                const el = document.createElement('div');
                el.className = 'cat-card';
                el.innerHTML = `
                    <div class="icon"><i class="fas ${cat.icon}"></i></div>
                    <h4>${cat.name}</h4>
                    <div class="cat-subtitle muted" style="font-size:13px;margin-top:4px;">Explore ${cat.name}</div>
                `;
                el.addEventListener('click', () => {
                    searchInput.value = cat.name;
                    filterProducts(cat.name);
                    document.getElementById('prod-title').scrollIntoView({ behavior: 'smooth', block: 'start' });
                });
                categoriesGrid.appendChild(el);
            });
        }

        // ── Render products ──
        function renderProducts(list) {
            productsGrid.innerHTML = '';
            list.forEach(p => {
                const isSale = p.badge && p.badge.startsWith('–');
                const badgeClass = isSale ? 'badge-sale' : 'badge-new';
                const el = document.createElement('article');
                el.className = 'product';
                el.innerHTML = `
                    <div class="product-img-wrap">
                        ${p.badge ? `<span class="product-badge ${badgeClass}">${escapeHtml(p.badge)}</span>` : ''}
                        <img src="${p.img}" alt="${escapeHtml(p.title)}" loading="lazy" />
                    </div>
                    <div class="product-body">
                        <div class="product-category">${escapeHtml(p.category)}</div>
                        <h5>${escapeHtml(p.title)}</h5>
                        <div class="price-row">
                            <div>
                                <span class="price">$${p.price.toLocaleString()}</span>
                                ${p.oldPrice ? `<span class="old-price">$${p.oldPrice.toLocaleString()}</span>` : ''}
                            </div>
                            <div class="rating">
                                ${'★'.repeat(Math.round(p.rating))}
                                <span class="rating-count">(${p.reviews})</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-footer">
                        <button class="add-btn" data-id="${p.id}"><i class="fas fa-cart-plus"></i> Add to Cart</button>
                        <button class="wish-btn" aria-label="Add to wishlist"><i class="far fa-heart"></i></button>
                    </div>
                `;
                productsGrid.appendChild(el);
            });

            // Attach add-to-cart listeners
            productsGrid.querySelectorAll('.add-btn').forEach(btn => {
                btn.addEventListener('click', () => {
                    const id = Number(btn.dataset.id);
                    addToCart(id, btn);
                });
            });

            // Attach wishlist listeners
            productsGrid.querySelectorAll('.wish-btn').forEach(btn => {
                btn.addEventListener('click', () => {
                    btn.querySelector('i').classList.toggle('far');
                    btn.querySelector('i').classList.toggle('fas');
                    const isFav = btn.querySelector('i').classList.contains('fas');
                    btn.style.color = isFav ? 'var(--danger)' : '';
                    btn.style.borderColor = isFav ? 'var(--danger)' : '';
                    btn.style.background = isFav ? '#fef2f2' : '';
                    showToast(isFav ? 'Added to wishlist ♥' : 'Removed from wishlist');
                });
            });
        }

        // ── Utilities ──
        function escapeHtml(text) {
            const map = { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' };
            return String(text).replace(/[&<>"']/g, s => map[s]);
        }

        function addToCart(productId, btn) {
            const p = PRODUCTS.find(x => x.id === productId);
            if (!p) return;
            cartCount++;
            cartCountEl.textContent = cartCount;

            // Animate count badge
            cartCountEl.style.transform = 'scale(1.4)';
            setTimeout(() => { cartCountEl.style.transform = 'scale(1)'; }, 200);

            // Button feedback
            if (btn) {
                const original = btn.innerHTML;
                btn.innerHTML = '<i class="fas fa-check"></i> Added';
                btn.style.background = 'var(--success)';
                btn.disabled = true;
                setTimeout(() => {
                    btn.innerHTML = original;
                    btn.style.background = '';
                    btn.disabled = false;
                }, 1500);
            }

            showToast(`${p.title} added to cart!`);
        }

        function filterProducts(query) {
            const q = String(query || '').trim().toLowerCase();
            if (!q) {
                renderProducts(PRODUCTS);
                return;
            }
            const filtered = PRODUCTS.filter(p =>
                p.title.toLowerCase().includes(q) ||
                p.category.toLowerCase().includes(q)
            );
            renderProducts(filtered.length ? filtered : PRODUCTS);

            if (!filtered.length) {
                showToast('No products found — showing all');
            }
        }

        // ── Search ──
        searchInput.addEventListener('input', () => filterProducts(searchInput.value));
        searchInput.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') filterProducts(e.target.value);
        });

        // ── Mobile menu ──
        const mobileToggle = document.getElementById('mobileToggle');
        const mobileMenu   = document.getElementById('mobileMenu');
        mobileToggle.addEventListener('click', () => {
            const isHidden = mobileMenu.style.display === 'none' || !mobileMenu.style.display;
            mobileMenu.style.display = isHidden ? 'block' : 'none';
        });

        // ── Category dropdown (desktop) ──
        document.getElementById('catMenuBtn')?.addEventListener('click', (e) => {
            e.preventDefault();
            document.getElementById('cat-title').scrollIntoView({ behavior: 'smooth' });
        });

        // ── Newsletter ──
        document.getElementById('newsletterForm').addEventListener('submit', (e) => {
            e.preventDefault();
            const email = document.getElementById('newsletterEmail').value.trim();
            const msg   = document.getElementById('newsletterMsg');
            if (!email || !email.includes('@')) {
                msg.style.display = 'block';
                msg.textContent  = 'Please enter a valid email address.';
                msg.style.color  = '#fecaca';
                return;
            }
            msg.style.display = 'block';
            msg.style.color   = '#bbf7d0';
            msg.textContent   = '🎉 Thanks! You\'re subscribed.';
            document.getElementById('newsletterEmail').value = '';
            setTimeout(() => { msg.style.display = 'none'; }, 3500);
        });

        // ── Deal countdown timer ──
        (function setupDealTimer() {
            const now    = new Date();
            const target = new Date(now.getTime() + (24 * 60 + 36) * 60 * 1000);
            function tick() {
                const diff  = target - new Date();
                if (diff <= 0) return;
                const days  = Math.floor(diff / (24 * 3600 * 1000));
                const hours = Math.floor((diff % (24 * 3600 * 1000)) / (3600 * 1000));
                const mins  = Math.floor((diff % (3600 * 1000)) / (60 * 1000));
                const secs  = Math.floor((diff % (60 * 1000)) / 1000);
                document.getElementById('dealDays').textContent    = days;
                document.getElementById('dealHours').textContent   = String(hours).padStart(2, '0');
                document.getElementById('dealMinutes').textContent = String(mins).padStart(2, '0');
                document.getElementById('dealSeconds').textContent = String(secs).padStart(2, '0');
            }
            tick();
            setInterval(tick, 1000);
        })();

        // ── UI bindings ──
        document.getElementById('shopNow').addEventListener('click', () => {
            document.getElementById('prod-title').scrollIntoView({ behavior: 'smooth', block: 'start' });
        });
        document.getElementById('exploreDeals').addEventListener('click', () => {
            document.getElementById('deals').scrollIntoView({ behavior: 'smooth' });
        });
        document.getElementById('buyDeal').addEventListener('click', () => {
            cartCount++;
            cartCountEl.textContent = cartCount;
            cartCountEl.style.transform = 'scale(1.4)';
            setTimeout(() => { cartCountEl.style.transform = 'scale(1)'; }, 200);
            showToast('MacBook Air M2 added to cart!');
        });

        // ── Init ──
        (function init() {
            renderCategories();
            renderProducts(PRODUCTS);
            cartCountEl.textContent = cartCount;
            document.getElementById('year').textContent = new Date().getFullYear();
        })();
    </script>
</body>
</html>
