import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';

class DetailPage extends StatefulWidget {
  final String title_movie;
  final String release_date;
  final String rating_movie;
  final String review_movie;
  final bool watched_status;

  const DetailPage(
      {Key? key,
      required this.title_movie,
      required this.release_date,
      required this.rating_movie,
      required this.review_movie,
      required this.watched_status})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Detail'),
      ),
      drawer: const MyDrawerPage(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: prefer_const_constructors
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.title_movie,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                // ignore: prefer_const_constructors
                Text(
                  "Release Date: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
                Text(
                  widget.release_date,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                // ignore: prefer_const_constructors
                Text(
                  "Rating: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
                Text(
                  "${widget.rating_movie}/10",
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                // ignore: prefer_const_constructors
                Text(
                  "Staus: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
                Text(
                  widget.watched_status ?
                    "Watched"
                    : "Haven't Watch",
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            ),
            // ignore: prefer_const_constructors
            Text(
              "Review: ",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              widget.review_movie,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
