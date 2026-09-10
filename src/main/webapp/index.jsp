
import React, { useEffect, useMemo, useState } from "react";
import {
  ArrowRight,
  BadgeCheck,
  Check,
  ChevronDown,
  ChevronRight,
  Clock3,
  Filter,
  Headphones,
  Heart,
  Laptop,
  Menu,
  Minus,
  MonitorSmartphone,
  Moon,
  PackageCheck,
  Search,
  ShieldCheck,
  Shirt,
  ShoppingBag,
  ShoppingCart,
  Smartphone,
  Sparkles,
  Star,
  Sun,
  Tag,
  Trash2,
  Truck,
  Watch,
  X,
  Zap,
} from "lucide-react";

const PRODUCTS = [
  {
    id: 1,
    title: "iPhone 14 Pro Max",
    category: "Smartphones",
    price: 1099,
    oldPrice: 1199,
    rating: 4.9,
    reviews: 128,
    badge: "New",
    image: "https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=900&q=85",
    colors: ["#1f2937", "#e4d5c7", "#d9dce1"],
  },
  {
    id: 2,
    title: 'MacBook Pro 14"',
    category: "Laptops",
    price: 1999,
    rating: 4.8,
    reviews: 86,
    badge: "Popular",
    image: "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=900&q=85",
    colors: ["#9ca3af", "#1f2937"],
  },
  {
    id: 3,
    title: "Apple Watch Series 8",
    category: "Accessories",
    price: 349,
    oldPrice: 399,
    rating: 4.9,
    reviews: 214,
    badge: "Sale",
    image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=900&q=85",
    colors: ["#111827", "#f3c6b7", "#cbd5e1"],
  },
  {
    id: 4,
    title: "Nike Air Max 270",
    category: "Footwear",
    price: 150,
    rating: 4.7,
    reviews: 56,
    image: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=900&q=85",
    colors: ["#ef4444", "#111827", "#f8fafc"],
  },
  {
    id: 5,
    title: "Sony A7 IV Camera",
    category: "Gadgets",
    price: 2499,
    rating: 4.9,
    reviews: 42,
    badge: "New",
    image: "https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=900&q=85",
    colors: ["#111827"],
  },
  {
    id: 6,
    title: "Maison Eau de Parfum",
    category: "Accessories",
    price: 120,
    rating: 4.8,
    reviews: 189,
    image: "https://images.unsplash.com/photo-1541643600914-78b084683601?auto=format&fit=crop&w=900&q=85",
    colors: ["#e7c58c", "#f8fafc"],
  },
  {
    id: 7,
    title: "Everyday Travel Backpack",
    category: "Accessories",
    price: 79,
    oldPrice: 99,
    rating: 4.6,
    reviews: 67,
    badge: "Sale",
    image: "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=900&q=85",
    colors: ["#334155", "#8b6f47", "#111827"],
  },
  {
    id: 8,
    title: "Sony WH-1000XM5",
    category: "Gadgets",
    price: 399,
    rating: 4.9,
    reviews: 156,
    badge: "Popular",
    image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=900&q=85",
    colors: ["#111827", "#e7e5e4"],
  },
];

const CATEGORIES = [
  { name: "Smartphones", count: 24, icon: Smartphone, tone: "bg-violet-100 text-violet-700" },
  { name: "Laptops", count: 18, icon: Laptop, tone: "bg-blue-100 text-blue-700" },
  { name: "Clothing", count: 42, icon: Shirt, tone: "bg-rose-100 text-rose-700" },
  { name: "Gadgets", count: 31, icon: Headphones, tone: "bg-amber-100 text-amber-700" },
  { name: "Footwear", count: 27, icon: Sparkles, tone: "bg-emerald-100 text-emerald-700" },
  { name: "Accessories", count: 39, icon: Watch, tone: "bg-cyan-100 text-cyan-700" },
];

const TESTIMONIALS = [
  { name: "Ava Martin", role: "Verified buyer", text: "Beautifully packed, delivered early, and exactly as described. The whole experience felt effortless.", image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=160&q=80" },
  { name: "Michael Lee", role: "Frequent shopper", text: "Finding the right product took seconds. Clear pricing and a smooth cart make NexusShop a pleasure to use.", image: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=160&q=80" },
  { name: "Sophia Chen", role: "Design professional", text: "The quality is excellent and the storefront feels polished without being distracting. I will shop here again.", image: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=160&q=80" },
];

const money = new Intl.NumberFormat("en-US", { style: "currency", currency: "USD", maximumFractionDigits: 0 });

export default function NexusShop() {
  const [dark, setDark] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [cartOpen, setCartOpen] = useState(false);
  const [filtersOpen, setFiltersOpen] = useState(false);
  const [query, setQuery] = useState("");
  const [category, setCategory] = useState("All");
  const [sort, setSort] = useState("featured");
  const [wishlist, setWishlist] = useState([]);
  const [cart, setCart] = useState([]);
  const [toast, setToast] = useState("");
  const [email, setEmail] = useState("");
  const [newsletterMessage, setNewsletterMessage] = useState("");
  const [timeLeft, setTimeLeft] = useState({ hours: 23, minutes: 59, seconds: 59 });

  useEffect(() => {
    const timer = window.setInterval(() => {
      setTimeLeft((value) => {
        let total = value.hours * 3600 + value.minutes * 60 + value.seconds - 1;
        if (total < 0) total = 24 * 3600 - 1;
        return {
          hours: Math.floor(total / 3600),
          minutes: Math.floor((total % 3600) / 60),
          seconds: total % 60,
        };
      });
    }, 1000);
    return () => window.clearInterval(timer);
  }, []);

  useEffect(() => {
    if (!toast) return;
    const timer = window.setTimeout(() => setToast(""), 2200);
    return () => window.clearTimeout(timer);
  }, [toast]);

  const shownProducts = useMemo(() => {
    const term = query.trim().toLowerCase();
    const list = PRODUCTS.filter((product) => {
      const matchesSearch = !term || product.title.toLowerCase().includes(term) || product.category.toLowerCase().includes(term);
      const matchesCategory = category === "All" || product.category === category;
      return matchesSearch && matchesCategory;
    });

    return [...list].sort((a, b) => {
      if (sort === "price-low") return a.price - b.price;
      if (sort === "price-high") return b.price - a.price;
      if (sort === "rating") return b.rating - a.rating;
      return (b.reviews + b.rating * 20) - (a.reviews + a.rating * 20);
    });
  }, [query, category, sort]);

  const cartItems = cart.map((entry) => ({ ...PRODUCTS.find((product) => product.id === entry.id), quantity: entry.quantity }));
  const cartQuantity = cart.reduce((sum, item) => sum + item.quantity, 0);
  const subtotal = cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);

  function addToCart(id) {
    setCart((current) => {
      const existing = current.find((item) => item.id === id);
      return existing
        ? current.map((item) => item.id === id ? { ...item, quantity: item.quantity + 1 } : item)
        : [...current, { id, quantity: 1 }];
    });
    setToast("Added to your bag");
  }

  function updateQuantity(id, delta) {
    setCart((current) => current
      .map((item) => item.id === id ? { ...item, quantity: item.quantity + delta } : item)
      .filter((item) => item.quantity > 0));
  }

  function toggleWishlist(id) {
    setWishlist((current) => current.includes(id) ? current.filter((item) => item !== id) : [...current, id]);
  }

  function chooseCategory(name) {
    setCategory(name);
    document.getElementById("products")?.scrollIntoView({ behavior: "smooth" });
  }

  function subscribe(event) {
    event.preventDefault();
    const valid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    setNewsletterMessage(valid ? "You are on the list. Welcome to NexusShop!" : "Please enter a valid email address.");
    if (valid) setEmail("");
  }

  return (
    <div className={dark ? "dark" : ""}>
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Manrope:wght@500;600;700;800&display=swap');
        html { scroll-behavior: smooth; }
        body { margin: 0; }
        * { box-sizing: border-box; }
        .font-body { font-family: 'DM Sans', sans-serif; }
        .font-display { font-family: 'Manrope', sans-serif; }
        .no-scrollbar::-webkit-scrollbar { display: none; }
        .no-scrollbar { scrollbar-width: none; }
        @keyframes enter { from { opacity: 0; transform: translateY(8px) scale(.98); } to { opacity: 1; transform: none; } }
        .animate-enter { animation: enter .3s ease-out both; }
      `}</style>

      <div className="font-body min-h-screen bg-[#f8f8f6] text-slate-950 transition-colors dark:bg-slate-950 dark:text-white">
        <div className="bg-slate-950 px-4 py-2.5 text-center text-xs font-medium tracking-wide text-white dark:bg-violet-500">
          Free shipping over $75 <span className="mx-2 text-white/40">•</span> Easy 30-day returns
        </div>

        <header className="sticky top-0 z-40 border-b border-slate-200/70 bg-[#f8f8f6]/90 backdrop-blur-xl dark:border-white/10 dark:bg-slate-950/85">
          <div className="mx-auto flex h-20 max-w-7xl items-center gap-4 px-4 sm:px-6 lg:px-8">
            <button onClick={() => setMobileOpen(true)} className="rounded-full p-2.5 hover:bg-slate-200 lg:hidden dark:hover:bg-white/10" aria-label="Open navigation">
              <Menu className="h-5 w-5" />
            </button>

            <a href="#top" className="font-display flex shrink-0 items-center gap-2 text-xl font-extrabold tracking-tight" aria-label="NexusShop home">
              <span className="grid h-9 w-9 place-items-center rounded-xl bg-violet-600 text-white"><ShoppingBag className="h-5 w-5" /></span>
              <span>Nexus<span className="text-violet-600 dark:text-violet-400">Shop</span></span>
            </a>

            <nav className="ml-6 hidden items-center gap-1 lg:flex" aria-label="Main navigation">
              {["New", "Categories", "Trending", "Deals"].map((item) => (
                <a key={item} href={item === "Deals" ? "#deal" : item === "Categories" ? "#categories" : "#products"} className="rounded-xl px-3.5 py-2 text-sm font-semibold text-slate-600 hover:bg-white hover:text-slate-950 dark:text-slate-300 dark:hover:bg-white/10 dark:hover:text-white">{item}</a>
              ))}
            </nav>

            <label className="relative ml-auto hidden max-w-md flex-1 md:block">
              <span className="sr-only">Search products</span>
              <Search className="absolute left-4 top-1/2 h-4 w-4 -translate-y-1/2 text-slate-400" />
              <input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Search products and categories" className="w-full rounded-2xl border border-slate-200 bg-white py-3 pl-11 pr-4 text-sm outline-none transition focus:border-violet-400 focus:ring-4 focus:ring-violet-100 dark:border-white/10 dark:bg-white/5 dark:focus:ring-violet-500/20" />
            </label>

            <div className="ml-auto flex items-center gap-1 md:ml-0">
              <button onClick={() => setDark(!dark)} className="grid h-10 w-10 place-items-center rounded-full hover:bg-slate-200 dark:hover:bg-white/10" aria-label="Toggle color theme">
                {dark ? <Sun className="h-5 w-5" /> : <Moon className="h-5 w-5" />}
              </button>
              <button onClick={() => { setCategory("All"); setQuery(""); document.getElementById("products")?.scrollIntoView({ behavior: "smooth" }); }} className="relative grid h-10 w-10 place-items-center rounded-full hover:bg-slate-200 dark:hover:bg-white/10" aria-label="View wishlist">
                <Heart className="h-5 w-5" />
                {wishlist.length > 0 && <span className="absolute right-0 top-0 grid h-4 min-w-4 place-items-center rounded-full bg-rose-500 px-1 text-[10px] font-bold text-white">{wishlist.length}</span>}
              </button>
              <button onClick={() => setCartOpen(true)} className="relative grid h-10 w-10 place-items-center rounded-full bg-slate-950 text-white dark:bg-violet-500" aria-label={`Open shopping bag with ${cartQuantity} items`}>
                <ShoppingCart className="h-5 w-5" />
                {cartQuantity > 0 && <span className="absolute -right-1 -top-1 grid h-5 min-w-5 place-items-center rounded-full bg-violet-500 px-1 text-[10px] font-bold text-white ring-2 ring-[#f8f8f6] dark:bg-rose-500 dark:ring-slate-950">{cartQuantity}</span>}
              </button>
            </div>
          </div>

          <div className="px-4 pb-4 md:hidden">
            <label className="relative block">
              <Search className="absolute left-4 top-1/2 h-4 w-4 -translate-y-1/2 text-slate-400" />
              <input value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Search products" className="w-full rounded-2xl border border-slate-200 bg-white py-3 pl-11 pr-4 text-sm outline-none focus:border-violet-400 dark:border-white/10 dark:bg-white/5" />
            </label>
          </div>
        </header>

        <main id="top">
          <section className="mx-auto max-w-[1440px] px-4 pt-4 sm:px-6 lg:px-8">
            <div className="relative min-h-[560px] overflow-hidden rounded-[2rem] bg-slate-950 sm:min-h-[620px]">
              <img src="https://images.unsplash.com/photo-1441986300917-64674bd600d8?auto=format&fit=crop&w=1800&q=90" alt="Contemporary retail collection" className="absolute inset-0 h-full w-full object-cover opacity-60" />
              <div className="absolute inset-0 bg-gradient-to-r from-slate-950 via-slate-950/75 to-transparent" />
              <div className="relative flex min-h-[560px] max-w-3xl flex-col justify-center px-7 py-20 text-white sm:min-h-[620px] sm:px-14 lg:px-20">
                <span className="mb-5 inline-flex w-fit items-center gap-2 rounded-full border border-white/20 bg-white/10 px-4 py-2 text-xs font-bold uppercase tracking-[.18em] backdrop-blur"><Sparkles className="h-4 w-4 text-violet-300" /> New season edit</span>
                <h1 className="font-display text-5xl font-extrabold leading-[1.02] tracking-[-.05em] sm:text-7xl">Better essentials.<br/><span className="text-violet-300">Made to delight.</span></h1>
                <p className="mt-6 max-w-xl text-base leading-7 text-white/75 sm:text-lg">Thoughtful fashion, smart technology, and everyday objects selected for quality, comfort, and lasting value.</p>
                <div className="mt-9 flex flex-wrap gap-3">
                  <a href="#products" className="inline-flex items-center gap-2 rounded-full bg-white px-6 py-3.5 text-sm font-bold text-slate-950 transition hover:-translate-y-0.5 hover:bg-violet-100">Shop the collection <ArrowRight className="h-4 w-4" /></a>
                  <a href="#deal" className="inline-flex items-center gap-2 rounded-full border border-white/25 bg-white/10 px-6 py-3.5 text-sm font-bold text-white backdrop-blur transition hover:bg-white/20"><Zap className="h-4 w-4" /> View today’s deal</a>
                </div>
                <div className="mt-12 flex flex-wrap gap-x-6 gap-y-3 text-sm text-white/75">
                  <span className="flex items-center gap-2"><Truck className="h-4 w-4" /> Fast delivery</span>
                  <span className="flex items-center gap-2"><ShieldCheck className="h-4 w-4" /> Secure checkout</span>
                  <span className="flex items-center gap-2"><PackageCheck className="h-4 w-4" /> Easy returns</span>
                </div>
              </div>
            </div>
          </section>

          <section id="categories" className="mx-auto max-w-7xl px-4 py-20 sm:px-6 lg:px-8">
            <div className="mb-9 flex items-end justify-between gap-4">
              <div>
                <p className="mb-2 text-xs font-bold uppercase tracking-[.2em] text-violet-600 dark:text-violet-400">Explore</p>
                <h2 className="font-display text-3xl font-extrabold tracking-tight sm:text-4xl">Shop by category</h2>
              </div>
              <button onClick={() => chooseCategory("All")} className="hidden items-center gap-1 text-sm font-bold text-violet-600 sm:flex dark:text-violet-400">View all <ChevronRight className="h-4 w-4" /></button>
            </div>
            <div className="no-scrollbar flex snap-x gap-4 overflow-x-auto pb-3 lg:grid lg:grid-cols-6 lg:overflow-visible">
              {CATEGORIES.map(({ name, count, icon: Icon, tone }) => (
                <button key={name} onClick={() => chooseCategory(name)} className="group min-w-[150px] snap-start rounded-3xl border border-slate-200 bg-white p-5 text-left shadow-sm transition hover:-translate-y-1 hover:border-violet-300 hover:shadow-xl hover:shadow-violet-100/50 dark:border-white/10 dark:bg-white/5 dark:hover:border-violet-500/60 dark:hover:shadow-none">
                  <span className={`mb-5 grid h-12 w-12 place-items-center rounded-2xl ${tone}`}><Icon className="h-5 w-5" /></span>
                  <strong className="block text-sm">{name}</strong>
                  <span className="mt-1 block text-xs text-slate-500 dark:text-slate-400">{count} products</span>
                </button>
              ))}
            </div>
          </section>

          <section id="products" className="border-y border-slate-200 bg-white/70 py-20 dark:border-white/10 dark:bg-white/[.025]">
            <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
              <div className="mb-8 flex flex-col gap-5 lg:flex-row lg:items-end lg:justify-between">
                <div>
                  <p className="mb-2 text-xs font-bold uppercase tracking-[.2em] text-violet-600 dark:text-violet-400">Curated for you</p>
                  <h2 className="font-display text-3xl font-extrabold tracking-tight sm:text-4xl">Trending now</h2>
                  <p className="mt-2 text-sm text-slate-500 dark:text-slate-400">{shownProducts.length} products matching your selection</p>
                </div>
                <div className="flex flex-wrap items-center gap-3">
                  <button onClick={() => setFiltersOpen(!filtersOpen)} className="inline-flex items-center gap-2 rounded-xl border border-slate-200 bg-white px-4 py-3 text-sm font-bold lg:hidden dark:border-white/10 dark:bg-white/5"><Filter className="h-4 w-4" /> Filters</button>
                  <label className="relative">
                    <span className="sr-only">Sort products</span>
                    <select value={sort} onChange={(event) => setSort(event.target.value)} className="appearance-none rounded-xl border border-slate-200 bg-white py-3 pl-4 pr-10 text-sm font-semibold outline-none dark:border-white/10 dark:bg-slate-900">
                      <option value="featured">Featured</option>
                      <option value="rating">Highest rated</option>
                      <option value="price-low">Price: low to high</option>
                      <option value="price-high">Price: high to low</option>
                    </select>
                    <ChevronDown className="pointer-events-none absolute right-3 top-1/2 h-4 w-4 -translate-y-1/2" />
                  </label>
                </div>
              </div>

              <div className={`${filtersOpen ? "flex" : "hidden"} mb-7 flex-wrap gap-2 lg:flex`}>
                {["All", ...CATEGORIES.map((item) => item.name)].map((name) => (
                  <button key={name} onClick={() => setCategory(name)} className={`rounded-full px-4 py-2 text-sm font-bold transition ${category === name ? "bg-slate-950 text-white dark:bg-violet-500" : "bg-slate-100 text-slate-600 hover:bg-slate-200 dark:bg-white/5 dark:text-slate-300 dark:hover:bg-white/10"}`}>{name}</button>
                ))}
              </div>

              {shownProducts.length ? (
                <div className="grid grid-cols-2 gap-3 sm:gap-5 lg:grid-cols-4">
                  {shownProducts.map((product) => {
                    const liked = wishlist.includes(product.id);
                    return (
                      <article key={product.id} className="group overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-sm transition hover:-translate-y-1 hover:shadow-2xl hover:shadow-slate-200/60 dark:border-white/10 dark:bg-white/5 dark:hover:shadow-none">
                        <div className="relative aspect-[4/4.5] overflow-hidden bg-slate-100">
                          <img src={product.image} alt={product.title} loading="lazy" className="h-full w-full object-cover transition duration-500 group-hover:scale-105" />
                          {product.badge && <span className={`absolute left-3 top-3 rounded-full px-3 py-1.5 text-[10px] font-extrabold uppercase tracking-wider ${product.badge === "Sale" ? "bg-rose-500 text-white" : "bg-white text-slate-950"}`}>{product.badge}</span>}
                          <button onClick={() => toggleWishlist(product.id)} className={`absolute right-3 top-3 grid h-9 w-9 place-items-center rounded-full backdrop-blur transition ${liked ? "bg-rose-500 text-white" : "bg-white/90 text-slate-700 hover:text-rose-500"}`} aria-label={liked ? `Remove ${product.title} from wishlist` : `Add ${product.title} to wishlist`}>
                            <Heart className={`h-4 w-4 ${liked ? "fill-current" : ""}`} />
                          </button>
                          <button onClick={() => addToCart(product.id)} className="absolute bottom-3 left-3 right-3 hidden items-center justify-center gap-2 rounded-2xl bg-slate-950 py-3 text-sm font-bold text-white shadow-lg transition hover:bg-violet-600 sm:flex sm:translate-y-14 sm:group-hover:translate-y-0"><ShoppingBag className="h-4 w-4" /> Add to bag</button>
                        </div>
                        <div className="p-3.5 sm:p-5">
                          <p className="text-[10px] font-bold uppercase tracking-[.16em] text-violet-600 dark:text-violet-400">{product.category}</p>
                          <h3 className="mt-2 min-h-10 text-sm font-bold leading-5 sm:text-base">{product.title}</h3>
                          <div className="mt-2 flex items-center gap-1 text-xs text-slate-500 dark:text-slate-400"><Star className="h-3.5 w-3.5 fill-amber-400 text-amber-400" /><strong className="text-slate-800 dark:text-white">{product.rating}</strong> ({product.reviews})</div>
                          <div className="mt-3 flex flex-wrap items-baseline gap-2"><span className="font-display text-base font-extrabold sm:text-lg">{money.format(product.price)}</span>{product.oldPrice && <span className="text-xs text-slate-400 line-through sm:text-sm">{money.format(product.oldPrice)}</span>}</div>
                          <div className="mt-3 flex gap-1.5">{product.colors.map((color) => <span key={color} className="h-3 w-3 rounded-full ring-1 ring-black/10" style={{ backgroundColor: color }} />)}</div>
                          <button onClick={() => addToCart(product.id)} className="mt-4 flex w-full items-center justify-center gap-2 rounded-xl bg-slate-950 py-2.5 text-xs font-bold text-white sm:hidden dark:bg-violet-500"><ShoppingBag className="h-4 w-4" /> Add</button>
                        </div>
                      </article>
                    );
                  })}
                </div>
              ) : (
                <div className="rounded-3xl border border-dashed border-slate-300 px-6 py-20 text-center dark:border-white/20">
                  <Search className="mx-auto h-9 w-9 text-slate-400" />
                  <h3 className="font-display mt-4 text-xl font-bold">No matching products</h3>
                  <p className="mt-2 text-sm text-slate-500">Try another search or clear your filters.</p>
                  <button onClick={() => { setQuery(""); setCategory("All"); }} className="mt-5 rounded-full bg-slate-950 px-5 py-2.5 text-sm font-bold text-white dark:bg-violet-500">Clear filters</button>
                </div>
              )}
            </div>
          </section>

          <section id="deal" className="mx-auto max-w-7xl px-4 py-20 sm:px-6 lg:px-8">
            <div className="grid overflow-hidden rounded-[2rem] bg-[#dcd8ff] text-slate-950 lg:grid-cols-2">
              <div className="min-h-[380px] overflow-hidden lg:min-h-[520px]"><img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=1100&q=90" alt="Laptop on a desk" className="h-full w-full object-cover" /></div>
              <div className="flex flex-col justify-center p-7 sm:p-12 lg:p-16">
                <span className="mb-5 inline-flex w-fit items-center gap-2 rounded-full bg-rose-500 px-3.5 py-2 text-xs font-extrabold uppercase tracking-wider text-white"><Zap className="h-4 w-4" /> Today only</span>
                <h2 className="font-display text-4xl font-extrabold tracking-[-.04em] sm:text-5xl">Power meets portability.</h2>
                <p className="mt-5 max-w-md leading-7 text-slate-700">MacBook Air M2 with a bright display, remarkable battery life, and an ultra-light design for work anywhere.</p>
                <div className="mt-5 flex items-end gap-3"><span className="font-display text-4xl font-extrabold">$999</span><span className="pb-1 text-lg text-slate-500 line-through">$1,199</span></div>
                <div className="mt-7 flex gap-2" aria-label="Deal countdown">
                  {[[timeLeft.hours, "Hours"], [timeLeft.minutes, "Mins"], [timeLeft.seconds, "Secs"]].map(([number, label]) => (
                    <div key={label} className="min-w-[70px] rounded-2xl bg-white/70 p-3 text-center"><strong className="font-display block text-2xl">{String(number).padStart(2, "0")}</strong><span className="text-[10px] font-bold uppercase tracking-wider text-slate-500">{label}</span></div>
                  ))}
                </div>
                <button onClick={() => addToCart(2)} className="mt-8 inline-flex w-fit items-center gap-2 rounded-full bg-slate-950 px-6 py-3.5 text-sm font-bold text-white hover:bg-violet-700"><ShoppingCart className="h-4 w-4" /> Add deal to bag</button>
              </div>
            </div>
          </section>

          <section className="bg-slate-950 py-20 text-white">
            <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
              <div className="mb-10 text-center"><p className="text-xs font-bold uppercase tracking-[.2em] text-violet-300">Loved by shoppers</p><h2 className="font-display mt-3 text-3xl font-extrabold sm:text-4xl">Shopping that feels simple</h2></div>
              <div className="grid gap-4 md:grid-cols-3">
                {TESTIMONIALS.map((item) => (
                  <figure key={item.name} className="rounded-3xl border border-white/10 bg-white/5 p-6 sm:p-8">
                    <div className="flex gap-1 text-amber-400">{[1,2,3,4,5].map((n) => <Star key={n} className="h-4 w-4 fill-current" />)}</div>
                    <blockquote className="mt-5 text-base leading-7 text-white/80">“{item.text}”</blockquote>
                    <figcaption className="mt-7 flex items-center gap-3"><img src={item.image} alt="" className="h-11 w-11 rounded-full object-cover" /><div><strong className="block text-sm">{item.name}</strong><span className="flex items-center gap-1 text-xs text-white/50"><BadgeCheck className="h-3.5 w-3.5 text-violet-300" /> {item.role}</span></div></figcaption>
                  </figure>
                ))}
              </div>
            </div>
          </section>

          <section className="mx-auto max-w-7xl px-4 py-20 sm:px-6 lg:px-8">
            <div className="grid gap-8 rounded-[2rem] border border-slate-200 bg-white p-7 shadow-xl shadow-slate-200/40 sm:p-12 lg:grid-cols-[1fr_.9fr] lg:items-center dark:border-white/10 dark:bg-white/5 dark:shadow-none">
              <div><p className="text-xs font-bold uppercase tracking-[.2em] text-violet-600 dark:text-violet-400">Members get more</p><h2 className="font-display mt-3 text-3xl font-extrabold tracking-tight sm:text-4xl">Good things, straight to your inbox.</h2><p className="mt-3 max-w-xl text-slate-500 dark:text-slate-400">Early access, useful product guides, and offers worth opening. No clutter.</p></div>
              <form onSubmit={subscribe} className="space-y-3">
                <div className="flex flex-col gap-3 sm:flex-row"><label className="sr-only" htmlFor="email">Email address</label><input id="email" value={email} onChange={(event) => setEmail(event.target.value)} placeholder="you@example.com" className="min-w-0 flex-1 rounded-2xl border border-slate-200 bg-slate-50 px-5 py-4 text-sm outline-none focus:border-violet-400 focus:ring-4 focus:ring-violet-100 dark:border-white/10 dark:bg-slate-900 dark:focus:ring-violet-500/20" /><button className="rounded-2xl bg-violet-600 px-6 py-4 text-sm font-bold text-white hover:bg-violet-700">Join the list</button></div>
                {newsletterMessage && <p className={`text-sm ${newsletterMessage.startsWith("Please") ? "text-rose-500" : "text-emerald-600 dark:text-emerald-400"}`}>{newsletterMessage}</p>}
                <p className="text-xs text-slate-400">By subscribing, you agree to receive NexusShop updates. Unsubscribe anytime.</p>
              </form>
            </div>
          </section>
        </main>

        <footer className="border-t border-slate-300 bg-white py-14 dark:border-white/10 dark:bg-slate-950">
          <div className="mx-auto grid max-w-7xl gap-10 px-4 sm:grid-cols-2 sm:px-6 lg:grid-cols-4 lg:px-8">
            <div><div className="font-display flex items-center gap-2 text-xl font-extrabold"><span className="grid h-9 w-9 place-items-center rounded-xl bg-violet-600 text-white"><ShoppingBag className="h-5 w-5" /></span>NexusShop</div><p className="mt-4 max-w-xs text-sm leading-6 text-slate-500 dark:text-slate-400">Useful products, honest value, and a better online shopping experience.</p></div>
            {[{ title: "Shop", links: ["New arrivals", "Best sellers", "Deals", "Gift cards"] }, { title: "Help", links: ["Delivery", "Returns", "Contact", "FAQs"] }, { title: "Company", links: ["About", "Careers", "Privacy", "Terms"] }].map((group) => <div key={group.title}><h3 className="text-sm font-extrabold">{group.title}</h3><ul className="mt-4 space-y-3">{group.links.map((link) => <li key={link}><a href="#top" className="text-sm text-slate-500 hover:text-violet-600 dark:text-slate-400 dark:hover:text-violet-400">{link}</a></li>)}</ul></div>)}
          </div>
          <div className="mx-auto mt-12 flex max-w-7xl flex-col gap-3 border-t border-slate-200 px-4 pt-7 text-xs text-slate-400 sm:flex-row sm:items-center sm:justify-between sm:px-6 lg:px-8 dark:border-white/10"><span>© {new Date().getFullYear()} NexusShop. All rights reserved.</span><span>Designed for clarity, comfort, and confidence.</span></div>
        </footer>

        {mobileOpen && <div className="fixed inset-0 z-50 lg:hidden"><button className="absolute inset-0 bg-slate-950/60 backdrop-blur-sm" onClick={() => setMobileOpen(false)} aria-label="Close navigation" /><aside className="animate-enter absolute left-0 top-0 h-full w-[85%] max-w-sm bg-white p-5 shadow-2xl dark:bg-slate-950"><div className="flex items-center justify-between"><span className="font-display text-xl font-extrabold">Nexus<span className="text-violet-600">Shop</span></span><button onClick={() => setMobileOpen(false)} className="rounded-full bg-slate-100 p-2 dark:bg-white/10"><X className="h-5 w-5" /></button></div><nav className="mt-8 space-y-2">{["New arrivals", "Categories", "Trending now", "Today’s deals"].map((item) => <a key={item} href={item.includes("deal") ? "#deal" : item === "Categories" ? "#categories" : "#products"} onClick={() => setMobileOpen(false)} className="flex items-center justify-between rounded-2xl px-4 py-4 font-bold hover:bg-slate-100 dark:hover:bg-white/10">{item}<ChevronRight className="h-4 w-4" /></a>)}</nav><div className="mt-8 rounded-3xl bg-violet-100 p-5 text-slate-950"><Tag className="h-6 w-6 text-violet-600" /><strong className="mt-3 block">Member offer</strong><p className="mt-1 text-sm text-slate-600">Join the newsletter for early access and curated deals.</p></div></aside></div>}

        {cartOpen && <div className="fixed inset-0 z-50"><button className="absolute inset-0 bg-slate-950/60 backdrop-blur-sm" onClick={() => setCartOpen(false)} aria-label="Close shopping bag" /><aside className="animate-enter absolute right-0 top-0 flex h-full w-full max-w-md flex-col bg-white shadow-2xl dark:bg-slate-950"><div className="flex items-center justify-between border-b border-slate-200 p-5 dark:border-white/10"><div><h2 className="font-display text-xl font-extrabold">Your bag</h2><p className="text-xs text-slate-500">{cartQuantity} {cartQuantity === 1 ? "item" : "items"}</p></div><button onClick={() => setCartOpen(false)} className="rounded-full bg-slate-100 p-2.5 dark:bg-white/10"><X className="h-5 w-5" /></button></div>
          <div className="flex-1 overflow-y-auto p-5">{cartItems.length === 0 ? <div className="grid h-full place-items-center text-center"><div><span className="mx-auto grid h-16 w-16 place-items-center rounded-full bg-violet-100 text-violet-600"><ShoppingBag className="h-7 w-7" /></span><h3 className="font-display mt-5 text-xl font-extrabold">Your bag is empty</h3><p className="mt-2 text-sm text-slate-500">Add something you love and it will appear here.</p><button onClick={() => { setCartOpen(false); document.getElementById("products")?.scrollIntoView({ behavior: "smooth" }); }} className="mt-5 rounded-full bg-slate-950 px-5 py-3 text-sm font-bold text-white dark:bg-violet-500">Start shopping</button></div></div> : <div className="space-y-5">{cartItems.map((item) => <div key={item.id} className="flex gap-4"><img src={item.image} alt="" className="h-24 w-20 rounded-2xl object-cover" /><div className="min-w-0 flex-1"><div className="flex gap-2"><div className="flex-1"><h3 className="truncate text-sm font-bold">{item.title}</h3><p className="mt-1 text-xs text-slate-500">{item.category}</p></div><button onClick={() => setCart((current) => current.filter((entry) => entry.id !== item.id))} className="text-slate-400 hover:text-rose-500" aria-label={`Remove ${item.title}`}><Trash2 className="h-4 w-4" /></button></div><div className="mt-4 flex items-center justify-between"><div className="flex items-center rounded-full border border-slate-200 dark:border-white/10"><button onClick={() => updateQuantity(item.id, -1)} className="p-2"><Minus className="h-3 w-3" /></button><span className="min-w-7 text-center text-xs font-bold">{item.quantity}</span><button onClick={() => updateQuantity(item.id, 1)} className="p-2"><span className="text-base leading-none">+</span></button></div><strong className="text-sm">{money.format(item.price * item.quantity)}</strong></div></div></div>)}</div>}</div>
          {cartItems.length > 0 && <div className="border-t border-slate-200 p-5 dark:border-white/10"><div className="flex justify-between text-sm"><span className="text-slate-500">Subtotal</span><strong className="font-display text-lg">{money.format(subtotal)}</strong></div><p className="mt-2 text-xs text-slate-400">Shipping and taxes are calculated at checkout.</p><button onClick={() => setToast("Checkout is ready for backend integration")} className="mt-5 flex w-full items-center justify-center gap-2 rounded-2xl bg-violet-600 py-4 text-sm font-bold text-white hover:bg-violet-700"><ShieldCheck className="h-4 w-4" /> Secure checkout</button></div>}
        </aside></div>}

        {toast && <div className="fixed bottom-5 left-1/2 z-[60] flex -translate-x-1/2 items-center gap-2 rounded-full bg-slate-950 px-5 py-3 text-sm font-bold text-white shadow-2xl dark:bg-white dark:text-slate-950"><Check className="h-4 w-4 text-emerald-400" /> {toast}</div>}
      </div>
    </div>
  );
}
