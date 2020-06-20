import 'package:flutter/material.dart';
import 'package:nubank/page/widgets/cards/card_app.dart';
import 'package:nubank/page/widgets/cards/first_card.dart';
import 'package:nubank/page/widgets/cards/second_card.dart';
import 'package:nubank/page/widgets/cards/third_card.dart';

class PageViewApp extends StatefulWidget {
  final double top;
  final ValueChanged<int> onChenged;
  final GestureDragUpdateCallback onPanUpdate;
  final bool showMenu;
  const PageViewApp(
      {Key key, this.top, this.onChenged, this.onPanUpdate, this.showMenu})
      : super(key: key);

  @override
  _PageViewAppState createState() => _PageViewAppState();
}

class _PageViewAppState extends State<PageViewApp> {
  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 0.0);
  }

  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: _tween,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOutExpo,
        builder: (context, value, child) {
          return AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
            top: widget.top,
            height: MediaQuery.of(context).size.height * 0.55,
            left: value,
            right: value * -1,
            child: GestureDetector(
              onPanUpdate: widget.onPanUpdate,
              child: PageView(
                onPageChanged: widget.onChenged,
                physics: widget.showMenu
                    ? NeverScrollableScrollPhysics()
                    : BouncingScrollPhysics(),
                children: <Widget>[
                  CardApp(
                    child: FirstCard(),
                  ),
                  CardApp(
                    child: SecondCard(),
                  ),
                  CardApp(
                    child: ThirdCard(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
