import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uplabs_meditation_app/feature/feature_screen.dart';
import 'package:uplabs_meditation_app/widgets/animation_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildAppbar(title: 'Discover', onSearchButtonPressed: () {}),
          _buildChips(),
          _buildFeatured(screenWidth),
          _buildRecommended(),
          _buildMyCourses(screenWidth),
        ],
      ),
      bottomNavigationBar: AnimationBottomNavigationBar(
        items: <AnimationBottomNavigationBarItem>[
          AnimationBottomNavigationBarItem(title: 'Home', icon: Icons.home),
          AnimationBottomNavigationBarItem(title: 'Explore', icon: Icons.explore),
          AnimationBottomNavigationBarItem(title: 'Setting', icon: Icons.settings),
          AnimationBottomNavigationBarItem(title: 'Profile', icon: Icons.portrait),
        ],
      ),
    );
  }

  Widget _buildAppbar({String title, Function onSearchButtonPressed}) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      ),
      trailing: IconButton(
        icon: Icon(Icons.search),
        iconSize: 28,
        onPressed: onSearchButtonPressed,
      ),
    );
  }

  Widget _buildChips() {
    final labels = ['Sleep', 'Peace', 'Focus', 'Body Scan'];

    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            for (var label in labels)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Chip(
                  label: Text(
                    label,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatured(double screenWidth) {
    final titles = ['Body Scan', 'Add Some Joy'];
    final subTitles = ['5 MIN • MEDITATION', '5 MIN • RXERCISE'];
    final deses = ['Bring mind and body together', 'find a new sense of gratitude by reflecting on the people and things you appreciate'];
    final gradientColors = [
      [Color(0xFF8466FE), Color(0xFF6575FE)],
      [Color(0xFFF97DC4), Color(0xFFF9B77D)]
    ];

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Row(
            children: <Widget>[
              Text('Featured', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              Spacer(),
              Text('More', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              Transform.rotate(
                angle: pi / 2,
                child: Icon(
                  Icons.expand_less,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 175,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => SizedBox(width: 16),
            scrollDirection: Axis.horizontal,
            itemCount: titles.length,
            itemBuilder: (BuildContext context, int index) {
              final title = titles[index];
              final subTitle = subTitles[index];

              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/feature',
                    arguments: FeatureArguments(title: title, subTitle: subTitle),
                  );
                },
                child: Container(
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: gradientColors[index]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: title,
                          child: DefaultTextStyle(
                            child: Text(title),
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                        SizedBox(height: 8),
                        Hero(
                          tag: subTitle,
                          child: DefaultTextStyle(
                            child: Text(subTitle),
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(deses[index], style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.8))),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecommended() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Recommeded',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF393F57),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text('Managing Anxiety', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              subtitle: Text('Experience anxious thoughts form a new perspective', style: TextStyle(fontSize: 10, color: Colors.white.withOpacity(0.8))),
              trailing: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF6694FE),
                      Color(0xFF6560FF),
                    ],
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    customBorder: CircleBorder(),
                    child: Icon(Icons.play_arrow),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyCourses(double screenWidth) {
    final titles = ['Focus', 'Sleep', 'Stress'];
    final values = [7, 3, 1];
    final gradientColors = [
      [Color(0xFFF97DB7), Color(0xFFFFBD4B)],
      [Color(0xFF606BFF), Color(0xFF58D1FF)],
      [Color(0xFFC840E9), Color(0xFF398FFF)]
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Text('My Courses', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 164,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: titles.length,
            itemBuilder: (BuildContext context, int index) {
              final value = values[index];
              return Container(
                width: screenWidth * 0.35,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors[index],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 72),
                        child: Text(titles[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(
                        height: 4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.white.withOpacity(0.3),
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                            value: value / 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('$value of 10', style: TextStyle(fontSize: 10))
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
