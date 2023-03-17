import 'package:elred_flutter_assignment/common_components/icon_with_circular_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_face_pile/flutter_face_pile.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
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
                            "Boglioli suit fitting",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            "Inuse Experience, Gothenburg",
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
                          Text("9am",
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
            childCount: 3));
  }
}
