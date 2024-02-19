import 'package:flutter/material.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activities"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.format_list_bulleted_sharp)),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
