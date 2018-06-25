import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../DistrictRingingApp.dart';
import '../../helpers/ButtonHelper.dart';
import '../../helpers/TextHelper.dart';
import '../../pageLayout/PageScaffold.dart';
import '../../settings/AppSettings.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationsAPI =
        DistrictInheritedWidget.of(context).notificationsAPI;
    notificationsAPI.initialise(context);
    notificationsAPI.createNotifications();

    return PageScaffold(
      titleText: 'Home',
      child: _getHome(context),
    );
  }

  Widget _getContactLinks(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonHelper.createButton(
              context,
              'FACEBOOK',
              FontAwesomeIcons.facebookSquare,
              AppSettings.districtFacebook,
              true),
          ButtonHelper.createButton(context, 'WEBSITE', Icons.language,
              AppSettings.districtWebiste, true)
        ],
      ),
    );
  }

  Widget _getHome(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _getLogo(),
          _getTitleRow(context, AppSettings.homeTitle),
          TextHelper.textRowCenteredLarge(
              text: AppSettings.homeDescription, topPadding: 5.0),
          _getContactLinks(context),
        ],
      ),
    );
  }

  Widget _getLogo() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Image(
        image: AssetImage('images/core/District_Logo.png'),
        height: 250.0,
      ),
    );
  }

  Widget _getTitleRow(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ),
      ],
    );
  }
}
