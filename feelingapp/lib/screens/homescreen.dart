import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:emojis/emoji.dart';
import 'package:feelingapp/models/feelinginfo.dart';
import 'package:feelingapp/services/httpservices.dart';
import 'package:feelingapp/utils/globalstyle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalStyle _globalStyle = GlobalStyle();
  HttpServices _httpServices = HttpServices();
  DateTime now = DateTime.now();

  var feelingList = [
    {
      "name": "Energetic",
      "image": "assets/energetic.png",
    },
    {
      "name": "Sad",
      "image": "assets/sad.png",
    },
    {
      "name": "Happy",
      "image": "assets/smile.png",
    },
    {
      "name": "Angry",
      "image": "assets/angry.png",
    },
    {
      "name": "Calm",
      "image": "assets/calm.png",
    },
    {
      "name": "Bored",
      "image": "assets/bored.png",
    },
    {
      "name": "Love",
      "image": "assets/love.png",
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _globalStyle.color3,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: _globalStyle.color3,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black87,
        ),
        title: const Text(
          "Your Feeling History",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _httpServices.getFeelingData(feelingDate: "15-04-20"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            FeelingValue feelingValue = FeelingValue.fromJson(
              snapshot.data["data"]["feeling_percentage"],
            );

            VideoInfo videoInfo =
                VideoInfo.fromJson(snapshot.data["data"]["video_arr"][0]);
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Text(
                      "Your feelings from last 30 days",
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: feelingList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    50.0,
                                  ),
                                ),
                                color: _globalStyle.color2,
                                child: SizedBox(
                                  height: 130,
                                  width: 60,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 20,
                                        left: 60 / 2 - 18,
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            "${index == 0 ? feelingValue.energetic : index == 1 ? feelingValue.sad : index == 2 ? feelingValue.happy : index == 3 ? feelingValue.angry : index == 4 ? feelingValue.calm : index == 5 ? feelingValue.bored : 0.toString()}%",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: CircleAvatar(
                                          backgroundColor: _globalStyle.color1,
                                          radius: 30.0,
                                          child: Image.asset(
                                              feelingList[index]["image"]!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  feelingList[index]["name"]!,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                    thickness: 2.0,
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${DateFormat.yMMMd().format(now)}",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: DatePicker(
                        DateTime.now(),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: Colors.grey,
                        selectedTextColor: Colors.white,
                        onDateChange: (date) {
                          // New date selected
                          setState(() {
                            now = date;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                    thickness: 2.0,
                    height: 1,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "9AM - 12PM",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Image.asset(
                          feelingList[6]["image"]!,
                          height: 20.0,
                          width: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            feelingList[6]["name"]!,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "1PM - 4PM",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Image.asset(
                          feelingList[3]["image"]!,
                          height: 20.0,
                          width: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            feelingList[3]["name"]!,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "4PM- 6PM",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          width: 75,
                        ),
                        Image.asset(
                          feelingList[5]["image"]!,
                          height: 20.0,
                          width: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            feelingList[5]["name"]!,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                    thickness: 2.0,
                    height: 1,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Text(
                      videoInfo.title,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      videoInfo.description,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: videoSection(videoInfo.youtubeUrl),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: _globalStyle.color1,
            ),
          );
        },
      ),
    );
  }

  Widget videoSection(String ytUrl) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(ytUrl)!,
                  ),
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(isExpanded: true),
                  ],
                  showVideoProgressIndicator: true,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
