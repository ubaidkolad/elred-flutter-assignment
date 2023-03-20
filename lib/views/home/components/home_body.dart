import 'package:elred_flutter_assignment/common_components/icon_with_circular_border.dart';
import 'package:elred_flutter_assignment/config/constants.dart';
import 'package:elred_flutter_assignment/models/task.dart';
import 'package:elred_flutter_assignment/views/add_task/task_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_face_pile/flutter_face_pile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _tasksStream = usersCollection
        .doc(auth.currentUser!.uid)
        .collection('tasks')
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _tasksStream,
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return SliverPadding(
            padding: EdgeInsets.only(
              top: 24,
              left: 32,
            ),
            sliver: SliverToBoxAdapter(
                child: Text(
              'Someting went wrong',
              style: Theme.of(context).textTheme.headline2,
            )),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverPadding(
            padding: EdgeInsets.only(
              top: 24,
              left: 32,
            ),
            sliver: SliverToBoxAdapter(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColorLight,
            )),
          );
        }
        List<TaskDetails> taskDetails = snapshot.data!.docs
            .map(
                ((e) => TaskDetails.fromJson(e.data() as Map<String, dynamic>)))
            .toList();
        if (taskDetails.length == 0) {
          return noTasksPlaceholder(context);
        }
        return tasksList(taskDetails: taskDetails);
      }),
    );
  }

  Widget noTasksPlaceholder(context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: 48,
        left: 32,
      ),
      sliver: SliverToBoxAdapter(
          child: Center(
        child: Text("No tasks found. \nClick on + to add one.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2!),
      )),
    );
  }

  Widget tasksList({List<TaskDetails>? taskDetails}) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/task_form_view",
                        arguments: TaskFormView(
                          isEditing: true,
                          taskDetails: taskDetails![index],
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey[200]!, width: 1.3))),
                    child: Row(
                      children: [
                        IconWithCircularBorder(
                          borderColor: Colors.grey[300]!,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              taskDetails![index].taskName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              taskDetails![index].taskPlace,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.grey[500]),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(taskDetails![index].taskTime,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(color: Colors.grey[500])),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                                width: 50,
                                child: FacePile(
                                  faces: [
                                    FaceHolder(
                                      id: '1',
                                      name: 'user 1',
                                      avatar: NetworkImage(
                                          'https://i.pravatar.cc/300?img=1'),
                                    ),
                                    FaceHolder(
                                      id: '2',
                                      name: 'user 2',
                                      avatar: NetworkImage(
                                          'https://i.pravatar.cc/300?img=2'),
                                    ),
                                  ],
                                  faceSize: 24,
                                  facePercentOverlap: .4,
                                  borderColor: Colors.white,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
            childCount: taskDetails!.length));
  }
}
