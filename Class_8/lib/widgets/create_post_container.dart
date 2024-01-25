import 'package:flutter/material.dart';
import 'package:social_media_app/widgets/new_post_container.dart';

import '../models/user_model.dart';
import 'profile_avatar.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(width: 8.0),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => NewPostContainer());
                  },
                  child: const Text("What's on your mind?")),
            ],
          ),
          const Divider(
            height: 10.0,
            thickness: 0.6,
            color: Colors.blue,
          ),
          SizedBox(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => print("Live"),
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: const Text(
                    "Live",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const VerticalDivider(width: 8.0, thickness: 0.8),
                TextButton.icon(
                  onPressed: () => print("Photo"),
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: const Text(
                    "Photo",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const VerticalDivider(width: 8.0, thickness: 0.8),
                TextButton.icon(
                  onPressed: () => print("Room"),
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: const Text(
                    "Room",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
