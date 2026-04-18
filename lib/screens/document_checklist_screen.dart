import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class DocumentChecklistScreen extends StatefulWidget {
  const DocumentChecklistScreen({Key? key}) : super(key: key);

  @override
  State<DocumentChecklistScreen> createState() =>
      _DocumentChecklistScreenState();
}

class Document {
  final String id;
  final String name;
  final String category;
  final String risk;
  bool checked;

  Document({
    required this.id,
    required this.name,
    required this.category,
    required this.risk,
    this.checked = false,
  });
}

class _DocumentChecklistScreenState extends State<DocumentChecklistScreen> {
  late List<Document> documents;

  @override
  void initState() {
    super.initState();
    documents = [
      Document(
        id: 'passport',
        name: 'جواز السفر ساري للستة أشهر القادمة',
        category: 'أساسي',
        risk: 'مؤكد',
        checked: true,
      ),
      Document(
        id: 'visa-form',
        name: 'نموذج طلب التأشيرة',
        category: 'أساسي',
        risk: 'مؤكد',
        checked: true,
      ),
      Document(
        id: 'insurance',
        name: 'التأمين الطبي (30 يورو/يوم)',
        category: 'أساسي',
        risk: 'مؤكد',
        checked: false,
      ),
      Document(
        id: 'bank-statement',
        name: 'كشف حساب بنكي (700 يورو+)',
        category: 'وظيفي',
        risk: 'عالي',
        checked: true,
      ),
      Document(
        id: 'work-letter',
        name: 'خطاب من صاحب العمل',
        category: 'وظيفي',
        risk: 'عالي',
        checked: false,
      ),
      Document(
        id: 'france-form',
        name: 'استمارة أونلاين إضافية',
        category: 'خاص بالدولة',
        risk: 'مطلوب',
        checked: false,
      ),
    ];
  }

  Color _getRiskBgColor(String risk) {
    switch (risk) {
      case 'مؤكد':
        return AppColors.dangerLight;
      case 'عالي':
        return AppColors.warningLight;
      case 'مطلوب':
        return Colors.blue.shade100;
      default:
        return AppColors.successLight;
    }
  }

  Color _getRiskTextColor(String risk) {
    switch (risk) {
      case 'مؤكد':
        return AppColors.danger;
      case 'عالي':
        return AppColors.warning;
      case 'مطلوب':
        return Colors.blue.shade700;
      default:
        return AppColors.success;
    }
  }

  String _getRiskLabel(String risk) {
    switch (risk) {
      case 'مؤكد':
        return 'رفض مؤكد';
      case 'عالي':
        return 'خطر عالي';
      case 'مطلوب':
        return 'مطلوب';
      default:
        return 'اختياري';
    }
  }

  @override
  Widget build(BuildContext context) {
    final checkedCount = documents.where((d) => d.checked).length;
    final totalCount = documents.length;
    final progress = totalCount > 0 ? checkedCount / totalCount : 0;

    return Column(
      children: [
        // Progress Bar
        Container(
          height: 2,
          color: AppColors.border,
          child: FractionallySizedBox(
            widthFactor: 1.0,
            child: Container(color: AppColors.primary),
          ),
        ),
        // Header Card
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        const Text('🇫🇷', style: TextStyle(fontSize: 18)),
                        const SizedBox(width: 8),
                        Text(
                          'فرنسا',
                          style: GoogleFonts.cairo(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Paris Embassy',
                      style: GoogleFonts.cairo(
                        fontSize: 10,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    _BadgeChip('💶 80 يورو', AppColors.warningLight,
                        AppColors.warning),
                    _BadgeChip('⏱️ 15-30 يوم', Colors.blue.shade100,
                        Colors.blue.shade700),
                    _BadgeChip('💰 700 يورو+', Colors.green.shade100,
                        Colors.green.shade700),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Warning Banner
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: AppColors.warningLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              const Icon(Icons.warning, size: 14, color: AppColors.warning),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'فرنسا تطلب استمارة أونلاين قبل الموعد',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.cairo(
                    fontSize: 10,
                    color: AppColors.warning,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Progress Card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'تقدمك $checkedCount/$totalCount',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.cairo(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: AppColors.border,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Category Pills
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                _CategoryPill('أساسي', AppColors.primary),
                const SizedBox(width: 4),
                _CategoryPill('وظيفي', AppColors.teal),
                const SizedBox(width: 4),
                _CategoryPill('خاص بالدولة', AppColors.danger),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Documents List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final doc = documents[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  onTap: () => setState(() => doc.checked = !doc.checked),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: doc.checked ? AppColors.successLight : Colors.white,
                      border: Border.all(
                        color: doc.checked ? AppColors.success : AppColors.border,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        doc.checked
                            ? const Icon(Icons.check_circle,
                                size: 16, color: AppColors.success)
                            : Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.border, width: 1.5),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getRiskBgColor(doc.risk),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      _getRiskLabel(doc.risk),
                                      style: GoogleFonts.cairo(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500,
                                        color: _getRiskTextColor(doc.risk),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    doc.category,
                                    style: GoogleFonts.cairo(
                                      fontSize: 9,
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                doc.name,
                                textDirection: TextDirection.rtl,
                                style: GoogleFonts.cairo(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: doc.checked
                                      ? AppColors.textMuted
                                      : AppColors.textDark,
                                  decoration: doc.checked
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // Bottom Button
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Text('⚠️', style: TextStyle(fontSize: 12)),
              label: Text(
                'حلّل قوة ملفي',
                textDirection: TextDirection.rtl,
                style: GoogleFonts.cairo(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BadgeChip extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color textColor;

  const _BadgeChip(this.label, this.bgColor, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: GoogleFonts.cairo(
          fontSize: 9,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _CategoryPill extends StatelessWidget {
  final String label;
  final Color color;

  const _CategoryPill(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: GoogleFonts.cairo(
          fontSize: 11,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
