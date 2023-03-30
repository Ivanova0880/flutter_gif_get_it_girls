import 'package:flutter/material.dart';
import 'package:flutter_gif_get/data/fetch_helper.dart';

class GifScreen extends StatefulWidget {
  const GifScreen({super.key});

  @override
  State<GifScreen> createState() => _GifScreenState();
}

class _GifScreenState extends State<GifScreen> {
  final FetchHelper fetchHelper = FetchHelper();
  List<String> images = [];

  @override
  void initState() {
    fetchHelper.fetchImages().then((value) {
      setState(() {
        images = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GIF'),
      ),
      body: GridView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.network(images[index]);
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}
