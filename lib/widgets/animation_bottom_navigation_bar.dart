import 'package:flutter/material.dart';

class AnimationBottomNavigationBar extends StatefulWidget {
  AnimationBottomNavigationBar({
    Key key,
    @required this.items,
    this.duration = const Duration(milliseconds: 200),
    this.currentIndex = 0,
  }) : super(key: key);

  final List<AnimationBottomNavigationBarItem> items;
  final Duration duration;
  int currentIndex;

  _AnimationBottomNavigationBarState createState() => _AnimationBottomNavigationBarState();
}

class _AnimationBottomNavigationBarState extends State<AnimationBottomNavigationBar> with TickerProviderStateMixin {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          for (var index = 0; index < widget.items.length; index++)
            GestureDetector(
              onTap: () => setState(() {
                widget.currentIndex = index;
                _currentIndex = index;
              }),
              child: AnimatedSize(
                vsync: this,
                duration: widget.duration,
                curve: Curves.decelerate,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Color(0xFF444A63) : Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        widget.items[index].icon,
                        color: _currentIndex == index ? Colors.white : Color(0xFF65638B),
                      ),
                      SizedBox(width: _currentIndex == index ? 8 : 0),
                      Text(
                        _currentIndex == index ? widget.items[index].title : '',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class AnimationBottomNavigationBarItem {
  AnimationBottomNavigationBarItem({this.title, this.icon});

  final String title;
  final IconData icon;
}
