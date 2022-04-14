import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/screen/newspage.dart';
import 'package:news_app/service/data_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: NetworkImage(
                  'https://media-exp1.licdn.com/dms/image/C4E03AQHOjsK-JalSBw/profile-displayphoto-shrink_200_200/0/1636600964813?e=1652918400&v=beta&t=ldWQQfw78ZFsQcFGlCUCpi-D25P5vwk4qSC4tdVRGxY'),
            ),
          ),
          width: 10,
          margin: EdgeInsets.all(5),
        ),
        title: Text(
          'News App',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            color: Colors.blue,
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) => snapshot.data != null 
        ? NewsPage(snapshot.data as List<Article>)
        : Center(child: CircularProgressIndicator()),
        future: news.getNews(),)  ,
    );
  }
}
