import 'package:flutter/material.dart';
import 'package:musicplayer/Services/ApiService.dart';
import 'package:musicplayer/Model/MusicDataResponse.dart';
import 'MusicDetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MusicDataResponse> musicList = [];

  @override
  void initState() {
    super.initState();
    fetchMusicData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Music App"),
        ),
        body: customListCard());
  }

  Future<void> fetchMusicData() async {
    final musiclist = await ApiService().getAllFetchMusicData();
    setState(() {
      musicList = musiclist;
    });
  }

  Widget customListCard() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MusicDetailPage(response: musicList[index]),
                ));
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, bottom: 8, right: 8, top: 4),
                  child: SizedBox(
                    child: FadeInImage.assetNetwork(
                        height: 60,
                        width: 60,
                        placeholder: "album_img/cuisinier1.jpg",
                        image: musicList[index].picture.toString(),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      musicList[index].title.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      musicList[index].creator.toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      itemCount: musicList.length,
    );
  }
}