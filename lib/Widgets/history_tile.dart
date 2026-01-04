import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String rightText;
  final Color bg;
  final Color textColor;
  final Color subColor;

  const HistoryTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.rightText,
    required this.bg,
    required this.textColor,
    required this.subColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(subtitle, style: TextStyle(color: subColor, fontSize: 13)),
            ],
          ),
          const Spacer(),
          Text(
            rightText,
            style: TextStyle(color: subColor, fontSize: 13),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
