# Link in bio store - ecommerce + link in bio (Link you shop)

# Build Runner

dart pub run build_runner build --delete-conflicting-outputs

# go router

GoRoute(
path: '/store/:id',
builder: (context, state) {
final id = state.pathParameters['id']!;
return StoreDetailsScreen(id: id);
},
),
🔹 Navigate
context.go('/store/123');

GoRoute(
path: '/products',
builder: (context, state) {
final search = state.uri.queryParameters['search'];
final page = state.uri.queryParameters['page'];

    return ProductScreen(
      search: search,
      page: page != null ? int.parse(page) : 1,
    );

},
),
🔹 Navigate
context.go('/products?search=shoes&page=2');

class Store {
final String id;
final String name;

Store({required this.id, required this.name});
}
🔹 Route
GoRoute(
path: '/create-store',
pageBuilder: (context, state) {
final store = state.extra as Store;

    return FadeTransitionPage(
      page: CreateStoreDetailsScreen(store: store),
    );

},
),

# Naseem

Naseem(Create online store MVP) is a simple, mobile-first storefront builder for small sellers who take orders on WhatsApp.

It lets sellers create a shareable link where customers can browse products and place orders directly via WhatsApp — no app install, no payment setup, no complexity.

---

## 🚀 Problem

Many small sellers (home food, clothing, local shops) sell through WhatsApp manually:

- Repeating product details again and again
- Sending images one by one
- Managing orders in chat

This is messy, time-consuming, and not scalable.

---

## 💡 Solution

Link you shop gives sellers a simple product page link:

👉 Customers open the link  
👉 Browse products  
👉 Add to cart  
👉 Place order via WhatsApp

No login. No checkout. No friction.

---

## ✨ Features (MVP)

- Create store in under 5 minutes
- Shareable store link (like link-in-bio)
- Product listing with images and price
- Add to cart (client-side)
- WhatsApp order with pre-filled message
- Store logo and description
- Local caching for fast load

---

## 🛠 Tech Stack

- Flutter (Admin App)
- Flutter Web (Public Store)
- Supabase (Database + Storage + Auth)
- Hive (Local caching)
- WhatsApp deep link (wa.me)

---

## 🎯 Target Users

- Home food sellers
- Boutique / saree sellers
- Small grocery delivery shops
- Local businesses using WhatsApp

---

## ⚡ Vision

Make selling online as simple as sharing a link.

---

## 🧪 Status

MVP in development
