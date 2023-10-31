import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ModelButton extends StatelessWidget {
  ModelButton({super.key, required this.addTask});

  final Function addTask;

  TextEditingController controller = TextEditingController();


  void _handleOnclick(BuildContext context) {
    final name = controller.text;
    if(name.isEmpty) {
      return;
    }
    addTask(name);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  labelText: 'Your task'
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),
                onPressed: () => _handleOnclick(context),
                child: const Text('Add Task'),
              ),
            )
          ],
        ),
      ),
    );
  }

}