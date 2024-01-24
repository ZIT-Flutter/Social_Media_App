import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/config/palette.dart';

import '../models/models.dart';
import 'profile_avatar.dart';

class Rooms extends StatefulWidget {
  final List<User> onlineUsers;

  const Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: StreamBuilder<QuerySnapshot>(
          stream: getUserStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const SliverToBoxAdapter(
                  child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SliverToBoxAdapter(
                  child: Center(child: Text('Loading...')));
            }

            // Data is available
            List<DocumentSnapshot> documents = snapshot.data!.docs;

            return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  var userDocMap =
                      documents[index].data() as Map<String, dynamic>;

                  print(userDocMap);

                  // if (index == 0) {
                  //   return const Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 8.0),
                  //     child: _CreateRoomButton(),
                  //   );
                  // }

                  final User user = User(
                      name: userDocMap['name'], imageUrl: userDocMap['image']);

                  //  onlineUsers[index - 1];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ProfileAvatar(
                      imageUrl: user.imageUrl,
                      isOnline: true,
                    ),
                  );
                });
          }),
    );
  }

  Stream<QuerySnapshot> getUserStream() {
    var userSnap =
        FirebaseFirestore.instance.collection('user_data').snapshots();
    return userSnap;
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print("Create Room"),
      style: OutlinedButton.styleFrom(
        foregroundColor: Palette.facebookBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          //side: const BorderSide(width: 3, color: Colors.blueAccent),
        ),
        side: BorderSide(width: 3, color: Colors.blueAccent[200]!),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          const Text("Create\nRoom"),
        ],
      ),
    );
  }
}
