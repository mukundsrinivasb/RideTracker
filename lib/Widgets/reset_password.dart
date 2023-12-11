import 'package:flutter/material.dart';

//Set a new password after the first authentication into aws amplify

class ResetPassword extends StatelessWidget {
  final TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Reset Password"),
      content: TextField(
        controller: newPasswordController,
        decoration: const InputDecoration(
          labelText: "Set new password",
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Color.fromRGBO(22, 23, 41, 1),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Handle resetting password here
            String newPassword = newPasswordController.text;

            Navigator.pop(context); // Close the dialog
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
