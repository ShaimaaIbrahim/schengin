import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';
import 'screens/country_selector_screen.dart';
import 'screens/intake_question_screen.dart';
import 'screens/document_checklist_screen.dart';
import 'screens/score_analysis_screen.dart';
import 'screens/loading_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const SchengenVisaApp());
}

class SchengenVisaApp extends StatelessWidget {
  const SchengenVisaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مستشار فيزا شنغن',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.cairoTextTheme(),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarThemeData(
          backgroundColor: AppColors.background,
          elevation: 0,
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreenIndex = 0;

  final List<Widget> screens = [
    const SplashScreen(),
    const CountrySelectorScreen(),
    const IntakeQuestionScreen(),
    const DocumentChecklistScreen(),
    const ScoreAnalysisScreen(),
    const LoadingScreen(),
  ];

  final List<String> screenNames = [
    'Splash',
    'Country Selector',
    'Intake Question',
    'Document Checklist',
    'Score Analysis',
    'Loading',
  ];

  void nextScreen() {
    if (currentScreenIndex < screens.length - 1) {
      setState(() => currentScreenIndex++);
    }
  }

  void previousScreen() {
    if (currentScreenIndex > 0) {
      setState(() => currentScreenIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'مستشار فيزا شنغن',
                  style: GoogleFonts.cairo(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Screen ${currentScreenIndex + 1} of ${screens.length}',
                  style: GoogleFonts.cairo(
                    fontSize: 14,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: previousScreen,
                  color: currentScreenIndex == 0 ? Colors.grey : AppColors.primary,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 44,
                          decoration: const BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(36),
                            ),
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.border,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '9:41',
                                style: GoogleFonts.cairo(
                                  fontSize: 12,
                                  color: AppColors.textMuted,
                                ),
                              ),
                              Text(
                                '📶 🔋',
                                style: GoogleFonts.cairo(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(36),
                              ),
                            ),
                            child: screens[currentScreenIndex],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: nextScreen,
                  color: currentScreenIndex == screens.length - 1
                      ? Colors.grey
                      : AppColors.primary,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                screens.length,
                (index) => GestureDetector(
                  onTap: () => setState(() => currentScreenIndex = index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: index == currentScreenIndex ? 32 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == currentScreenIndex
                          ? AppColors.primary
                          : AppColors.border,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              screenNames[currentScreenIndex],
              style: GoogleFonts.cairo(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
