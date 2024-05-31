import 'package:assigment2/utils/text_icon.dart';
import 'package:flutter/material.dart';

class AppIntroWidget extends StatelessWidget {
  final bool isScrolled;
  const AppIntroWidget({
    super.key,
    required this.isScrolled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 245, 20, 4),
      padding: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            isScrolled == false
                ? const SizedBox()
                : IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white, size: 30),
                  ),
            isScrolled == false
                ? const SizedBox()
                : const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/image.png'),
                  ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Weekend',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text('Community .+11k Members',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            const Spacer(),
            isScrolled == false
                ? IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.share, color: Colors.white, size: 30))
                : IconButton(
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        showDragHandle: true,
                        builder: (context) {
                          return Container(
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextIcon(
                                      text: 'Invite',
                                      icon: Icon(Icons.share),
                                      color: Colors.black),
                                  TextIcon(
                                      text: 'Add Members',
                                      icon: Icon(Icons.add),
                                      color: Colors.black),
                                  TextIcon(
                                      text: 'Add Group',
                                      icon: Icon(Icons.group_add),
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.more_vert,
                        color: Colors.white, size: 30),
                  ),
          ],
        ),
      ),
    );
  }
}
