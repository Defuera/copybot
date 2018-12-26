import 'package:bot/common/theme.dart';
import 'package:bot/profile/profile_page.dart';
import 'package:flutter/material.dart';

class ProfileFloatingButton extends StatelessWidget {

  final bool enabled;

  ProfileFloatingButton({this.enabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        width: BotDimens.actionButtonDiameter,
        height: BotDimens.actionButtonDiameter,
        child: Opacity(
            opacity: () {
              if (enabled) {
                return 1.0;
              } else {
                return 0.5;
              }
            }(),
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                if (enabled) {
                  return () => Navigator.pushNamed(context, ProfilePage.route);
                } else {
                  return null;
                }
              }(),
              child: Icon(
                Icons.person_outline,
                color: BotColors.orange,
              ),
              backgroundColor: Colors.white,
            ),
          ),
      ),
    );
  }
}
