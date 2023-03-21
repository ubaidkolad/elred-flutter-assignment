import 'package:elred_flutter_assignment/config/constants.dart';
import 'package:elred_flutter_assignment/models/task.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeHeader extends StatelessWidget {
  final List<TaskDetails> taskDetails;
  const HomeHeader({Key? key, required this.taskDetails}) : super(key: key);

  final String homeHeaderTitle = "Your \nThings";

  num getPercentage() {
    if (taskDetails.length == 0) {
      return 0;
    }
    int completedTasks = tasksController.getCompletedTasks(taskDetails);
    num completedPercentage = (completedTasks / taskDetails.length) * 100;
    return completedPercentage;
  }

  @override
  Widget build(BuildContext context) {
    double headerHeight = MediaQuery.of(context).size.width / 2;

    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      pinned: true,
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
            width: taskDetails.length == 0
                ? 0
                : MediaQuery.of(context).size.width * (getPercentage() / 100),
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
                        taskNumberTitleAndSubtitle(context, "23", 'Personal'),
                        SizedBox(
                          width: 12,
                        ),
                        taskNumberTitleAndSubtitle(context, "15", "Business"),
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
                          percent: .2,
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
                          "${getPercentage().toStringAsFixed(2)}% done",
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
  Widget taskNumberTitleAndSubtitle(
      context, String numberOfTasks, String taskType) {
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
