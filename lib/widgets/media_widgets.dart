import 'package:assigment2/utils/text_icon.dart';
import 'package:flutter/material.dart';

class MediaWidgets extends StatelessWidget {
  const MediaWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Media, docs and links',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}

class MediaImage extends StatelessWidget {
  const MediaImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/image.png',
                height: 100,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      TextIcon(
        text: 'Clear Chat',
        icon: Icon(Icons.delete),
        color: Colors.black,
      ),
      SizedBox(
        height: 10,
      ),
      TextIcon(
        text: 'Encryption',
        icon: Icon(Icons.lock),
        color: Colors.black,
      ),
      SizedBox(
        height: 10,
      ),
      TextIcon(
        text: 'Exit community',
        icon: Icon(Icons.exit_to_app, color: Colors.red),
        color: Colors.red,
      ),
      SizedBox(
        height: 10,
      ),
      TextIcon(
        text: 'Report',
        icon: Icon(Icons.thumb_down, color: Colors.red),
        color: Colors.red,
      ),
    ]);
  }
}
