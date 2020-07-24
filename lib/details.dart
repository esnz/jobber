import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobber/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';

class Details extends StatefulWidget {
  final JobItem jobItem;
  Details({Key key, this.jobItem}) : super(key: key);

  @override
  _Details createState() => _Details(this.jobItem);
}

class _Details extends State<Details> {
  JobItem jobItem;
  _Details(this.jobItem);

  @override
  void initState() {
    super.initState();
  }

  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: 300,
            padding: EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 40),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(1.12, 0.66),
                end: Alignment(-1.37, -1.25),
                colors: [const Color(0xffd94949), const Color(0xffd62d82)],
                stops: [0.0, 1.0],
              ),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Material(
                      type: MaterialType.button,
                      color: Colors.transparent,
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    Text(
                      'Job Details',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 170),
            height: screenSize.height,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70.0),
                  topRight: Radius.circular(70.0),
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
              child: Container(
                padding: EdgeInsets.only(top: 80),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        jobItem.title,
                        style: TextStyle(
                          fontSize: 22,
                          color: const Color(0xff555555),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      width: double.infinity,
                      child: Text(
                        jobItem.type,
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff81b238),
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: SvgPicture.string(
                              '<svg viewBox="19.0 262.1 10.9 10.9" ><path transform="translate(15.0, 258.13)" d="M 7.951505184173584 4 C 7.405703544616699 4 6.963628768920898 4.442074775695801 6.963628768920898 4.987876415252686 L 6.963628768920898 14.86663913726807 L 11.90301036834717 14.86663913726807 L 11.90301036834717 4.987876415252686 C 11.90301036834717 4.442074775695801 11.46093559265137 4 10.91513347625732 4 L 7.951505184173584 4 Z M 5.975752830505371 4.987876415252686 L 4 5.975752830505371 L 4 14.86663913726807 L 5.975752830505371 14.86663913726807 L 5.975752830505371 4.987876415252686 Z M 12.8908863067627 5.975752830505371 L 12.8908863067627 14.86663913726807 L 14.86663913726807 14.86663913726807 L 14.86663913726807 6.963628768920898 C 14.86663913726807 6.417827606201172 14.42456436157227 5.975752830505371 13.87876224517822 5.975752830505371 L 12.8908863067627 5.975752830505371 Z" fill="#999999" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                              width: 20,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, left: 10),
                            child: Text(
                              jobItem.company,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: const Color(0xff555555),
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 22),
                            child: SvgPicture.string(
                              '<svg viewBox="133.0 262.9 8.4 12.7" ><path transform="translate(124.0, 261.88)" d="M 13.22134971618652 1 C 10.89425086975098 1 9.000000953674316 2.894248962402344 9.000000953674316 5.221349716186523 C 9.000000953674316 8.94492244720459 12.8596076965332 13.38578224182129 13.02347373962402 13.57336902618408 C 13.07397174835205 13.63107013702393 13.14507579803467 13.66404724121094 13.22134971618652 13.66404724121094 C 13.30276870727539 13.65890407562256 13.368727684021 13.63107013702393 13.41922569274902 13.57336902618408 C 13.58309268951416 13.3826961517334 17.44269943237305 8.865560531616211 17.44269943237305 5.221349716186523 C 17.44269943237305 2.894248962402344 15.54844856262207 1 13.22134971618652 1 Z M 13.22134971618652 3.902177572250366 C 14.09529972076416 3.902177572250366 14.80435562133789 4.611232280731201 14.80435562133789 5.485183715820313 C 14.80435562133789 6.359134674072266 14.09529972076416 7.06818962097168 13.22134971618652 7.06818962097168 C 12.34739971160889 7.06818962097168 11.63834381103516 6.359134674072266 11.63834381103516 5.485183715820313 C 11.63834381103516 4.611232280731201 12.34739971160889 3.902177572250366 13.22134971618652 3.902177572250366 Z" fill="#999999" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                              width: 16,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, left: 13),
                            child: Text(
                              jobItem.location,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: const Color(0xff777777),
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Html(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  data: jobItem.description,
                                  defaultTextStyle: TextStyle(
                                      fontSize: 16,
                                      color: const Color(0xff555555),
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 120),
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(this.jobItem.companyLogo),
                    backgroundColor: Colors.white,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  TextField searchTextField() {
    return TextField(
      autofocus: false,
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontSize: 18,
        color: const Color(0xff666666),
      ),
      onChanged: (text) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        hintText: 'Search',
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 18,
        ),
        contentPadding:
            EdgeInsets.only(left: 15, right: 15, top: 11, bottom: 11),
      ),
    );
  }
}
