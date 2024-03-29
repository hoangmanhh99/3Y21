import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/gen.dart';
import '../../utils/app_constants.dart';

class AppBottomNavigation extends StatefulWidget {
  final PageController pageController;
  const AppBottomNavigation({Key? key, required this.pageController})
      : super(key: key);

  @override
  _AppBottomNavigationState createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      setState(() {
        currentIndex = widget.pageController.page!.toInt();
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2,
      child: SafeArea(
        child: Container(
          height: 56,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: BottomNavigationItem(
                  widget.pageController,
                  index: 0,
                  icon: (currentIndex == 0)
                      ? Assets.icons.icHomeSelected
                      : Assets.icons.icHomeUnselected,
                  title: 'Home',
                  currentIndex: currentIndex,
                ),
              ),
              Expanded(
                child: BottomNavigationItem(
                  widget.pageController,
                  index: 1,
                  icon: (currentIndex == 1)
                      ? Assets.icons.icDeviceSelected
                      : Assets.icons.icDeviceUnselected,
                  title: 'Led',
                  currentIndex: currentIndex,
                ),
              ),
              // Expanded(
              //     child: GestureDetector(
              //   onTap: () {
              //     // Navigator.pushNamed(context, ArPage.path);
              //   },
              //   child: Container(
              //     alignment: Alignment.center,
              //     // child: SvgPicture.asset(Assets.icons.icAr),
              //   ),
              // )),
              Expanded(
                child: BottomNavigationItem(
                  widget.pageController,
                  index: 2,
                  icon: (currentIndex == 2)
                      ? Assets.icons.icVoiceSelected
                      : Assets.icons.icVoiceUnselected,
                  title: 'Voice',
                  currentIndex: currentIndex,
                ),
              ),
              Expanded(
                child: BottomNavigationItem(
                  widget.pageController,
                  index: 3,
                  icon: (currentIndex == 3)
                      ? Assets.icons.icSettingsSelected
                      : Assets.icons.icSettingsUnselected,
                  title: 'Settings',
                  currentIndex: currentIndex,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String icon;
  final String title;
  final PageController pageController;

  BottomNavigationItem(this.pageController,
      {required this.index,
      required this.icon,
      required this.title,
      required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    Color color = (index == currentIndex)
        ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor!
        : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!;
    return InkResponse(
      onTap: () {
        pageController.jumpToPage(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon, width: 24,),
          kSpacingHeight4,
          Text(
            title,
            style: Theme.of(context).textTheme.caption?.copyWith(
                color: color,
                fontSize: 11,
                height: 16 / 11,
                fontWeight:
                    index == currentIndex ? FontWeight.w500 : FontWeight.w500),
          )
        ],
      ),
    );
  }
}
