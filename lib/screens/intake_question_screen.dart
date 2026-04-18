import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class IntakeQuestionScreen extends StatefulWidget {
  const IntakeQuestionScreen({Key? key}) : super(key: key);

  @override
  State<IntakeQuestionScreen> createState() => _IntakeQuestionScreenState();
}

class _IntakeQuestionScreenState extends State<IntakeQuestionScreen> {
  String? selectedOption;

  final List<Map<String, String>> options = [
    {'id': 'govt', 'label': 'موظف حكومي'},
    {'id': 'private', 'label': 'موظف شركة خاصة'},
    {'id': 'freelance', 'label': 'أعمال حرة'},
    {'id': 'student', 'label': 'طالب'},
    {'id': 'housewife', 'label': 'ربة منزل'},
    {'id': 'retired', 'label': 'متقاعد'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress Bar
        Container(
          height: 2,
          color: AppColors.border,
          child: FractionallySizedBox(
            widthFactor: 0.375,
            child: Container(color: AppColors.primary),
          ),
        ),
        // Header
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'سؤال 3 من 8',
                textDirection: TextDirection.rtl,
                style: GoogleFonts.cairo(
                  fontSize: 11,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'ما وضعك الوظيفي الحالي؟',
                textDirection: TextDirection.rtl,
                style: GoogleFonts.cairo(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'نوع وظيفتك مهم جداً في قرار الموافقة على الفيزا',
                textDirection: TextDirection.rtl,
                style: GoogleFonts.cairo(
                  fontSize: 11,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        // Options
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: options.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final option = options[index];
              final isSelected = selectedOption == option['id'];

              return GestureDetector(
                onTap: () => setState(() => selectedOption = option['id']),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryLight : Colors.white,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.border,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isSelected ? '✓' : '○',
                        style: TextStyle(
                          fontSize: 14,
                          color: isSelected ? AppColors.primary : Colors.grey,
                        ),
                      ),
                      Text(
                        option['label']!,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.cairo(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // Warning Banner
        if (selectedOption != null)
          Container(
            margin: const EdgeInsets.all(12.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: AppColors.warningLight,
              border: Border.all(color: AppColors.warning),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                const Icon(Icons.warning, size: 14, color: AppColors.warning),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'رفض سابق بدون تصحيح الأسباب يرفع نسبة الرفض',
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.cairo(
                      fontSize: 11,
                      color: AppColors.warning,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        // Button
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: selectedOption != null ? () {} : null,
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
