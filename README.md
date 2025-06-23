# 📚 Dofia BookStore

Dofia BookStore is an online bookstore Flutter application allowing users to browse books, add to favorites, cart, and simulate an order.

---

## 🚀 Main features

- 🔍 Dynamic book display (carousel, sorting by category, price, etc.)
- ❤️ Add/remove books to favorites
- 🛒 Add/remove books to basket
- 🧾 Order details (Order Status)
- 📱 Responsive interface (Web & Mobile)
- 🧪 Backend-free status management thanks to **Provider**

---

## 🧰 Technologies

- Flutter** (3.x)
- **Provider** for state management
- **Kotlin** for Android integration (native part)
- No database or backend required

---

## 🛠️ Installation

### 1. clone project
```bash
git clone https://github.com/ton-utilisateur/dofia-bookstore.git
cd dofia-bookstore
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Run on a device
```bash
flutter run
```
💡 You can test on a browser (flutter run -d chrome) or a connected physical phone (flutter devices to see the options).

## 📂 Simplified tree structure
```bash
lib/
├── data/ # Providers (User, Book, Cart)
├── models/ # BookItem model
├── screens/ # Main pages (Home, Cart, Order Status)
├── widgets/ # Reusable components (BookCard, CartItem, etc.)
└── main.dart # Main application entry
```
## 🧪 Please note (demo mode)
- No real database: favorites and shopping cart are stored only in memory
- Simulates a purchase process without a payment gateway
- The login status is simplified

## ✨ Possible improvements
- Firebase/Supabase backend integration
- True authentication
- Keyword search
- Stripe or PayPal payment
- Persistent data backup (SharedPreferences or Hive)

## 🧑‍💻 Authors
Katheline Jannin
Rem Sonavin
Sau Channisa
Ret Sereymonny 

## 📝 Licence
Academic project – free, non-commercial use.
