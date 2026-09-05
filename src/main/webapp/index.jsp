
import React, { useMemo, useState } from "react";
import { AnimatePresence, motion } from "framer-motion";
import {
  ArrowRight,
  Check,
  ChevronDown,
  ChevronLeft,
  ChevronRight,
  CircleUserRound,
  Clock3,
  Headphones,
  Heart,
  Laptop,
  Menu,
  Minus,
  PackageCheck,
  Search,
  ShieldCheck,
  Shirt,
  ShoppingBag,
  ShoppingCart,
  Smartphone,
  Sparkles,
  Star,
  Truck,
  Watch,
  X,
  Zap,
} from "lucide-react";

const categories = [
  { id: "all", label: "All products", icon: Sparkles, tone: "bg-violet-100 text-violet-700" },
  { id: "phones", label: "Phones", icon: Smartphone, tone: "bg-blue-100 text-blue-700" },
  { id: "laptops", label: "Laptops", icon: Laptop, tone: "bg-cyan-100 text-cyan-700" },
  { id: "fashion", label: "Fashion", icon: Shirt, tone: "bg-rose-100 text-rose-700" },
  { id: "audio", label: "Audio", icon: Headphones, tone: "bg-amber-100 text-amber-700" },
  { id: "wearables", label: "Wearables", icon: Watch, tone: "bg-emerald-100 text-emerald-700" },
];

const products = [
  {
    id: 1,
    name: "Aurora Phone Pro",
    category: "phones",
    price: 899,
    previousPrice: 999,
    rating: 4.9,
    reviews: 124,
    badge: "New",
    description: "A brilliant edge-to-edge display, pro camera system, and all-day battery.",
    image: "https://images.unsplash.com/photo-1598327105666-5b89351aff97?auto=format&fit=crop&w=900&q=85",
  },
  {
    id: 2,
    name: "SlateBook Air 14",
    category: "laptops",
    price: 1249,
    previousPrice: 1399,
    rating: 4.8,
    reviews: 86,
    badge: "-11%",
    description: "A featherlight performance laptop made for focused work and creativity.",
    image: "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=900&q=85",
  },
  {
    id: 3,
    name: "Pulse ANC Headphones",
    category: "audio",
    price: 299,
    previousPrice: 349,
    rating: 4.9,
    reviews: 211,
    badge: "Bestseller",
    description: "Immersive sound, intelligent noise cancellation, and 40-hour battery life.",
    image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=900&q=85",
  },
  {
    id: 4,
    name: "Terra Runner",
    category: "fashion",
    price: 138,
    previousPrice: 168,
    rating: 4.7,
    reviews: 73,
    badge: "-18%",
    description: "Comfort-first everyday sneakers with a responsive, lightweight sole.",
    image: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=900&q=85",
  },
  {
    id: 5,
    name: "Orbit Watch S",
    category: "wearables",
    price: 329,
    previousPrice: null,
    rating: 4.8,
    reviews: 157,
    badge: "Popular",
    description: "Smarter health insights, precise fitness metrics, and a refined design.",
    image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=900&q=85",
  },
  {
    id: 6,
    name: "Studio Mini Speaker",
    category: "audio",
    price: 119,
    previousPrice: 145,
    rating: 4.6,
    reviews: 94,
    badge: "Limited",
    description: "Room-filling sound in a beautifully compact, travel-ready form.",
    image: "https://images.unsplash.com/photo-1589003077984-894e133dabab?auto=format&fit=crop&w=900&q=85",
  },
  {
    id: 7,
    name: "Canvas Daypack",
    category: "fashion",
    price: 84,
    previousPrice: null,
    rating: 4.8,
    reviews: 59,
    badge: "New",
    description: "A durable and well-organized everyday bag for city adventures.",
    image: "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=900&q=85",
  },
  {
    id: 8,
    name: "Nova Fold Phone",
    category: "phones",
    price: 1099,
    previousPrice: 1199,
    rating: 4.7,
    reviews: 48,
    badge: "-8%",
    description: "A pocket-sized phone that opens into a beautifully expansive display.",
    image: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=900&q=85",
  },
];

const perks = [
  { icon: Truck, title: "Free delivery", copy: "On orders over $75" },
  { icon: ShieldCheck, title: "Secure checkout", copy: "Protected payments" },
  { icon: PackageCheck, title: "Easy returns", copy: "30-day return window" },
  { icon: Headphones, title: "Helpful support", copy: "Here when you need us" },
];

const testimonials = [
  { quote: "Everything felt effortless, from discovery to delivery. The packaging was beautiful too.", name: "Maya R.", role: "Verified buyer", initials: "MR", color: "bg-fuchsia-100 text-fuchsia-700" },
  { quote: "The filters are fast, the product details are clear, and my order arrived earlier than expected.", name: "Noah K.", role: "Frequent shopper", initials: "NK", color: "bg-sky-100 text-sky-700" },
  { quote: "A refreshing shopping experience. I found exactly what I wanted without digging through clutter.", name: "Isha P.", role: "Verified buyer", initials: "IP", color: "bg-emerald-100 text-emerald-700" },
];

function money(value) {
  return new Intl.NumberFormat("en-US", { style: "currency", currency: "USD", maximumFractionDigits: 0 }).format(value);
}

function ProductCard({ product, wished, onWish, onAdd }) {
  return (
    <motion.article layout whileHover={{ y: -5 }} className="group overflow-hidden rounded-[28px] border border-slate-200/80 bg-white shadow-sm transition-shadow hover:shadow-xl hover:shadow-slate-200/60">
      <div className="relative aspect-[4/3] overflow-hidden bg-slate-100">
        <img src={product.image} alt={product.name} className="h-full w-full object-cover transition-transform duration-700 group-hover:scale-105" />
        <div className="absolute inset-x-0 top-0 flex items-start justify-between p-4">
          <span className="rounded-full bg-white/90 px-3 py-1.5 text-xs font-bold text-slate-800 shadow-sm backdrop-blur">{product.badge}</span>
          <button onClick={() => onWish(product.id)} aria-label={wished ? "Remove from wishlist" : "Add to wishlist"} className={`grid h-10 w-10 place-items-center rounded-full shadow-sm backdrop-blur transition ${wished ? "bg-rose-500 text-white" : "bg-white/90 text-slate-600 hover:text-rose-500"}`}>
            <Heart size={18} fill={wished ? "currentColor" : "none"} />
          </button>
        </div>
      </div>
      <div className="p-5">
        <div className="mb-2 flex items-center justify-between gap-3">
          <span className="text-xs font-bold uppercase tracking-[0.18em] text-violet-600">{product.category}</span>
          <div className="flex items-center gap-1 text-sm font-semibold text-slate-700"><Star size={14} className="fill-amber-400 text-amber-400" /> {product.rating} <span className="font-normal text-slate-400">({product.reviews})</span></div>
        </div>
        <h3 className="text-lg font-extrabold tracking-tight text-slate-950">{product.name}</h3>
        <p className="mt-2 line-clamp-2 text-sm leading-6 text-slate-500">{product.description}</p>
        <div className="mt-5 flex items-end justify-between gap-3">
          <div>
            <span className="text-xl font-black text-slate-950">{money(product.price)}</span>
            {product.previousPrice && <span className="ml-2 text-sm text-slate-400 line-through">{money(product.previousPrice)}</span>}
          </div>
          <button onClick={() => onAdd(product)} className="grid h-11 w-11 shrink-0 place-items-center rounded-2xl bg-slate-950 text-white transition hover:bg-violet-600 active:scale-95" aria-label={`Add ${product.name} to cart`}>
            <ShoppingBag size={18} />
          </button>
        </div>
      </div>
    </motion.article>
  );
}

export default function NexusShop() {
  const [category, setCategory] = useState("all");
  const [query, setQuery] = useState("");
  const [sort, setSort] = useState("Featured");
  const [wishlist, setWishlist] = useState(new Set());
  const [cart, setCart] = useState([]);
  const [cartOpen, setCartOpen] = useState(false);
  const [menuOpen, setMenuOpen] = useState(false);
  const [toast, setToast] = useState("");
  const [email, setEmail] = useState("");
  const [subscribed, setSubscribed] = useState(false);

  const filteredProducts = useMemo(() => {
    const normalized = query.trim().toLowerCase();
    let result = products.filter((item) => {
      const categoryMatch = category === "all" || item.category === category;
      const searchMatch = !normalized || `${item.name} ${item.category} ${item.description}`.toLowerCase().includes(normalized);
      return categoryMatch && searchMatch;
    });
    if (sort === "Price: Low") result = [...result].sort((a, b) => a.price - b.price);
    if (sort === "Price: High") result = [...result].sort((a, b) => b.price - a.price);
    if (sort === "Top rated") result = [...result].sort((a, b) => b.rating - a.rating);
    return result;
  }, [category, query, sort]);

  const cartCount = cart.reduce((sum, item) => sum + item.quantity, 0);
  const subtotal = cart.reduce((sum, item) => sum + item.price * item.quantity, 0);

  function notify(message) {
    setToast(message);
    window.clearTimeout(window.__nexusToast);
    window.__nexusToast = window.setTimeout(() => setToast(""), 2200);
  }

  function toggleWish(id) {
    const next = new Set(wishlist);
    if (next.has(id)) {
      next.delete(id);
      notify("Removed from favorites");
    } else {
      next.add(id);
      notify("Saved to favorites");
    }
    setWishlist(next);
  }

  function addToCart(product) {
    setCart((current) => {
      const found = current.find((item) => item.id === product.id);
      return found
        ? current.map((item) => item.id === product.id ? { ...item, quantity: item.quantity + 1 } : item)
        : [...current, { ...product, quantity: 1 }];
    });
    notify(`${product.name} added to your bag`);
  }

  function alterQuantity(id, amount) {
    setCart((current) => current.map((item) => item.id === id ? { ...item, quantity: item.quantity + amount } : item).filter((item) => item.quantity > 0));
  }

  function subscribe(event) {
    event.preventDefault();
    if (!email.includes("@")) return notify("Enter a valid email address");
    setSubscribed(true);
    setEmail("");
    notify("Welcome to the NexusShop list!");
  }

  return (
    <div className="min-h-screen bg-[#f7f8fc] font-sans text-slate-950 selection:bg-violet-200">
      <div className="bg-slate-950 px-4 py-2.5 text-center text-xs font-semibold tracking-wide text-white">
        <span className="text-violet-300">Weekend drop:</span> save up to 20% on selected tech. Free delivery over $75.
      </div>

      <header className="sticky top-0 z-40 border-b border-slate-200/70 bg-white/90 backdrop-blur-xl">
        <div className="mx-auto flex max-w-7xl items-center gap-4 px-4 py-4 sm:px-6 lg:px-8">
          <button onClick={() => setMenuOpen(!menuOpen)} className="grid h-10 w-10 place-items-center rounded-xl border border-slate-200 lg:hidden" aria-label="Toggle menu"><Menu size={20} /></button>
          <a href="#top" className="flex shrink-0 items-center gap-2 text-xl font-black tracking-[-0.04em]">
            <span className="grid h-9 w-9 place-items-center rounded-xl bg-violet-600 text-white"><Zap size={19} fill="currentColor" /></span>
            Nexus<span className="-ml-2 text-violet-600">Shop</span>
          </a>
          <nav className="ml-6 hidden items-center gap-7 text-sm font-bold text-slate-600 lg:flex">
            <a href="#new" className="transition hover:text-violet-600">New arrivals</a>
            <a href="#products" className="transition hover:text-violet-600">Shop</a>
            <a href="#deal" className="transition hover:text-violet-600">Deals</a>
            <a href="#stories" className="transition hover:text-violet-600">Stories</a>
          </nav>
          <div className="ml-auto hidden max-w-sm flex-1 items-center rounded-2xl bg-slate-100 px-4 py-2.5 md:flex focus-within:ring-2 focus-within:ring-violet-500">
            <Search size={18} className="text-slate-400" />
            <input value={query} onChange={(e) => setQuery(e.target.value)} placeholder="Search headphones, phones, bags..." className="w-full bg-transparent px-3 text-sm outline-none placeholder:text-slate-400" />
            {query && <button onClick={() => setQuery("")} aria-label="Clear search"><X size={16} className="text-slate-400" /></button>}
          </div>
          <button className="hidden h-10 w-10 place-items-center rounded-xl transition hover:bg-slate-100 sm:grid" aria-label="Account"><CircleUserRound size={21} /></button>
          <button onClick={() => setCartOpen(true)} className="relative grid h-10 w-10 place-items-center rounded-xl bg-slate-950 text-white transition hover:bg-violet-600" aria-label="Open cart">
            <ShoppingCart size={19} />
            {cartCount > 0 && <span className="absolute -right-2 -top-2 grid h-5 min-w-5 place-items-center rounded-full bg-orange-500 px-1 text-[10px] font-black text-white">{cartCount}</span>}
          </button>
        </div>
        <AnimatePresence>
          {menuOpen && (
            <motion.nav initial={{ height: 0, opacity: 0 }} animate={{ height: "auto", opacity: 1 }} exit={{ height: 0, opacity: 0 }} className="overflow-hidden border-t border-slate-100 bg-white lg:hidden">
              <div className="space-y-1 px-4 py-4 text-sm font-bold text-slate-700">
                {[['New arrivals','#new'],['Shop','#products'],['Deals','#deal'],['Stories','#stories']].map(([label, href]) => <a key={label} href={href} onClick={() => setMenuOpen(false)} className="block rounded-xl px-3 py-3 hover:bg-violet-50 hover:text-violet-700">{label}</a>)}
                <div className="mt-3 flex items-center rounded-xl bg-slate-100 px-3 py-3 md:hidden"><Search size={18} /><input value={query} onChange={(e) => setQuery(e.target.value)} placeholder="Search products" className="w-full bg-transparent px-3 outline-none" /></div>
              </div>
            </motion.nav>
          )}
        </AnimatePresence>
      </header>

      <main id="top">
        <section id="new" className="px-4 pt-5 sm:px-6 lg:px-8">
          <div className="relative mx-auto max-w-7xl overflow-hidden rounded-[36px] bg-slate-950 text-white">
            <img src="https://images.unsplash.com/photo-1441986300917-64674bd600d8?auto=format&fit=crop&w=1800&q=90" alt="Modern retail collection" className="absolute inset-0 h-full w-full object-cover opacity-45" />
            <div className="absolute inset-0 bg-gradient-to-r from-slate-950 via-slate-950/80 to-violet-950/25" />
            <div className="relative grid min-h-[560px] items-center px-6 py-16 sm:px-12 lg:grid-cols-2 lg:px-20">
              <motion.div initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.6 }}>
                <div className="mb-6 inline-flex items-center gap-2 rounded-full border border-white/15 bg-white/10 px-4 py-2 text-xs font-bold uppercase tracking-[0.15em] backdrop-blur"><Sparkles size={14} className="text-violet-300" /> The new essentials edit</div>
                <h1 className="max-w-3xl text-4xl font-black leading-[1.05] tracking-[-0.05em] sm:text-6xl lg:text-7xl">Designed for your <span className="text-violet-300">everyday.</span></h1>
                <p className="mt-6 max-w-xl text-base leading-7 text-slate-200 sm:text-lg">Discover considered tech, useful accessories, and modern essentials selected to make every day feel better.</p>
                <div className="mt-9 flex flex-wrap gap-3">
                  <a href="#products" className="inline-flex items-center gap-2 rounded-2xl bg-white px-6 py-3.5 text-sm font-extrabold text-slate-950 transition hover:bg-violet-200">Shop the collection <ArrowRight size={17} /></a>
                  <a href="#deal" className="inline-flex items-center gap-2 rounded-2xl border border-white/20 bg-white/10 px-6 py-3.5 text-sm font-extrabold backdrop-blur transition hover:bg-white/20">View today's deal</a>
                </div>
                <div className="mt-12 flex flex-wrap gap-x-8 gap-y-3 text-sm font-semibold text-slate-300">
                  <span className="flex items-center gap-2"><Check size={16} className="text-emerald-400" /> 30-day returns</span>
                  <span className="flex items-center gap-2"><Check size={16} className="text-emerald-400" /> Secure checkout</span>
                  <span className="flex items-center gap-2"><Check size={16} className="text-emerald-400" /> Curated quality</span>
                </div>
              </motion.div>
            </div>
          </div>
        </section>

        <section className="mx-auto grid max-w-7xl grid-cols-2 gap-3 px-4 py-8 sm:px-6 md:grid-cols-4 lg:px-8">
          {perks.map(({ icon: Icon, title, copy }) => (
            <div key={title} className="flex items-center gap-3 rounded-2xl border border-slate-200 bg-white p-4">
              <div className="grid h-11 w-11 shrink-0 place-items-center rounded-2xl bg-violet-50 text-violet-600"><Icon size={20} /></div>
              <div><p className="text-sm font-extrabold">{title}</p><p className="text-xs text-slate-500">{copy}</p></div>
            </div>
          ))}
        </section>

        <section className="mx-auto max-w-7xl px-4 py-10 sm:px-6 lg:px-8">
          <div className="flex items-end justify-between gap-4">
            <div><p className="text-sm font-extrabold uppercase tracking-[0.18em] text-violet-600">Find your fit</p><h2 className="mt-2 text-3xl font-black tracking-[-0.04em] sm:text-4xl">Shop by category</h2></div>
            <a href="#products" className="hidden items-center gap-2 text-sm font-bold text-slate-600 hover:text-violet-600 sm:flex">Browse all <ArrowRight size={16} /></a>
          </div>
          <div className="mt-7 grid grid-cols-2 gap-3 md:grid-cols-3 lg:grid-cols-6">
            {categories.map(({ id, label, icon: Icon, tone }) => (
              <button key={id} onClick={() => { setCategory(id); document.getElementById('products')?.scrollIntoView({ behavior: 'smooth' }); }} className={`rounded-3xl border p-5 text-left transition ${category === id ? "border-violet-500 bg-violet-50 ring-4 ring-violet-100" : "border-slate-200 bg-white hover:-translate-y-1 hover:shadow-lg"}`}>
                <span className={`grid h-11 w-11 place-items-center rounded-2xl ${tone}`}><Icon size={21} /></span>
                <span className="mt-5 block text-sm font-extrabold">{label}</span>
              </button>
            ))}
          </div>
        </section>

        <section id="products" className="mx-auto max-w-7xl scroll-mt-24 px-4 py-14 sm:px-6 lg:px-8">
          <div className="flex flex-col justify-between gap-5 sm:flex-row sm:items-end">
            <div><p className="text-sm font-extrabold uppercase tracking-[0.18em] text-violet-600">Trending now</p><h2 className="mt-2 text-3xl font-black tracking-[-0.04em] sm:text-4xl">Products worth knowing</h2><p className="mt-2 text-slate-500">{filteredProducts.length} thoughtfully selected items</p></div>
            <label className="relative self-start sm:self-auto"><span className="sr-only">Sort products</span><select value={sort} onChange={(e) => setSort(e.target.value)} className="appearance-none rounded-2xl border border-slate-200 bg-white py-3 pl-4 pr-10 text-sm font-bold outline-none ring-violet-500 focus:ring-2"><option>Featured</option><option>Top rated</option><option>Price: Low</option><option>Price: High</option></select><ChevronDown size={16} className="pointer-events-none absolute right-3 top-3.5" /></label>
          </div>
          {filteredProducts.length ? (
            <motion.div layout className="mt-8 grid gap-5 sm:grid-cols-2 lg:grid-cols-4">
              <AnimatePresence>{filteredProducts.map((product) => <ProductCard key={product.id} product={product} wished={wishlist.has(product.id)} onWish={toggleWish} onAdd={addToCart} />)}</AnimatePresence>
            </motion.div>
          ) : (
            <div className="mt-8 rounded-[28px] border border-dashed border-slate-300 bg-white p-12 text-center"><Search className="mx-auto text-slate-300" size={44} /><h3 className="mt-4 text-xl font-black">No matching products</h3><p className="mt-2 text-slate-500">Try a broader search or explore another category.</p><button onClick={() => { setQuery(""); setCategory("all"); }} className="mt-5 rounded-xl bg-violet-600 px-5 py-3 text-sm font-bold text-white">Reset filters</button></div>
          )}
        </section>

        <section id="deal" className="px-4 py-14 sm:px-6 lg:px-8">
          <div className="mx-auto grid max-w-7xl overflow-hidden rounded-[36px] bg-[#e8f4ec] lg:grid-cols-2">
            <div className="relative min-h-[360px] overflow-hidden lg:min-h-[520px]"><img src="https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?auto=format&fit=crop&w=1200&q=90" alt="Premium headphones deal" className="absolute inset-0 h-full w-full object-cover" /><span className="absolute left-6 top-6 rounded-full bg-slate-950 px-4 py-2 text-xs font-black uppercase tracking-widest text-white">Deal of the day</span></div>
            <div className="flex flex-col justify-center p-7 sm:p-12 lg:p-16">
              <div className="flex items-center gap-2 text-sm font-extrabold uppercase tracking-[0.16em] text-emerald-700"><Clock3 size={18} /> Ends Sunday</div>
              <h2 className="mt-5 text-4xl font-black leading-tight tracking-[-0.05em] sm:text-5xl">Hear every detail with Pulse ANC.</h2>
              <p className="mt-5 max-w-lg leading-7 text-slate-600">Adaptive noise cancellation, rich spatial audio, and a travel-ready design. Your everyday listening, upgraded.</p>
              <div className="mt-7 flex items-baseline gap-3"><span className="text-4xl font-black">$299</span><span className="text-lg text-slate-400 line-through">$349</span><span className="rounded-full bg-emerald-700 px-3 py-1 text-xs font-bold text-white">Save $50</span></div>
              <button onClick={() => addToCart(products[2])} className="mt-8 inline-flex w-fit items-center gap-2 rounded-2xl bg-slate-950 px-6 py-4 text-sm font-extrabold text-white transition hover:bg-emerald-700">Add deal to bag <ShoppingBag size={17} /></button>
            </div>
          </div>
        </section>

        <section id="stories" className="mx-auto max-w-7xl px-4 py-16 sm:px-6 lg:px-8">
          <div className="text-center"><p className="text-sm font-extrabold uppercase tracking-[0.18em] text-violet-600">Loved by shoppers</p><h2 className="mt-2 text-3xl font-black tracking-[-0.04em] sm:text-4xl">Real stories, real delight</h2></div>
          <div className="mt-9 grid gap-5 md:grid-cols-3">
            {testimonials.map((item) => (
              <article key={item.name} className="rounded-[28px] border border-slate-200 bg-white p-7 shadow-sm">
                <div className="flex gap-1 text-amber-400">{Array.from({ length: 5 }).map((_, i) => <Star key={i} size={16} fill="currentColor" />)}</div>
                <p className="mt-5 text-lg font-semibold leading-8 text-slate-700">“{item.quote}”</p>
                <div className="mt-7 flex items-center gap-3"><div className={`grid h-11 w-11 place-items-center rounded-full text-sm font-black ${item.color}`}>{item.initials}</div><div><p className="text-sm font-extrabold">{item.name}</p><p className="text-xs text-slate-500">{item.role}</p></div></div>
              </article>
            ))}
          </div>
        </section>

        <section className="px-4 pb-16 sm:px-6 lg:px-8">
          <div className="mx-auto max-w-7xl overflow-hidden rounded-[36px] bg-violet-600 px-6 py-12 text-white sm:px-12 lg:flex lg:items-center lg:justify-between lg:px-16">
            <div><p className="text-sm font-bold uppercase tracking-[0.2em] text-violet-200">The good stuff, occasionally</p><h2 className="mt-3 text-3xl font-black tracking-[-0.04em]">Get first access to fresh drops.</h2><p className="mt-3 text-violet-100">New arrivals, useful guides, and subscriber-only offers.</p></div>
            <form onSubmit={subscribe} className="mt-7 flex max-w-xl flex-col gap-3 sm:flex-row lg:mt-0 lg:w-[470px]">
              <input value={email} onChange={(e) => { setEmail(e.target.value); setSubscribed(false); }} type="email" placeholder="you@example.com" aria-label="Email address" className="min-w-0 flex-1 rounded-2xl border-0 bg-white px-5 py-4 text-sm font-semibold text-slate-950 outline-none ring-white/30 focus:ring-4" />
              <button className="rounded-2xl bg-slate-950 px-6 py-4 text-sm font-extrabold transition hover:bg-slate-800">{subscribed ? "Subscribed" : "Join the list"}</button>
            </form>
          </div>
        </section>
      </main>

      <footer className="border-t border-slate-200 bg-white">
        <div className="mx-auto grid max-w-7xl gap-10 px-4 py-12 sm:px-6 md:grid-cols-2 lg:grid-cols-5 lg:px-8">
          <div className="lg:col-span-2"><div className="flex items-center gap-2 text-xl font-black tracking-[-0.04em]"><span className="grid h-9 w-9 place-items-center rounded-xl bg-violet-600 text-white"><Zap size={19} fill="currentColor" /></span>Nexus<span className="-ml-2 text-violet-600">Shop</span></div><p className="mt-4 max-w-sm text-sm leading-6 text-slate-500">Thoughtfully selected products, approachable service, and a shopping experience built around you.</p></div>
          {[{ title: 'Shop', links: ['New arrivals','Best sellers','Deals','Gift cards'] },{ title: 'Help', links: ['Order status','Delivery','Returns','Contact'] },{ title: 'About', links: ['Our story','Journal','Careers','Privacy'] }].map((group) => <div key={group.title}><h3 className="text-sm font-black">{group.title}</h3><ul className="mt-4 space-y-3 text-sm text-slate-500">{group.links.map(link => <li key={link}><a href="#" className="hover:text-violet-600">{link}</a></li>)}</ul></div>)}
        </div>
        <div className="border-t border-slate-100 px-4 py-5 text-center text-xs text-slate-400">© 2026 NexusShop. Built for a simpler way to shop.</div>
      </footer>

      <AnimatePresence>
        {cartOpen && <>
          <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} onClick={() => setCartOpen(false)} className="fixed inset-0 z-50 bg-slate-950/45 backdrop-blur-sm" />
          <motion.aside initial={{ x: "100%" }} animate={{ x: 0 }} exit={{ x: "100%" }} transition={{ type: "spring", damping: 28, stiffness: 260 }} className="fixed inset-y-0 right-0 z-50 flex w-full max-w-md flex-col bg-white shadow-2xl">
            <div className="flex items-center justify-between border-b border-slate-200 px-6 py-5"><div><h2 className="text-xl font-black">Your bag</h2><p className="text-sm text-slate-500">{cartCount} {cartCount === 1 ? 'item' : 'items'}</p></div><button onClick={() => setCartOpen(false)} className="grid h-10 w-10 place-items-center rounded-xl bg-slate-100 hover:bg-slate-200" aria-label="Close cart"><X size={20} /></button></div>
            <div className="flex-1 overflow-y-auto p-6">
              {cart.length === 0 ? <div className="grid h-full place-items-center text-center"><div><span className="mx-auto grid h-16 w-16 place-items-center rounded-full bg-violet-50 text-violet-600"><ShoppingBag size={27} /></span><h3 className="mt-5 text-xl font-black">Your bag is ready</h3><p className="mt-2 text-sm text-slate-500">Add something you love and it will appear here.</p><button onClick={() => setCartOpen(false)} className="mt-6 rounded-2xl bg-slate-950 px-6 py-3 text-sm font-bold text-white">Continue shopping</button></div></div> : <div className="space-y-5">{cart.map((item) => <div key={item.id} className="flex gap-4"><img src={item.image} alt={item.name} className="h-24 w-24 rounded-2xl object-cover" /><div className="min-w-0 flex-1"><h3 className="truncate text-sm font-extrabold">{item.name}</h3><p className="mt-1 text-sm font-bold text-violet-600">{money(item.price)}</p><div className="mt-3 flex w-fit items-center rounded-xl border border-slate-200"><button onClick={() => alterQuantity(item.id, -1)} className="p-2" aria-label="Decrease quantity"><Minus size={14} /></button><span className="w-8 text-center text-sm font-bold">{item.quantity}</span><button onClick={() => alterQuantity(item.id, 1)} className="p-2" aria-label="Increase quantity"><ChevronRight size={14} /></button></div></div></div>)}</div>}
            </div>
            {cart.length > 0 && <div className="border-t border-slate-200 p-6"><div className="flex justify-between text-sm text-slate-500"><span>Subtotal</span><span className="text-xl font-black text-slate-950">{money(subtotal)}</span></div><p className="mt-2 text-xs text-slate-400">Delivery and taxes are calculated at checkout.</p><button onClick={() => notify("Checkout is ready for backend integration")} className="mt-5 w-full rounded-2xl bg-violet-600 px-6 py-4 text-sm font-extrabold text-white transition hover:bg-violet-700">Continue to checkout</button></div>}
          </motion.aside>
        </>}
      </AnimatePresence>

      <AnimatePresence>{toast && <motion.div initial={{ opacity: 0, y: 20, x: "-50%" }} animate={{ opacity: 1, y: 0, x: "-50%" }} exit={{ opacity: 0, y: 10, x: "-50%" }} className="fixed bottom-5 left-1/2 z-[70] flex items-center gap-2 rounded-2xl bg-slate-950 px-5 py-3 text-sm font-bold text-white shadow-2xl"><Check size={17} className="text-emerald-400" />{toast}</motion.div>}</AnimatePresence>
    </div>
  );
}
