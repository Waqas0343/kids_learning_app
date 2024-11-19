import 'package:flutter/material.dart';
import '../app_styles/complete_app_theme.dart';

class CustomCard extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPressed, onLongPressed;
  final Widget? child;
  final EdgeInsets? margin;
  final double? radius;

  const CustomCard({
    super.key,
    this.child,
    this.color,
    this.onPressed,
    this.onLongPressed,
    this.margin,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Determine card width and margin based on screen size
    final double cardWidth = screenWidth > 600 ? screenWidth * 0.4 : screenWidth * 0.8; // Adjust width for tablets
    final EdgeInsets cardMargin = screenWidth > 600 ? const EdgeInsets.all(16) : const EdgeInsets.all(8); // Adjust margin for tablets

    return Container(
      margin: margin ?? cardMargin,
      width: cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? AppThemeInfo.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2.5,
            spreadRadius: 1.0,
          )
        ],
      ),
      child: Material(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(radius ?? AppThemeInfo.borderRadius),
        type: MaterialType.button,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius ?? AppThemeInfo.borderRadius),
          onTap: onPressed,
          onLongPress: onLongPressed,
          child: child,
        ),
      ),
    );
  }
}
