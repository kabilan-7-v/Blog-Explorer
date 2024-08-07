import 'package:blog_explorer/utility/description.dart';
import 'package:flutter/material.dart';

class DetailBlocView extends StatelessWidget {
  const DetailBlocView({super.key, required this.tittle, required this.imgurl});
  final String tittle;
  final String imgurl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(tittle),
      ),
      body: Column(
        children: [
          Image.network(imgurl),
          Text(des1),
        ],
      ),
    );
  }
}
