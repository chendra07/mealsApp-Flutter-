import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const CustomIconButton({
    Key key,
    @required this.title,
    @required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 6),
          Text(title),
        ],
      ),
    );
  }
}
