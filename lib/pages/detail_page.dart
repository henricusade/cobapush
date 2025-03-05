import 'package:flutter/material.dart';
import 'package:praktikum3/model/game_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Game")),
      body: ListView(
        children: [
          Image.network(gameList[widget.index].imageUrls[0]),
          Text(
            gameList[widget.index].name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(gameList[widget.index].about),
          SizedBox(height: 8),
          Text(gameList[widget.index].price),
          ElevatedButton(
            onPressed: () async {
              if (!await launchUrl(
                Uri.parse(gameList[widget.index].linkStore),
              )) {
                throw Exception("halaman gagal di akses");
              }
            },
            child: Text("go to store"),
          ),
        ],
      ),
    );
  }
}
