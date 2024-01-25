import 'dart:io';

import 'package:flutter/material.dart';

class NewPostContainer extends StatefulWidget {
  const NewPostContainer({super.key});

  @override
  State<NewPostContainer> createState() => _NewPostContainerState();
}

class _NewPostContainerState extends State<NewPostContainer> {
  var postTextController = TextEditingController();

  File? imagefile;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.9,
      initialChildSize: 0.6,
      minChildSize: 0.0,
      builder: (context, scrollController) => Container(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(children: [
                  InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 23,
                      child: Icon(Icons.person),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Tahsin Sakib",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  )
                ]),
                const Divider(),
                TextField(
                  controller: postTextController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: "What\'s in your mind ?",
                    hintStyle: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      image: imagefile != null
                          ? DecorationImage(
                              image: FileImage(
                                imagefile!,
                              ),
                              fit: BoxFit.cover)
                          : null),
                  child: imagefile == null
                      ? const Center(child: Text('No Image'))
                      : null,
                ),
                const card(
                    icontitle: "Photo/Video",
                    selectephoto: Icons.photo_library,
                    iconcolor: Colors.green),
                const Divider(),
                const card(
                    icontitle: "Photo/Video",
                    selectephoto: Icons.person,
                    iconcolor: Colors.blue),
                const Divider(),
                const card(
                    icontitle: "Photo/Video",
                    selectephoto: Icons.location_on,
                    iconcolor: Colors.red),
                const Divider(),
                const card(
                    icontitle: "Photo/Video",
                    selectephoto: Icons.sentiment_satisfied,
                    iconcolor: Colors.amber),
                const Divider(),
                const card(
                    icontitle: "Photo/Video",
                    selectephoto: Icons.video_call,
                    iconcolor: Color.fromARGB(255, 250, 52, 38)),
                const Divider(),
                ElevatedButton(
                    onPressed: () {
                      print(postTextController.text);
                    },
                    child: const Text('Post'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class card extends StatelessWidget {
  final IconData selectephoto;
  final String icontitle;
  final Color iconcolor;
  const card({
    super.key,
    required this.icontitle,
    required this.selectephoto,
    required this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              selectephoto,
              color: iconcolor,
              size: 25,
            )),
        Text(
          icontitle,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
