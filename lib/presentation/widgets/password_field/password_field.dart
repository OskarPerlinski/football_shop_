import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordField extends HookWidget {
  const PasswordField({super.key, required this.text, this.obscureText = true});

  final String text;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final isObscure = useState(obscureText);

    return TextFormField(
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: IconButton(
          onPressed: () => isObscure.value = !isObscure.value,
          icon: Icon(isObscure.value ? Icons.visibility_off : Icons.visibility),
        ),
      ),
      obscureText: isObscure.value,
    );
  }
}
