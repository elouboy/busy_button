import 'package:flutter/material.dart';

class OButton extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final bool busy;
  final bool disabled;
  final Color primaryColor;
  final Color titleColor;
  final void Function()? onTap;
  final Widget? leading;
  const OButton(
      {super.key,
      required this.title,
      this.titleStyle,
      required this.busy,
      required this.disabled,
      required this.primaryColor,
      required this.titleColor,
      this.onTap,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: primaryColor,
              width: 1,
            )),
        child: !busy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  if (leading != null) const SizedBox(width: 5),
                  Text(
                    title,
                    style: titleStyle,
                  ),
                ],
              )
            : const CircularProgressIndicator(
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
      ),
    );
  }
}
