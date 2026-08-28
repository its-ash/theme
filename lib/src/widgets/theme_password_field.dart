import 'package:flutter/material.dart';

class ThemePasswordField extends StatefulWidget {
  const ThemePasswordField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText = 'Password',
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;

  @override
  State<ThemePasswordField> createState() => _ThemePasswordFieldState();
}

class _ThemePasswordFieldState extends State<ThemePasswordField> {
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscured,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        errorText: widget.errorText,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(_obscured ? Icons.visibility_outlined : Icons.visibility_off_outlined),
          tooltip: _obscured ? 'Show password' : 'Hide password',
          onPressed: () => setState(() => _obscured = !_obscured),
        ),
      ),
    );
  }
}
