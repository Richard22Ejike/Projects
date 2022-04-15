import 'package:flutter/material.dart';
import 'package:searchme/widgets/linktext.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultComponent extends StatefulWidget {
  final String linkToGo;
  final String link;
  final String text;
  final String desc;
  const SearchResultComponent({
    Key? key,
    required this.linkToGo,
    required this.link,
    required this.text,
    required this.desc,
      }) : super(key: key);

  @override
  State<SearchResultComponent> createState() => _SearchResultComponentState();
}

class _SearchResultComponentState extends State<SearchResultComponent> {
  bool _showUnderline = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // showing the link at the top first
        Text(
          widget.link,
        ),
        // showing the text to display as header with link
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,

            onTap: () async{
              if (await canLaunch(widget.linkToGo)){
                await launch(widget.linkToGo,);
              }
            },
            onHover: (hovering){
              setState((){
                _showUnderline = hovering;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              Text(
                widget.link,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF202124,),
                ),
              ),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    decoration: _showUnderline ? TextDecoration.underline: TextDecoration.none
                  ),
                ),




              ],

            )

          ),
        ),
        // showing the meta data or the description of the wbesite
        Text(
          widget.desc,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}