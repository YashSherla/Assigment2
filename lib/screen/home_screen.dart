import 'package:assigment2/utils/utils.dart';
import 'package:assigment2/widgets/genre_widget.dart';
import 'package:assigment2/widgets/image_widget.dart';
import 'package:assigment2/widgets/intro_widget.dart';
import 'package:assigment2/widgets/media_widgets.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool value = false;
  List<bool> isPressed = List<bool>.filled(15, false);

  bool isScrolled = false;

  List<String> listtext = [
    "Outdoor",
    "Outdoor",
    "Outdoor",
    "Outdoor",
    "+1",
  ];

  @override
  Widget build(BuildContext context) {
    var notify = Row(
      children: [
        const Text('Mute notification',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        const Spacer(),
        Switch(
          value: value,
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
        ),
      ],
    );
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels ==
            notification.metrics.maxScrollExtent) {
          setState(() {
            isScrolled = true;
          });
        }
        if (notification.metrics.pixels ==
            notification.metrics.minScrollExtent) {
          setState(() {
            isScrolled = false;
          });
        }
        return false;
      },
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 300,
              flexibleSpace: const FlexibleSpaceBar(background: Imagewidget()),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: AppIntroWidget(
                    isScrolled: isScrolled,
                  )),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ReadMoreText(
                      lorem,
                      trimMode: TrimMode.Line,
                      trimLines: 5,
                      moreStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GenreWidget(listtext: listtext),
                    const SizedBox(
                      height: 10,
                    ),
                    const MediaWidgets(),
                    const MediaImage(),
                    const SizedBox(
                      height: 10,
                    ),
                    notify,
                    const Settings(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Members',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    const Spacer(),

                    // search functionality
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                              radius: 30,
                            ),
                            title: const Text('John Doe'),
                            subtitle: const Text('29,India'),
                            trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isPressed[index]
                                    ? Colors.grey
                                    : const Color.fromARGB(255, 225, 11, 125),
                              ),
                              onPressed: () {
                                setState(() {
                                  isPressed[index] = !isPressed[index];
                                });
                              },
                              child: Text(
                                isPressed[index] ? 'Following' : 'Add',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
