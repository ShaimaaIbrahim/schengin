# مستشار فيزا شنغن - Schengen Visa Advisor

A professional, production-ready Flutter mobile application for Arabic RTL Schengen visa document advisory. Built with Flutter 3.0+, this app provides users with comprehensive guidance on visa requirements across all Schengen countries.

## Features

✨ **6 Interactive Screens**
1. **Splash Screen** - Welcome with value propositions
2. **Country Selector** - Choose destination (2-column grid)
3. **Intake Question** - Multi-step form with progress tracking
4. **Document Checklist** - Interactive checklist with risk badges
5. **Score Analysis** - Custom circular progress visualization
6. **Loading Screen** - Animated loading state

🌍 **Full RTL Support**
- Complete Arabic localization
- Right-to-left text direction throughout
- Cairo Google Font optimized for Arabic

🎨 **Custom Design System**
- Brand Color: #534AB7 (Primary Purple)
- Success: #0F6E56 (Teal)
- Warning: #854F0B (Amber)
- Danger: #A32D2D (Red)
- Responsive layouts with proper spacing
- Interactive states and animations

📱 **Platform Support**
- iOS 11+
- Android 5.0+ (API 21)
- Web (experimental)

## Project Structure

```
schengen_visa_app/
├── lib/
│   ├── main.dart                          # App entry point
│   ├── theme/
│   │   └── app_colors.dart               # Color constants
│   └── screens/
│       ├── splash_screen.dart
│       ├── country_selector_screen.dart
│       ├── intake_question_screen.dart
│       ├── document_checklist_screen.dart
│       ├── score_analysis_screen.dart
│       └── loading_screen.dart
├── android/                               # Android native code
├── ios/                                   # iOS native code
└── pubspec.yaml                          # Dependencies
```

## Installation

### Prerequisites
- Flutter 3.0 or higher
- Dart 3.0 or higher
- iOS: Xcode 14+ (for iOS builds)
- Android: Android Studio with NDK

### Setup Steps

1. **Clone or download the project**
```bash
cd schengen_visa_app
```

2. **Get dependencies**
```bash
flutter pub get
```

3. **Run on device/emulator**
```bash
flutter run
```

### Running on Specific Platforms

**iOS:**
```bash
flutter run -d iphone
```

**Android:**
```bash
flutter run -d android
```

**Web (experimental):**
```bash
flutter run -d chrome
```

## Building for Release

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle (Google Play)
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
# Then use Xcode to sign and archive
```

## Dependencies

- **google_fonts**: Google Fonts for Cairo font
- **intl**: Internationalization support
- **flutter**: Core framework

## Architecture

The app follows a simple yet scalable architecture:

- **main.dart**: Home screen with navigation logic
- **screens/**: Individual screen widgets (stateful/stateless as needed)
- **theme/**: Design tokens and color constants

### State Management
Currently using StatefulWidget for local state. For larger apps, consider:
- Provider
- Riverpod
- BLoC pattern
- GetX

## Design System

### Colors
All colors are defined in `lib/theme/app_colors.dart` for easy theming.

### Typography
- **Font**: Cairo (Google Fonts)
- **Sizes**: 11px-24px range
- **Weights**: 400 (Regular), 700 (Bold)

### Spacing
Uses consistent 4px/8px/16px/24px increment scale for responsive layouts.

### Icons
Emoji-based icons throughout for simplicity and cross-platform consistency.

## RTL Implementation

The app is fully RTL-enabled:
- `TextDirection.rtl` used throughout
- Material Design RTL support enabled
- Proper text alignment for Arabic script

## Customization

### Changing Colors
Edit `lib/theme/app_colors.dart`:
```dart
static const Color primary = Color(0xFF534AB7);
```

### Adding New Screens
1. Create new file in `lib/screens/new_screen.dart`
2. Extend `StatelessWidget` or `StatefulWidget`
3. Import and add to HomeScreen navigation

### Modifying Fonts
Update `pubspec.yaml` to add/change fonts:
```yaml
flutter:
  fonts:
    - family: YourFont
      fonts:
        - asset: assets/fonts/YourFont.ttf
```

## Performance Optimization

- Uses `const` constructors where possible
- ListView for efficient scrolling
- Lazy-loaded screens with navigation
- Minimal rebuilds with proper state management

## Troubleshooting

### Build Issues
```bash
# Clean build
flutter clean
flutter pub get
flutter pub upgrade
```

### Device not found
```bash
flutter devices
flutter run -d <device_id>
```

### Font not loading
- Ensure font files are in `assets/fonts/`
- Run `flutter pub get` after updating pubspec.yaml
- Restart the app

## Contributing

To add new features:
1. Create feature branch
2. Implement changes
3. Test on both iOS and Android
4. Submit PR with description

## License

This project is proprietary. All rights reserved.

## Support

For issues or questions:
- Check existing GitHub issues
- Create detailed bug report with steps to reproduce
- Include device info and Flutter version: `flutter --version`

## Deployment

### Firebase Distribution (for testing)
```bash
flutter build apk --release
firebase app:distribute:android --app=<APP_ID> app-release.apk
```

### App Store Distribution
Follow [Flutter documentation](https://flutter.dev/docs/deployment/ios) for detailed iOS deployment.

### Google Play Distribution
Follow [Flutter documentation](https://flutter.dev/docs/deployment/android) for detailed Android deployment.

---

Built with ❤️ using Flutter
