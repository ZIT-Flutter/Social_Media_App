import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final IconData selectephoto;
  final String icontitle;
  final Color iconcolor;
  final VoidCallback? onClick;

  const PostCard(
      {super.key,
      required this.icontitle,
      required this.selectephoto,
      required this.iconcolor,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          Icon(
            selectephoto,
            color: iconcolor,
            size: 25,
          ),
          Text(
            icontitle,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
