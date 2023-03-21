import 'package:biddabd/Data/skill_development_course.dart';
import 'package:biddabd/Widgets/custom_silver.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SkillCoursePlaylist extends StatefulWidget {

  final SkillDevelopmentCourse? lecture;
  SkillCoursePlaylist({this.lecture});



  @override
  State<SkillCoursePlaylist> createState() => _SkillCoursePlaylistState();
}

class _SkillCoursePlaylistState extends State<SkillCoursePlaylist> {
  late YoutubePlayerController _controller;
  @override

  void initState() {
    super.initState();
    final videoID=YoutubePlayer.convertUrlToId(widget.lecture!.skillLink.toString());
    _controller=YoutubePlayerController(
        initialVideoId: videoID!,
        flags: YoutubePlayerFlags(
            autoPlay: false,
            enableCaption: true,
            isLive: false


        )
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        slivers: <Widget>[
          CustomSilver(title: widget.lecture!.skillTitle,
            onpress: (){
              Navigator.of(context).pop();
            },iconDataled: Icons.arrow_back_outlined,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,

                      bottomActions: [
                        CurrentPosition(),
                        ProgressBar(
                          isExpanded: true,
                          colors: ProgressBarColors(
                            playedColor: Colors.deepPurple,
                            handleColor: Colors.amberAccent,

                          ),

                        ),
                        PlaybackSpeedButton(),

                      ],

                    ),

                    SizedBox(height: 20,),
                    _text("Description","A syllabus a requisite document for teaching "
                        "in that it serves to outline the basic elements of a course including "
                        "what topics will be covered, a weekly schedule, and a list of tests,"
                        " assignments, and their associated weightings.",25),

                  ],



                ),
              ),childCount: 1,
              //ListTile

            ), //SliverChildBuildDelegate
          )
          //CustomTextFieldForm(),
        ],
      ),
    );
  }
}
Widget _text(String title, String value, double size) {
  return RichText(
    text: TextSpan(
      text: '$title : ',
      style:  TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
      children: [
        TextSpan(
          text: value,
          style:  TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}