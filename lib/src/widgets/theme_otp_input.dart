import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeOtpInput extends StatefulWidget {
  const ThemeOtpInput({
    super.key,
    this.length = 6,
    this.onChanged,
    this.onCompleted,
    this.autofocus = true,
    this.boxShape = BoxShape.circle,
    this.boxSize = 52,
    this.spacing = 10,
    this.obscure = false,
    this.keyboardType = TextInputType.number,
  });

  final int length;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final bool autofocus;
  final BoxShape boxShape;
  final double boxSize;
  final double spacing;
  final bool obscure;
  final TextInputType keyboardType;

  @override
  State<ThemeOtpInput> createState() => _ThemeOtpInputState();
}

class _ThemeOtpInputState extends State<ThemeOtpInput> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _nodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _nodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) { c.dispose(); }
    for (final n in _nodes) { n.dispose(); }
    super.dispose();
  }

  void _onChanged(int i, String v) {
    if (v.length > 1) {
      final paste = v;
      _controllers[i].text = paste[0];
      for (var j = 1; j < paste.length && i + j < widget.length; j++) {
        _controllers[i + j].text = paste[j];
      }
      (i + paste.length < widget.length ? _nodes[i + paste.length] : _nodes[widget.length - 1]).requestFocus();
    } else if (v.isNotEmpty && i < widget.length - 1) {
      _nodes[i + 1].requestFocus();
    } else if (v.isEmpty && i > 0) {
      _nodes[i - 1].requestFocus();
    }
    final code = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(code);
    if (code.length == widget.length) widget.onCompleted?.call(code);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(mainAxisSize: MainAxisSize.min, children: [
      for (var i = 0; i < widget.length; i++) ...[
        if (i != 0) SizedBox(width: widget.spacing),
        SizedBox(
          width: widget.boxSize,
          height: widget.boxSize,
          child: TextField(
            controller: _controllers[i],
            focusNode: _nodes[i],
            autofocus: widget.autofocus && i == 0,
            textAlign: TextAlign.center,
            keyboardType: widget.keyboardType,
            maxLength: 1,
            obscureText: widget.obscure,
            style: Theme.of(context).textTheme.titleLarge,
            inputFormatters: [LengthLimitingTextInputFormatter(1)],
            decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.zero,
              enabledBorder: widget.boxShape == BoxShape.circle
                  ? OutlineInputBorder(borderRadius: BorderRadius.circular(widget.boxSize / 2), borderSide: BorderSide(color: scheme.outline))
                  : OutlineInputBorder(borderSide: BorderSide(color: scheme.outline)),
              focusedBorder: widget.boxShape == BoxShape.circle
                  ? OutlineInputBorder(borderRadius: BorderRadius.circular(widget.boxSize / 2), borderSide: BorderSide(color: scheme.primary, width: 1.5))
                  : OutlineInputBorder(borderSide: BorderSide(color: scheme.primary, width: 1.5)),
            ),
            onChanged: (v) => _onChanged(i, v),
          ),
        ),
      ],
    ]);
  }
}