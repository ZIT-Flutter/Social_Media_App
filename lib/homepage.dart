import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:social_media_app/data/data.dart';

import 'config/palette.dart';
import 'widgets/circle_button.dart';
import 'widgets/create_post_container.dart';
import 'widgets/rooms.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  onPressed: () => print("messenger"),
                ),
              ],
            ),
            const SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              sliver: SliverToBoxAdapter(
                child: Rooms(onlineUsers: onlineUsers),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
