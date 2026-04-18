import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class CountrySelectorScreen extends StatefulWidget {
  const CountrySelectorScreen({Key? key}) : super(key: key);

  @override
  State<CountrySelectorScreen> createState() => _CountrySelectorScreenState();
}

class _CountrySelectorScreenState extends State<CountrySelectorScreen> {
  String? selectedCountry;

  final List<Map<String, String>> countries = [
    {'id': 'germany', 'flag': '🇩🇪', 'name': 'ألمانيا'},
    {'id': 'france', 'flag': '🇫🇷', 'name': 'فرنسا'},
    {'id': 'italy', 'flag': '🇮🇹', 'name': 'إيطاليا'},
    {'id': 'netherlands', 'flag': '🇳🇱', 'name': 'هولندا'},
    {'id': 'spain', 'flag': '🇪🇸', 'name': 'إسبانيا'},
    {'id': 'austria', 'flag': '🇦🇹', 'name': 'النمسا'},
    {'id': 'belgium', 'flag': '🇧🇪', 'name': 'بلجيكا'},
    {'id': 'switzerland', 'flag': '🇨🇭', 'name': 'سويسرا'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'إيه وجهتك الرئيسية؟',
                textDirection: TextDirection.rtl,
                style: GoogleFonts.cairo(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'هنجيب الأسئلة من موقع السفارة الرسمي',
                textDirection: TextDirection.rtl,
                style: GoogleFonts.cairo(
                  fontSize: 11,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: countries.length,
            itemBuilder: (context, index) {
              final country = countries[index];
              final isSelected = selectedCountry == country['id'];

              return GestureDetector(
                onTap: () => setState(() => selectedCountry = country['id']),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryLight : Colors.white,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.border,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(country['flag']!, style: const TextStyle(fontSize: 28)),
                      const SizedBox(height: 8),
                      Text(
                        country['name']!,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.cairo(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                      if (isSelected)
                        const Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(
                            '✓',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: selectedCountry != null ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                disabledBackgroundColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'التالي',
                style: GoogleFonts.cairo(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
