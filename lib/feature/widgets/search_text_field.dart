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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        hintText: 'Ara...',
        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white54),
        suffixIcon: IconButton(
          onPressed: searched,
          //() async => await read.getCityData(city: controller.text),
          icon: const Icon(Icons.search, color: Colors.white),
        ),
      ),
    );
  }
}
