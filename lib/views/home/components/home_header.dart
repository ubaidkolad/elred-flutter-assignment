import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String homeHeaderTitle = "Your\nThings";

  @override
  Widget build(BuildContext context) {
    double headerHeight = MediaQuery.of(context).size.width / 2;

    return SliverAppBar(
      floating: true,
      snap: false,
      expandedHeight: headerHeight,
      flexibleSpace: FlexibleSpaceBar(
          background: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/banner.webp",
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColorDark,
                          BlendMode.color))),
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                height: headerHeight,
                width: double.infinity,
              )),
          Container(
            color: Theme.of(context).primaryColorDark.withOpacity(0.4),
          ),
          Container(
            color: Colors.white12.withOpacity(.2),
            width: 250,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.bottomCenter, stops: [
                  0.1,
                  0.9,
                ], colors: [
                  Color.fromARGB(255, 158, 187, 241),
                  Color(0xFF2596be)
                ])),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    )
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      homeHeaderTitle,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Row(
                      children: [
                        taskNumberTitleAndSubtitle("23", 'Personal'),
                        SizedBox(
                          width: 12,
                        ),
                        taskNumberTitleAndSubtitle("15", "Business"),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sept 5, 2015",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Row(
                      children: [
                        CircularPercentIndicator(
                          radius: 10.0,
                          lineWidth: 2.0,
                          percent: .6,
                          rotateLinearGradient: true,
                          animation: true,
                          backgroundColor: Colors.white54,
                          linearGradient: LinearGradient(colors: [
                            Color.fromARGB(255, 158, 187, 241),
                            Color(0xFF2596be),
                          ], stops: [
                            0.1,
                            0.9
                          ]),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "65% done",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  //Task Number and Task Type Text
  Widget taskNumberTitleAndSubtitle(String numberOfTasks, String taskType) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          numberOfTasks,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          taskType,
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }
}
