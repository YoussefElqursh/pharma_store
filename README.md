# Pharma Store 💊

A Flutter mobile app that makes buying medicine simple — order with one click, track your delivery from purchase to doorstep, and shop in the language you're comfortable with.

![Splash Screen](https://github.com/youssef883/pharma_store/assets/79144849/a6e40833-3d3f-4788-aeec-60d00f293198)

---

## Key Features

**🌍 Multi-language support**

The app fully supports **English** and **Arabic**, letting users choose their preferred language at first launch.

![Language Selection](https://github.com/youssef883/pharma_store/assets/79144849/0802b464-b483-4d9f-ac8a-a2109fd025f1)

**🛒 Effortless ordering**

Buying medicine is reduced to a single tap — browse, order, and receive your drugs without friction.

**📦 Real-time order tracking**

Trace your order from the moment of purchase until it's delivered to your door.

**⏱ On-time delivery**

The app and its backend are built to ensure medicine reaches you on schedule.

---

## Core Functionality

### 1 — Account creation with automatic verification

New users can create an account, which is automatically verified by the app — no manual approval step needed.

| | |
|---|---|
| ![Create Account 1](https://github.com/youssef883/pharma_store/assets/79144849/7c419666-6046-492b-b31d-a2d131134859) | ![Create Account 2](https://github.com/youssef883/pharma_store/assets/79144849/6e72380a-069d-4e5a-bc25-e1a1f62dccf1) |

### 2 — Secure login

Login uses a username and password combination, secured with JWT-based authentication.

![Login](https://github.com/youssef883/pharma_store/assets/79144849/fe5730ae-e518-4d63-8d3f-b3e681bf37b3)

### 3 — Flexible password reset

Forgot your password? Reset it via **Email** or **SMS**, whichever is more convenient.

![Reset Password](https://github.com/youssef883/pharma_store/assets/79144849/acd28f9b-28fb-4117-bbca-5402ffa20c03)

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| State Management | BLoC / Cubit (`flutter_bloc`, `bloc`) |
| Networking | `dio`, `http` |
| Auth | `jwt_decoder` (JWT-based sessions) |
| Local Storage | `shared_preferences` |
| Localization | `intl` (English & Arabic) |
| Responsive UI | `flutter_screenutil` |
| Charts | `syncfusion_flutter_charts` |
| Media / Files | `file_picker`, `flutter_cache_manager`, `contacts_service` |
| UI Helpers | `carousel_slider`, `smooth_page_indicator`, `dropdown_button2`, `flutter_svg`, `hexcolor` |

---

## Project Structure

```
lib/
├── main.dart
├── layout/                          # App shell / bottom nav layout
├── model/                           # Data models
├── shared/                          # Shared widgets, network, constants, cubit base
├── widgets/                         # Reusable UI components
└── module/
    ├── 1-splash_module/             # Splash screen
    ├── 2-choose_language_module/    # Language selection (EN/AR)
    ├── 3-onboarding_module/         # App walkthrough
    ├── 4-getstarted_module/         # Get started screen
    ├── 5-login_module/              # Username/password login (JWT)
    ├── 6-forgot_password_module/    # Reset via Email or SMS
    ├── 7-create_account_module/     # Sign up with auto-verification
    ├── 8-home_module/               # Browse products, order tracking
    ├── 9-account_module/            # User account/profile
    ├── 10-cart_module/              # Shopping cart & checkout
    └── 11-more_module/              # Settings & additional options
```

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- The Pharma Store backend running (see [Resources](#resources) below) or your own REST API endpoint configured in `lib/shared/`

### 1 — Clone the repository

```bash
git clone https://github.com/YoussefElqursh/pharma_store.git
cd pharma_store
```

### 2 — Install dependencies

```bash
flutter pub get
```

### 3 — Configure the API base URL

Point the app to your backend's base URL in the networking layer under `lib/shared/`.

### 4 — Run the app

```bash
# Debug on a connected device or emulator
flutter run

# Release build for Android
flutter build apk --release

# Release build for iOS
flutter build ios --release
```

---

## Resources

| Resource | Link |
|---|---|
| Backend (NestJS API) | [AhmedMohamed-16/nestjs-proj-graduate](https://github.com/AhmedMohamed-16/nestjs-proj-graduate.git) |
| Presentation | [Canva Deck](https://www.canva.com/design/DAF9W6cqU8k/f1qbQ7zum7QOUd9BqhBSlw/view?utm_content=DAF9W6cqU8k&utm_campaign=designshare&utm_medium=link&utm_source=editor) |
| UI/UX Design | [Figma — Pharma Store User Area UI](https://www.figma.com/file/zYyA5d3iRp0xKBHRtSSOtq/Pharma-Store-User-Area-UI?type=design&node-id=7%3A106&mode=design&t=q6HshcT4ZCLFiuYZ-1) |

---

## What We Used

- **Platform:** Flutter
- **Language:** Dart

---

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you'd like to change.

---

## License

This project is open-source. See [LICENSE](LICENSE) for details.
