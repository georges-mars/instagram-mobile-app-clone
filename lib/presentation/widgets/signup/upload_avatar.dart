import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/colors.dart';

class UploadAvatarWidget extends StatelessWidget {
  const UploadAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(AppAssets.kDefaultProfilePic),
          radius: MediaQuery.of(context).size.height * .08,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 28.0,
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: kBlueColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.add_a_photo, size: 16.0),
            ),
          ),
        ),
      ]
    );
  }
}