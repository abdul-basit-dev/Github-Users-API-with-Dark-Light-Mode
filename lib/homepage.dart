import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_details.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://api.github.com/users";
  late List data;

  var isLoading = false;
  bool isAdmin = true;

  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      Uri.parse(url),
    );
    //print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson;
      isLoading = true;
    });

    throw Exception('Failed to load data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            if (isLoading == true) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (isLoading == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetails(
                              login: data[index]['login'],
                              isAdmin: data[index]['site_admin'],
                              avatarUrl: data[index]['avatar_url'],
                              url: data[index]['url'],
                            ),
                          ),
                        );
                      }
                    },
                    child: Card(
                      color: Colors.black87,
                      shadowColor: Colors.deepPurpleAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 37.0,
                                    backgroundColor: Colors.deepPurple,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 35.0,
                                      backgroundImage: NetworkImage(
                                          data[index]['avatar_url']),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      data[index]['login'],
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      data[index]['url'],
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 24.0),
                                  child: Icon(
                                    Icons.circle,
                                    color: (isAdmin = data[index]['site_admin'])
                                        ? Colors.green
                                        : Colors.redAccent,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );

                  // By default, show a loading spinner.
                },
              );
            } else if (isLoading = false) {
              return const CircularProgressIndicator();
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
