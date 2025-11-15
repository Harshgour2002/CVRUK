import 'package:flutter/material.dart';

class Floatingnavigationbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const Floatingnavigationbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 1.0),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [],
      ),
    );
  }

  Widget _buildNavItem(IconData labelIcon, String label, int index) {
    final isSelected = index == currentIndex;
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 30),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected
              ? Colors.blueAccent.withValues(alpha: 0.1)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              labelIcon,
              size: 26,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
