import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(12), 
          border: Border.all(
            color: Colors.grey.shade300, 
            width: 1.5,
          ),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.grey.shade500),
            border: InputBorder.none, 
            prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
          ),
        ),
      ),
    );
  }
}
