import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Buttons')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                label: 'Submit',
                icon: Icons.done,
                type: ButtonType.primary,
                iconPosition: IconPosition.left,
              ),
              SizedBox(height: 16),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                type: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 16),
              CustomButton(
                label: 'Account',
                icon: Icons.person,
                type: ButtonType.disabled,
                iconPosition: IconPosition.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  const CustomButton({
    Key? key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary,
  }) : super(key: key);

  Color getButtonColor() {
    switch (type) {
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: getButtonColor(),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: type == ButtonType.disabled ? null : () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buildButtonContent(),
      ),
    );
  }

  List<Widget> buildButtonContent() {
    final iconWidget = Icon(icon, size: 20);
    const spacing = SizedBox(width: 8);
    final textWidget = Text(
      label,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );

    if (iconPosition == IconPosition.left) {
      return [iconWidget, spacing, textWidget];
    } else {
      return [textWidget, spacing, iconWidget];
    }
  }
}
