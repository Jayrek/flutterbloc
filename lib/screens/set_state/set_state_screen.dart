import 'package:flutter/material.dart';
import 'package:flutterbloc/shared/widgets/custom_button_widget.dart';

class SetStateScreen extends StatefulWidget {
  const SetStateScreen({super.key});

  @override
  State<SetStateScreen> createState() => _SetStateScreenState();
}

class _SetStateScreenState extends State<SetStateScreen> {
  bool isMask = false;

  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild setState');
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetState'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isMask ? 'Tapped' : 'Tap Me!',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              CustomButtonWidget(
                onPressed: () {
                  setState(() {
                    isMask = !isMask;
                  });
                },
                label: isMask ? 'Back' : 'Tap',
                backgroundColor: isMask ? Colors.blueGrey : Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
