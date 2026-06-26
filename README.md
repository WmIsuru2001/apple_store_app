# 🍎 Apple Store App

A **Flutter-based mini e-commerce application** inspired by the Apple Store experience. Built with clean UI design, smooth animations, and a full shopping cart workflow.

---

## 📱 Screenshots

> Add screenshots to `docs/screenshots/` and update paths here.

---

## ✨ Features

- **Splash Screen** — Branded intro screen with Apple logo before entering the app
- **Authentication** — Sign In, Sign Up, and Forgot Password flows with form validation
- **Home Page** — Personalized greeting, image carousel slider, and quick-action buttons (Profile, Favourites, Cart, Orders)
- **Category Filtering** — Filter products by iPhone, iPad, MacBook, Apple Watch, or AirPods
- **Product Search** — Real-time search across product titles and categories
- **Product Grid** — Clean card layout with product image, rating, and price
- **Hero Animations** — Smooth shared-element transitions from the product grid to the detail screen
- **Product Detail Screen** — Full description, rating, review count, and add-to-cart action
- **Shopping Cart** — Quantity adjustment, item removal, and total price calculation via Provider state management
- **Profile Screen** — User profile overview

---

## 🏗️ Project Structure

```
lib/
├── main.dart                    # App entry point & Provider setup
├── controllers/
│   └── cart_controller.dart     # Cart state management (ChangeNotifier)
├── models/
│   ├── product_model.dart       # Product data model
│   ├── category_model.dart      # Category data model
│   └── cart_item_model.dart     # Cart item data model
├── data/
│   └── demo_data.dart           # Static product & category data
├── screens/
│   ├── splash_screen/           # Splash screen
│   ├── auth_screen/             # Sign in / Sign up / Forgot password
│   ├── home_page/               # Home with search, slider, categories & grid
│   ├── product_detail/          # Product detail page
│   ├── cart/                    # Shopping cart screen
│   └── profile/                 # User profile screen
├── components/
│   └── buttons/                 # Reusable button components
└── utils/
    └── custom_navigator.dart    # Navigation helpers
```

---

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| **Flutter** | Cross-platform UI framework |
| **Dart** | Programming language |
| **Provider** | State management |
| **Google Fonts** | Typography (Poppins) |
| **Carousel Slider** | Home page image slider |
| **Font Awesome Flutter** | Icons |
| **Cupertino Icons** | iOS-style icons |

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^6.1.0
  logger: ^2.0.2
  carousel_slider: ^5.0.0
  provider: ^6.1.2
  font_awesome_flutter: ^10.8.0
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0 <4.0.0`
- Dart SDK
- Android Studio / VS Code with Flutter extension
- An emulator or physical device

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/WmIsuru2001/apple_store_app.git
   cd apple_store_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build

```bash
# Android APK
flutter build apk --release

# iOS (macOS only)
flutter build ios --release
```

---

## 🗂️ Product Categories

| Category | Products |
|---|---|
| 📱 iPhone | iPhone 14 Pro Max |
| 📟 iPad | iPad Pro 12.9" |
| 💻 MacBook | MacBook Pro 16" |
| ⌚ Apple Watch | Apple Watch Series |
| 🎧 AirPods | AirPods Pro |

---

## 🧠 Architecture

State management is handled with **Provider**. A single `CartController` (extending `ChangeNotifier`) is injected at the root of the widget tree and accessed throughout the app via `context.watch` / `context.read`.

```
main.dart
  └── ChangeNotifierProvider<CartController>
        └── MaterialApp
              ├── SplashScreen → AuthScreen → HomePage
              ├── ProductDetailScreen
              ├── CartScreen
              └── ProfileScreen
```

---

## 👨‍💻 Developer

**W.M. Isuru Sandaruwan**  
BSc (Hons) Computer Science — Trincomalee Campus, Eastern University, Sri Lanka  
GitHub: [@WmIsuru2001](https://github.com/WmIsuru2001)

---

## 📄 License

This project is for educational and portfolio purposes.

---

> *Built with Flutter 💙*
