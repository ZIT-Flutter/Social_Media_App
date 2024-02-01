import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/models/models.dart';
import 'package:social_media_app/widgets/stories.dart';

import 'config/palette.dart';
import 'models/post_model.dart';
import 'widgets/circle_button.dart';
import 'widgets/create_post_container.dart';
import 'widgets/post_container.dart';
// ignore: unused_import
import 'widgets/rooms.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream<QuerySnapshot> dataStream =
      FirebaseFirestore.instance.collection('post').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "facebook",
                style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
              centerTitle: false,
              floating: true,
              actions: [
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30.0,
                  iconColor: Colors.black,
                  onPressed: () => print("search"),
                ),
                CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30.0,
                  iconColor: Colors.black,
                  onPressed: () async {},
                ),
              ],
            ),
            const SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser),
            ),
            // SliverPadding(
            //   padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            //   sliver: SliverToBoxAdapter(
            //     child: Rooms(onlineUsers: onlineUsers),
            //   ),
            // ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
              sliver: SliverToBoxAdapter(
                child: Stories(
                  currentUser: currentUser,
                  stories: stories,
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: dataStream,
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

                  // print(documents.first.data());

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        var docMap =
                            documents[index].data() as Map<String, dynamic>;

                        // print(docMap['likes']);

                        final Post post = Post.fromMap(docMap);
                        return PostContainer(post: post);
                      },
                      childCount: documents.length,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
