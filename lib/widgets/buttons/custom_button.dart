import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;

  CustomButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Color(0xff6DC79C),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 24.7,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                color: Color(0xff3FB883),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Create Ticket",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
