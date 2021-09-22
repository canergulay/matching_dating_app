import 'package:flutter/material.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/user_card.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class UsersStacked extends StatelessWidget {
  const UsersStacked({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // THESE ARE ALL DUMMY , JUST TRYING TO CONFIGURE THE UI
      children: [
        Transform(
          transform: Matrix4.identity()..rotate(vector.Vector3(11, 0, 0), 0.3),
          child: const UserCard(
            position: 16,
            userImage: 'https://i.pinimg.com/originals/87/07/90/87079055b55e4dab8117f6d580ec92d5.jpg',
            color: Colors.yellow,
          ),
        ),
        Transform(
          transform: Matrix4.identity()..rotate(vector.Vector3(11, 0, 0), 0.40),
          child: const UserCard(
            position: 12,
            userImage: 'https://ath2.unileverservices.com/wp-content/uploads/sites/4/2020/02/IG-annvmariv-1024x1016.jpg',
            color: Colors.blue,
          ),
        ),
        Transform(
          transform: Matrix4.identity()..rotate(vector.Vector3(11, 0, 0), 0.5),
          child: const UserCard(
            position: 8,
            userImage: 'https://ath2.unileverservices.com/wp-content/uploads/sites/4/2020/02/IG-annvmariv-1024x1016.jpg',
            color: Colors.purple,
          ),
        ),
        Transform(
          transform: Matrix4.identity()..rotate(vector.Vector3(11, 0, 0), 0.4),
          child: const UserCard(
            position: 4,
            userImage: 'https://i2-prod.walesonline.co.uk/incoming/article20840319.ece/ALTERNATES/s1200c/1_LG_LEC_20828335_Emma_Carlile.jpg',
            color: Colors.green,
          ),
        ),
        Transform(
          transform: Matrix4.identity()..rotate(vector.Vector3(11, 0, 0), 0),
          child: const UserCard(
            position: 0,
            userImage: 'https://i2-prod.walesonline.co.uk/incoming/article20840319.ece/ALTERNATES/s1200c/1_LG_LEC_20828335_Emma_Carlile.jpg',
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
