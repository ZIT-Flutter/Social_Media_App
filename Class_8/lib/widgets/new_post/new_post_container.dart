import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/widgets/new_post/post_card.dart';

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
                      ? const Center(
                          child: Text('No Image'),
                        )
                      : null,
                ),
                PostCard(
                  icontitle: "Photo/Video",
                  selectephoto: Icons.photo_library,
                  iconcolor: Colors.green,
                  onClick: () async {
                    imagefile = await pickImage();

                    setState(() {});
                  },
                ),
                const Divider(),
                const PostCard(
                    icontitle: "Tag",
                    selectephoto: Icons.person,
                    iconcolor: Colors.blue),
                const Divider(),
                const PostCard(
                    icontitle: "Location",
                    selectephoto: Icons.location_on,
                    iconcolor: Colors.red),
                const Divider(),
                const PostCard(
                    icontitle: "Feelings",
                    selectephoto: Icons.sentiment_satisfied,
                    iconcolor: Colors.amber),
                const Divider(),
                const PostCard(
                    icontitle: "Camera",
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

  Future<File?> pickImage() async {
    // final picker = ImagePicker();

    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }
}
