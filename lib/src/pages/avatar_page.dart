import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AvatarPage'),
        actions: [
          Container(
            padding: const EdgeInsets.all(5),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/b0/e9/11/b0e91175f0772af0f80ab3a544587443.jpg'),
              radius: 30.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text('HD'),
            ),
          ),
        ],
      ),
      body: const Center(
        // imaen con una de precarga
        child: FadeInImage(
          fadeInDuration: Duration(milliseconds: 200),
          // imagen de precarga
          placeholder: AssetImage('assets/jar-loading.gif'),
          // imagen real 
          image: NetworkImage(
              'https://i.pinimg.com/736x/b0/e9/11/b0e91175f0772af0f80ab3a544587443.jpg'),
        ),
      ),
    );
  }
}
