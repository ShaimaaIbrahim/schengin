import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class ScoreAnalysisScreen extends StatelessWidget {
  const ScoreAnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int score = 72;
    final scoreColor = _getScoreColor(score);

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
        // Score Ring
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CustomPaint(
                  painter: _CircleProgressPainter(
                    progress: score / 100,
                    color: scoreColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '$score',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: scoreColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Verdict
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text(
                'ملفك ${_getScoreLabel(score)}',
                textDirection: TextDirection.rtl,
                style: GoogleFonts.cairo(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: scoreColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'نسبة القبول: $score%',
                textDirection: TextDirection.rtl,
                style: GoogleFonts.cairo(
                  fontSize: 11,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Priority Cards
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            children: [
              _PriorityCard(
                type: 'danger',
                title: 'التأمين الطبي غائب',
                description: 'رفض مؤكد بدونه',
              ),
              const SizedBox(height: 8),
              _PriorityCard(
                type: 'warning',
                title: 'الرصيد أقل من المطلوب بـ 200 يورو',
                description: 'حاول أن تحسن رصيدك البنكي',
              ),
              const SizedBox(height: 8),
              _PriorityCard(
                type: 'success',
                title: 'خطاب العمل موقع ومترجم',
                description: 'جاهز تماماً ✓',
              ),
            ],
          ),
        ),
        // CTA Button
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'تواصل مع مكتب شريك',
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

class _PriorityCard extends StatelessWidget {
  final String type;
  final String title;
  final String description;

  const _PriorityCard({
    required this.type,
    required this.title,
    required this.description,
  });

  Color _getBgColor() {
    switch (type) {
      case 'danger':
        return AppColors.dangerLight;
      case 'warning':
        return AppColors.warningLight;
      default:
        return AppColors.successLight;
    }
  }

  Color _getTextColor() {
    switch (type) {
      case 'danger':
        return AppColors.danger;
      case 'warning':
        return AppColors.warning;
      default:
        return AppColors.success;
    }
  }

  IconData _getIcon() {
    switch (type) {
      case 'danger':
        return Icons.warning_rounded;
      case 'warning':
        return Icons.info;
      default:
        return Icons.check_circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: _getBgColor(),
        border: Border(
          left: BorderSide(
            color: _getTextColor(),
            width: 3,
          ),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Icon(_getIcon(), size: 14, color: _getTextColor()),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.cairo(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.cairo(
                    fontSize: 10,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Color _getScoreColor(int score) {
  if (score >= 70) return const Color(0xFF0F6E56);
  if (score >= 40) return const Color(0xFF854F0B);
  return const Color(0xFFA32D2D);
}

String _getScoreLabel(int score) {
  if (score >= 70) return 'قوي';
  if (score >= 40) return 'يحتاج تحسين';
  return 'ضعيف';
}

class _CircleProgressPainter extends CustomPainter {
  final double progress;
  final Color color;

  _CircleProgressPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = AppColors.border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final Paint progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2;

    canvas.drawCircle(center, radius, backgroundPaint);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -90 * 3.14159 / 180,
      360 * progress * 3.14159 / 180,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
