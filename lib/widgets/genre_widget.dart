import 'package:flutter/material.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({
    super.key,
    required this.listtext,
  });

  final List<String> listtext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listtext.length,
        itemBuilder: (context, index) {
          for (var i = 0; i < listtext.length;) {
            return Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                listtext[index],
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
