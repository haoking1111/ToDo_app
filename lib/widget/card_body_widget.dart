import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarBodyWidget extends StatelessWidget {

  CarBodyWidget({super.key, required this.item, required this.handleDelete, required this.index});

  // ignore: prefer_typing_uninitialized_variables
  var item;
  // ignore: prefer_typing_uninitialized_variables
  var index;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: (index%2==0)
            ? Colors.black45
            : Colors.blueGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                  fontSize: 20,
                  // color: Color(0xff4B4B4B),
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return;
              },
              child: const Icon(
                Icons.delete_outline,
                color: Color(0xff4B4B4B),
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}