import 'package:flutter/material.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({Key key}) : super(key: key);

  @override
  _FeatureScreenState createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> with TickerProviderStateMixin {
  bool _isDownload = false;

  @override
  Widget build(BuildContext context) {
    final FeatureArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildAppbar(context),
          _buildBanner(),
          _buildContent(args),
          _buildDownloadInfo(),
          _buildBeginButton(),
        ],
      ),
    );
  }

  Widget _buildAppbar(BuildContext context, {String title, Function onSearchButtonPressed}) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 16),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        iconSize: 28,
        onPressed: onSearchButtonPressed,
      ),
    );
  }

  Widget _buildBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Image.asset('images/artwork.png'),
    );
  }

  Widget _buildContent(FeatureArguments args) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: args.title,
            child: DefaultTextStyle(
              child: Text(args.title + ' '),
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Hero(
            tag: args.subTitle,
            child: DefaultTextStyle(
              child: Text(args.subTitle + ' '),
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Is there room for a little more joy in your day? Lots of people say that just thinking about what they're grateful for makes them feel happier and less anxious. On this walk, find a new sense of gratitude by reflecting on the people and things you appreciate.",
            style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadInfo() {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      title: Text('Download Exercise', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      subtitle: Text('10MB', style: TextStyle(fontSize: 12)),
      trailing: Switch(
        inactiveTrackColor: Color(0xFF414454),
        inactiveThumbColor: Colors.white,
        value: _isDownload,
        onChanged: (value) => setState(() => _isDownload = value),
      ),
    );
  }

  Widget _buildBeginButton() {
    final borderRadius = BorderRadius.circular(100);
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: LinearGradient(
            colors: [
              Color(0xFF8466FE),
              Color(0xFF6575FE),
            ],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: borderRadius,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Icon(Icons.play_arrow), SizedBox(width: 8), Text('BEGIN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))],
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureArguments {
  FeatureArguments({this.title, this.subTitle});

  final String title;
  final String subTitle;
}
