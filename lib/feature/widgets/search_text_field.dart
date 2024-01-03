import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.onChanged, required this.searched});
  final Function(String)? onChanged;
  final VoidCallback searched;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: 'Ara...',
        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white54),
        suffixIcon: IconButton(
          onPressed: searched,
          icon: const Icon(Icons.search, color: Colors.white),
        ),
      ),
    );
  }
}
