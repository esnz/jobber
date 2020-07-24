import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobber/details.dart';
import 'package:jobber/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  Future<List<JobItem>> getJobsFromApi;

  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    getJobsFromApi = fetchJobs('');
  }

  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: key,
      drawer: Container(
        width: 300,
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Jobber',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'By Ehsan Azizi',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: 300,
            padding: EdgeInsets.only(top: 50, left: 20, right: 10, bottom: 40),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Find your dream job',
                            style: TextStyle(
                              fontSize: 22,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              'Your professional career starts here',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 12,
                                color: const Color(0xffd9d9d9),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      ),
                    ),
                    Material(
                      type: MaterialType.button,
                      color: Colors.transparent,
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          key.currentState.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(114.0),
                    color: const Color(0xffffffff),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: <Widget>[
                            SvgPicture.string(
                              '<svg viewBox="34.0 107.0 20.2 20.7" ><path transform="translate(30.0, 104.0)" d="M 12.05015182495117 2.999999761581421 C 7.599649429321289 2.999999761581421 4 6.599649429321289 4 11.05015182495117 C 4 15.50065612792969 7.599649429321289 19.10030174255371 12.05015182495117 19.10030174255371 C 13.63910961151123 19.10030174255371 15.10963439941406 18.63415336608887 16.35641479492188 17.84249305725098 L 22.17203521728516 23.65811157226563 L 24.18457221984863 21.64557456970215 L 18.44291877746582 15.91874027252197 C 19.47509002685547 14.56470680236816 20.10030364990234 12.88696002960205 20.10030364990234 11.05015182495117 C 20.10030364990234 6.599649429321289 16.50065422058105 2.999999761581421 12.05015182495117 2.999999761581421 Z M 12.05015182495117 4.894153594970703 C 15.45924854278564 4.894153594970703 18.20615005493164 7.641055107116699 18.20615005493164 11.05015182495117 C 18.20615005493164 14.45924854278564 15.45924854278564 17.20614814758301 12.05015182495117 17.20614814758301 C 8.641054153442383 17.20614814758301 5.894153594970703 14.45924854278564 5.894153594970703 11.05015182495117 C 5.894153594970703 7.641055107116699 8.641054153442383 4.894153594970703 12.05015182495117 4.894153594970703 Z" fill="#b2b2b2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                              width: 25,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 115,
                              child: searchTextField(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            height: screenSize.height,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70.0),
                  topRight: Radius.circular(0.0),
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: jobsData,
              ),
            ),
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
      onChanged: (text) {
        _debouncer.run(() => setState(() {
              getJobsFromApi = fetchJobs(text);
            }));
      },
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

  Future<List<JobItem>> fetchJobs(String search) async {
    final response = await http.get(
        'https://jobs.github.com/positions.json?description=$search&page=1');

    if (response.statusCode == 200) {
      var data = List<JobItem>();
      for (var value in (json.decode(response.body) as List)) {
        data.add(JobItem.fromJson(value));
      }
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  FutureBuilder get jobsData => FutureBuilder<List<JobItem>>(
        future: getJobsFromApi,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xffd94949))),
            );
          }
          if (snapshot.hasData && snapshot.data.length == 0) {
            return Center(
              child: Text(
                "No results found",
                style: TextStyle(fontSize: 18),
              ),
            );
          } else if (snapshot.hasData) {
            return Scrollbar(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: false,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return jobPost(context, index, snapshot.data[index]);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error occurred"),
            );
          }
          return Center();
        },
      );

  Widget jobPost(BuildContext context, int index, JobItem jobItem) {
    return FlatButton(
      highlightColor: Color(0xffdddddd),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 3),
                    child: Text(
                      jobItem.title,
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xff555555),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Text(
                          jobItem.company,
                          style: TextStyle(
                            fontSize: 15,
                            color: const Color(0xff9b9b9b),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text(
                            jobItem.location,
                            style: TextStyle(
                                fontSize: 12,
                                color: const Color(0xff81b238),
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(
                      jobItem: jobItem,
                    )));
      },
    );
  }
}
