import 'package:flutter/material.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Social Media',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // height: 100,
                      child: Card(
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                  child: Text('U'),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                    child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'What\'s on your mind ?'),
                                ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Row(
                                      children: [
                                        Text('Live'),
                                        Icon(Icons.videocam),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Row(
                                      children: [
                                        Text('Photo'),
                                        Icon(Icons.photo),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Row(
                                      children: [
                                        Text('Camera'),
                                        Icon(Icons.camera),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
