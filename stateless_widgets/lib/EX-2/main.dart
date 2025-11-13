import 'package:flutter/material.dart';
import '../appBar.dart';

enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  Color _getButtonColor() {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = buttonType == ButtonType.disabled;

    return ElevatedButton(
      onPressed: isDisabled ? null : () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: _getButtonColor(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPosition == IconPosition.left) ...[
            Icon(icon),
            const SizedBox(width: 8),
            Text(label),
          ] else ...[
            Text(label),
            const SizedBox(width: 8),
            Icon(icon),
          ],
        ],
      ),
    );
  }
}

class EX2 extends StatelessWidget {
  const EX2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBar('Buttons'),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: const [
              CustomButton(
                label: 'Primary Button',
                icon: Icons.check,
                buttonType: ButtonType.primary,
              ),
              CustomButton(
                label: 'Secondary Button',
                icon: Icons.settings,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.secondary,
              ),
              CustomButton(
                label: 'Disabled Button',
                icon: Icons.block,
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
