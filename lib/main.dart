import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 160.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink, Colors.purple],
                ),
                boxShadow: [
                  BoxShadow(blurRadius: 1.0),
                ],
                borderRadius: BorderRadius.circular(8.0)),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Where to?',
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .apply(color: Colors.white),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.not_listed_location,
                            color: Colors.white,
                          ),
                          onPressed: () {})
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  LocationField(
                    prefixText: 'From:',
                    hintText: 'Chepstow Library',
                  ),
                  LocationField(
                    prefixText: 'To:',
                    hintText: 'Monmounth Rugby Club',
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RadioButton(
                        label: 'Round Trip',
                        checked: true,
                      ),
                      RadioButton(label: 'One Way'),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: AgendaSelector(
                      locationLabel: 'Leave At:',
                      timeLabel: 'Today, Now',
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: AgendaSelector(
                      locationLabel: 'Arrive By:',
                      timeLabel: 'Select',
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 48.0,
                    width: double.infinity,
                    child: CupertinoButton(
                      onPressed: () {},
                      child: Text('SEARCH'),
                      color: Colors.pink,
                    ),
                  ),
                  SizedBox(height: 40),
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.tune,
                        color: Colors.black,
                        size: 32.0,
                      ),
                      label: Text(
                        'Preferences',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .apply(decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 1.0,
              ),
            ],
            border: Border()),
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BottomBarButton(
              label: 'Home',
              icon: CupertinoIcons.home,
              selected: true,
            ),
            BottomBarButton(
              label: 'Journeys',
              icon: CupertinoIcons.bus,
            ),
            BottomBarButton(
              label: 'Profile',
              icon: CupertinoIcons.person,
              promoteText: '20%',
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  final String promoteText;
  final bool selected;
  final String label;
  final IconData icon;

  const BottomBarButton({
    Key key,
    @required this.label,
    @required this.icon,
    this.selected = false,
    this.promoteText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: promoteText != null ? 10.0 : 22.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: selected ? Colors.pink : Colors.black,
                size: 32.0,
              ),
              SizedBox(height: 5.0),
              Text(
                label,
                style: Theme.of(context).textTheme.body1.apply(
                      color: selected ? Colors.pink : Colors.black,
                    ),
              )
            ],
          ),
          if (promoteText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Icon(
                    Icons.lens,
                    color: Colors.pink,
                    size: 36.0,
                  ),
                  Text(
                    promoteText ?? '20%',
                    style: Theme
                        .of(context)
                        .textTheme
                        .body1
                        .copyWith(color: Colors.white, fontSize: 10.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class AgendaSelector extends StatelessWidget {
  final String locationLabel;
  final String timeLabel;

  const AgendaSelector({
    Key key,
    @required this.locationLabel,
    @required this.timeLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: DropdownButton(
            label: locationLabel,
          ),
        ),
        Expanded(
          flex: 3,
          child: DateSelector(
            label: timeLabel,
          ),
        )
      ],
    );
  }
}

class DateSelector extends StatelessWidget {
  final String label;

  const DateSelector({
    Key key,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(label),
        Icon(
          Icons.arrow_forward_ios,
          size: 20.0,
        ),
      ],
    );
  }
}

class DropdownButton extends StatelessWidget {
  final String label;

  const DropdownButton({
    Key key,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          label,
          style: Theme.of(context).textTheme.subtitle,
        ),
        SizedBox(
          width: 10.0,
        ),
        Icon(
          Icons.keyboard_arrow_down,
          size: 32.0,
        )
      ],
    );
  }
}

class RadioButton extends StatelessWidget {
  final String label;
  final bool checked;

  const RadioButton({
    Key key,
    @required this.label,
    this.checked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          label,
          style: Theme.of(context).textTheme.subtitle,
        ),
        SizedBox(
          width: 10.0,
        ),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Card(
              shape: CircleBorder(),
              elevation: 5.0,
              child: Icon(
                Icons.lens,
                color: Colors.white,
                size: 24.0,
              ),
            ),
            Icon(
              Icons.lens,
              color: checked ? Colors.black : Colors.white,
              size: 16.0,
            ),
          ],
        )
      ],
    );
  }
}

class LocationField extends StatelessWidget {
  final String prefixText;
  final String hintText;

  const LocationField({
    Key key,
    @required this.prefixText,
    @required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 8.0,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Text(
              prefixText,
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 7,
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: Icon(
                  Icons.gps_fixed,
                  color: Colors.grey[400],
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
