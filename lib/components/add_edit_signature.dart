import 'package:flutter/material.dart';

class AddEditSignature extends StatefulWidget {
  final void Function(String value) onSubmit;
  final String? sign;
  const AddEditSignature({super.key, required this.onSubmit, this.sign});

  @override
  State<AddEditSignature> createState() => _AddEditSignatureState();
}

class _AddEditSignatureState extends State<AddEditSignature> {
  final TextEditingController signatureController = TextEditingController();

  bool showError = false;

  @override
  void initState() {
    super.initState();
    signatureController.text = widget.sign ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Name new signature",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10.0),
          if (showError) ...[
            Text(
              "Please specify a name for the signature",
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 5.0),
          ],
          TextField(
            controller: signatureController,
            maxLength: 320,
            decoration: InputDecoration(
              hintText: "Signature name",
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black54,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 3.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.grey.shade700),
                  overlayColor: MaterialStateProperty.all(Colors.grey.shade100),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              TextButton(
                onPressed: () {
                  if (signatureController.text.trim().isEmpty) {
                    setState(() {
                      showError = true;
                    });
                  } else {
                    widget.onSubmit(signatureController.text.trim());
                    Navigator.pop(context);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 25.0),
                  ),
                ),
                child: const Text(
                  "Create",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
