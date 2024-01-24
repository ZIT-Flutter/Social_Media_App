import 'package:flutter/material.dart';

class NewPostContainer extends StatelessWidget {
  const NewPostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.9,
      initialChildSize: 0.8,
      minChildSize: 0.3,
      builder: (context, scrollController) => Container(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
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
              ),
              const Divider(),
              const TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "what\'s your mind ?",
                  hintStyle: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
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
            ],
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
