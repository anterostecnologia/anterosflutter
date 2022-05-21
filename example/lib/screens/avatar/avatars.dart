import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anterosflutter/anterosflutter.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool showToast = false;
  bool _animate = true;
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: const Text(
          'Avatar',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ...getBasicAvatars(),
            ...getCircularAvatars(),
            ...getStackAvatars(),
            ...getAdvancedAvatars(),
            ...getTextAvatars(),
            ...getGlowAvatars()
          ],
        ),
      ));

  List<Widget> getTextAvatars() {
    return [
      Padding(
        padding: EdgeInsets.only(left: 15, top: 30),
        child: AnterosTypography(
          text: 'Color Text Avatar',
          type: AnterosTypographyType.typo5,
          dividerWidth: 25,
          dividerColor: Theme.of(context).primaryColor,
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnterosTextAvatar(
            textColor: Colors.white,
            shape: Shape.Circular,
            text: "Ali Akalın",
            numberLetters: 2,
          ),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            shape: Shape.Circular,
            text: "Bulut Peker",
            numberLetters: 2,
          ),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            shape: Shape.Circular,
            text: "Ceylin Oztürk",
            numberLetters: 2,
          ),
          SizedBox(
            width: 12,
          ),
          Text('.....'),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            shape: Shape.Circular,
            text: "Xantos Salvo",
            numberLetters: 2,
          ),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            shape: Shape.Circular,
            text: "Yuval Noah",
            numberLetters: 2,
          ),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            shape: Shape.Circular,
            text: "Zoey Gen",
            numberLetters: 2,
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnterosTextAvatar(
            textColor: Colors.white,
            text: "Ali Akalın",
            numberLetters: 2,
          ),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            text: "Bulut Peker",
            numberLetters: 2,
          ),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            text: "Ceylin Oztürk",
            numberLetters: 2,
          ),
          SizedBox(
            width: 12,
          ),
          Text('.....'),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            text: "Xantos Salvo",
            numberLetters: 2,
          ),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            text: "Yuval Noah",
            numberLetters: 2,
          ),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            text: "Zoey Gen",
            numberLetters: 2,
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnterosTextAvatar(
            textColor: Colors.white,
            text: "Ali Akalın",
            numberLetters: 1,
          ),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            text: "Bulut Peker",
            numberLetters: 1,
          ),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            text: "Ceylin Oztürk",
            numberLetters: 1,
          ),
          SizedBox(
            width: 12,
          ),
          Text('.....'),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            text: "Xantos Salvo",
            numberLetters: 1,
          ),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            text: "Yuval Noah",
            numberLetters: 1,
          ),
          SizedBox(
            width: 12,
          ),
          AnterosTextAvatar(
            textColor: Colors.white,
            text: "Zoey Gen",
            numberLetters: 1,
          ),
        ],
      )
    ];
  }

  List<Widget> getAdvancedAvatars() {
    return [
      Padding(
        padding: EdgeInsets.only(left: 15, top: 30),
        child: AnterosTypography(
          text: 'Advanced Avatar',
          type: AnterosTypographyType.typo5,
          dividerWidth: 25,
          dividerColor: Theme.of(context).primaryColor,
        ),
      ),
      GridView.count(shrinkWrap: true, crossAxisCount: 3, children: [
        AnterosAdvancedAvatar(
          name: 'John Doe',
          statusColor: Colors.red,
        ),
        AnterosAdvancedAvatar(
          name: 'Smith Corey',
          statusColor: Colors.green,
          statusAngle: 45,
        ),
        AnterosAdvancedAvatar(
          child: Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 40,
          ),
        ),
        AnterosAdvancedAvatar(
          name: 'John Doe',
          statusColor: Colors.red,
          size: 40,
        ),
        AnterosAdvancedAvatar(
          name: 'Smith Corey',
          statusColor: Colors.green,
          statusAngle: 45,
          size: 80,
        ),
        AnterosAdvancedAvatar(
          child: Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 40,
          ),
          size: 120,
        ),
        AnterosAdvancedAvatar(
          child: Text('CMYK'),
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 16.0,
                height: 16.0,
                color: Colors.cyan,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 16.0,
                height: 16.0,
                color: Colors.pinkAccent,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 16.0,
                height: 16.0,
                color: Colors.yellow,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 16.0,
                height: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
        AnterosAdvancedAvatar(
          statusColor: Colors.deepOrange,
          image: AssetImage('assets/images/avatar.jpg'),
          foregroundDecoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.deepOrange.withOpacity(0.75),
              width: 5.0,
            ),
          ),
        ),
        AnterosAdvancedAvatar(
          statusSize: 16,
          statusColor: Colors.green,
          image: AssetImage('assets/images/avatar.jpg'),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 16.0,
              ),
            ],
          ),
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '12',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ])
    ];
  }

  List<Widget> getStackAvatars() {
    return [
      Padding(
        padding: EdgeInsets.only(left: 15, top: 30),
        child: AnterosTypography(
          text: 'Stack Avatar',
          type: AnterosTypographyType.typo5,
          dividerWidth: 25,
          dividerColor: Theme.of(context).primaryColor,
        ),
      ),
      Example1Default(),
      Indent(),
      Example9StackLayingFirst(),
      Indent(),
      Example10StackLayingFive(),
      Indent(),
      Example8InfoIndent(),
      Indent(),
      Example2MaxAmount(),
      Indent(),
      Example3MaxAmountCenterAlign(),
      Indent(),
      Example4RightAlign(),
      Indent(),
      Example5MaxCoverage(),
      Indent(),
      Example6MinCoverage(),
      Indent(),
      Example7WidgetStack()
    ];
  }

  List<Widget> getCircularAvatars() {
    return [
      Padding(
        padding: EdgeInsets.only(left: 15, top: 30),
        child: AnterosTypography(
          text: 'Circular Avatar',
          type: AnterosTypographyType.typo5,
          dividerWidth: 25,
          dividerColor: Theme.of(context).primaryColor,
        ),
      ),
      AnterosCircularProfileAvatar(
        '',
        child: FlutterLogo(),
        borderColor: Colors.purpleAccent,
        borderWidth: 2,
        elevation: 5,
        radius: 50,
      ),
      AnterosCircularProfileAvatar(
        '',
        child: Icon(
          Icons.person,
          size: 140,
        ),
        borderColor: Colors.black,
        borderWidth: 3,
        elevation: 5,
        radius: 75,
      ),
      AnterosCircularProfileAvatar(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWtMDksH9GzFdMinyAkGbtLJNx6xynLETTNN5akjxirL3QD5Rj',
        errorWidget: (context, url, error) => Container(
          child: Icon(Icons.error),
        ),
        placeHolder: (context, url) => Container(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
        radius: 90,
        backgroundColor: Colors.transparent,
        borderWidth: 10,
        borderColor: Colors.red,
        imageFit: BoxFit.fitHeight,
        elevation: 5.0,
        onTap: () {
          print('adil');
        },
        cacheImage: true,
        showInitialTextAbovePicture: false,
      )
    ];
  }

  List<Widget> getGlowAvatars() {
    return [
      Container(
        width: double.infinity,
        color: Color(0xff686de0),
        child: AnterosAvatarGlow(
          endRadius: 70,
          animate: _animate,
          child: Material(
            elevation: 8.0,
            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: Image.asset(
                'assets/images/dart.png',
                height: 50,
              ),
              radius: 30,
            ),
          ),
        ),
      ),
      Container(
        width: double.infinity,
        color: Color(0xff686de0),
        child: AvatarGlow(
          startDelay: Duration(milliseconds: 1000),
          glowColor: Colors.white,
          endRadius: 100.0,
          duration: Duration(milliseconds: 2000),
          repeat: true,
          showTwoGlows: true,
          repeatPauseDuration: Duration(milliseconds: 100),
          child: Material(
            elevation: 8.0,
            shape: CircleBorder(),
            color: Colors.transparent,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              radius: 50.0,
            ),
          ),
          shape: BoxShape.circle,
          animate: true,
          curve: Curves.fastOutSlowIn,
        ),
      ),
      SizedBox(
        height: 16.0,
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AnterosAvatarGlow(
            glowColor: Colors.blue,
            endRadius: 90.0,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Material(
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: Image.asset(
                  'assets/images/flutter.png',
                  height: 60,
                ),
                radius: 40.0,
              ),
            ),
          ),
          AnterosAvatarGlow(
            glowColor: Colors.red,
            endRadius: 90.0,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Material(
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: Image.asset(
                  'assets/images/love.png',
                  height: 60,
                ),
                radius: 40.0,
              ),
            ),
          ),
        ],
      ),
      AnterosAvatarGlow(
        glowColor: Colors.cyan,
        endRadius: 60.0,
        duration: Duration(milliseconds: 2000),
        repeat: true,
        showTwoGlows: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        child: Material(
          elevation: 8.0,
          shape: CircleBorder(),
          child: CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Image.asset(
              'assets/images/dart.png',
              height: 50,
            ),
            radius: 30.0,
          ),
        ),
      ),
    ];
  }

  List<Widget> getBasicAvatars() {
    return [
      Padding(
        padding: EdgeInsets.only(left: 15, top: 30),
        child: AnterosTypography(
          text: 'Basic Avatar',
          type: AnterosTypographyType.typo5,
          dividerWidth: 25,
          dividerColor: Theme.of(context).primaryColor,
        ),
      ),
      AnterosCard(
        content: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                AnterosAvatar(
                  backgroundImage: AssetImage('lib/assets/images/avatar5.png'),
                ),
                AnterosAvatar(
                  backgroundImage: AssetImage('lib/assets/images/img.png'),
                ),
                AnterosAvatar(
                  backgroundImage: AssetImage('lib/assets/images/img1.png'),
                ),
                AnterosAvatar(
                  backgroundImage: AssetImage('lib/assets/images/img2.png'),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                AnterosAvatar(
                  backgroundImage: AssetImage('lib/assets/images/avatar6.png'),
                  shape: AnterosAvatarShape.standard,
                ),
                AnterosAvatar(
                  backgroundImage: AssetImage('lib/assets/images/avatar11.png'),
                  shape: AnterosAvatarShape.standard,
                ),
                AnterosAvatar(
                  backgroundImage: AssetImage('lib/assets/images/avatar9.png'),
                  shape: AnterosAvatarShape.standard,
                ),
                AnterosAvatar(
                  backgroundImage: AssetImage('lib/assets/images/avatar12.png'),
                  shape: AnterosAvatarShape.standard,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                AnterosAvatar(
                  backgroundImage: AssetImage(
                    'lib/assets/images/avatar10.png',
                  ),
                  shape: AnterosAvatarShape.square,
                ),
                AnterosAvatar(
                  backgroundImage: AssetImage('lib/assets/images/avatar12.png'),
                  shape: AnterosAvatarShape.square,
                ),
                AnterosAvatar(
                  backgroundImage: AssetImage('lib/assets/images/avatar11.png'),
                  shape: AnterosAvatarShape.square,
                ),
                AnterosAvatar(
                  backgroundImage: AssetImage('lib/assets/images/avatar6.png'),
                  shape: AnterosAvatarShape.square,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )
    ];
  }
}

class Indent extends StatelessWidget {
  const Indent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(height: 30);
}

class Example1Default extends StatelessWidget {
  const Example1Default({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Default:',
        ),
        const SizedBox(height: 10),
        AnterosAvatarStack(
          height: 50,
          avatars: [for (var n = 0; n < 15; n++) NetworkImage(getAvatarUrl(n))],
        ),
      ],
    );
  }
}

class Example2MaxAmount extends StatelessWidget {
  const Example2MaxAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = RestrictedAmountPositions(
      maxAmountItems: 5,
      maxCoverage: 0.3,
      minCoverage: 0.1,
    );
    return Column(
      children: [
        const Text(
          'Restricted amount:',
        ),
        const SizedBox(height: 10),
        AnterosAvatarStack(
          settings: settings,
          height: 50,
          avatars: [for (var n = 0; n < 15; n++) NetworkImage(getAvatarUrl(n))],
        ),
      ],
    );
  }
}

class Example3MaxAmountCenterAlign extends StatelessWidget {
  const Example3MaxAmountCenterAlign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = RestrictedAmountPositions(
      maxAmountItems: 4,
      maxCoverage: 0.3,
      minCoverage: 0.1,
      align: AnterosStackAlign.center,
    );
    return Column(
      children: [
        const Text(
          'Restricted amount with center alignment:',
        ),
        const SizedBox(height: 10),
        AnterosAvatarStack(
          settings: settings,
          height: 50,
          avatars: [for (var n = 0; n < 15; n++) NetworkImage(getAvatarUrl(n))],
        ),
      ],
    );
  }
}

class Example4RightAlign extends StatelessWidget {
  const Example4RightAlign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = RestrictedPositions(
      maxCoverage: 0.3,
      minCoverage: 0.1,
      align: AnterosStackAlign.right,
    );
    return Column(
      children: [
        const Text(
          'Right alignment:',
        ),
        const SizedBox(height: 10),
        AnterosAvatarStack(
          height: 50,
          settings: settings,
          avatars: [for (var n = 0; n < 15; n++) NetworkImage(getAvatarUrl(n))],
        ),
      ],
    );
  }
}

class Example5MaxCoverage extends StatelessWidget {
  const Example5MaxCoverage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = RestrictedPositions(
      maxCoverage: 0.7,
      minCoverage: 0.1,
      align: AnterosStackAlign.right,
    );
    return Column(
      children: [
        const Text(
          'Max coverage is set to 70%:',
        ),
        const SizedBox(height: 10),
        AnterosAvatarStack(
          height: 50,
          settings: settings,
          avatars: [for (var n = 0; n < 40; n++) NetworkImage(getAvatarUrl(n))],
        ),
      ],
    );
  }
}

class Example6MinCoverage extends StatelessWidget {
  const Example6MinCoverage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = RestrictedPositions(
      maxCoverage: 0.3,
      minCoverage: -0.5,
    );
    return Column(
      children: [
        const Text(
          'Min coverage is set to minus 50%:',
        ),
        const SizedBox(height: 10),
        AnterosAvatarStack(
          height: 50,
          settings: settings,
          avatars: [for (var n = 0; n < 5; n++) NetworkImage(getAvatarUrl(n))],
        ),
      ],
    );
  }
}

class Example7WidgetStack extends StatelessWidget {
  const Example7WidgetStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = RestrictedPositions(
      maxCoverage: -0.1,
      minCoverage: -0.5,
      align: AnterosStackAlign.right,
    );
    return Column(
      children: [
        const Text(
          'Any widgets for stack:',
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: AnterosWidgetStack(
            positions: settings,
            stackedWidgets: [
              for (var n = 0; n < 12; n++)
                FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  textColor: Color(0xFF * 0x1000000 +
                      n * 10 * 0x10000 +
                      (0xFF - n * 10) * 0x100),
                ),
              const FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text('A',
                      style: TextStyle(height: 0.9, color: Colors.orange))),
              const FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text('B', style: TextStyle(height: 0.9))),
              const FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text('C',
                      style: TextStyle(height: 0.9, color: Colors.green))),
            ],
            buildInfoWidget: (surplus) {
              return Center(
                  child: Text(
                '+$surplus',
                style: Theme.of(context).textTheme.headline5,
              ));
            },
          ),
        ),
      ],
    );
  }
}

class Example8InfoIndent extends StatelessWidget {
  const Example8InfoIndent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = RestrictedPositions(
      maxCoverage: 0.3,
      minCoverage: 0.1,
      align: AnterosStackAlign.right,
      infoIndent: 15,
    );
    return Column(
      children: [
        const Text(
          'Indent of the info widget:',
        ),
        const SizedBox(height: 10),
        AnterosAvatarStack(
          height: 50,
          settings: settings,
          avatars: [for (var n = 0; n < 35; n++) NetworkImage(getAvatarUrl(n))],
          infoWidgetBuilder: (surplus) => _infoWidget(surplus, context),
        ),
      ],
    );
  }

  Widget _infoWidget(int surplus, BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '+$surplus',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}

class Example9StackLayingFirst extends StatelessWidget {
  const Example9StackLayingFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = RestrictedPositions(
      maxCoverage: 0.3,
      minCoverage: 0.1,
      laying: AnterosStackLaying.first,
    );
    return Column(
      children: [
        const Text(
          'The first item is at the top:',
        ),
        const SizedBox(height: 10),
        AnterosAvatarStack(
          height: 50,
          settings: settings,
          avatars: [for (var n = 0; n < 17; n++) NetworkImage(getAvatarUrl(n))],
        ),
      ],
    );
  }
}

class Example10StackLayingFive extends StatelessWidget {
  const Example10StackLayingFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = RestrictedPositions(
      maxCoverage: 0.3,
      minCoverage: 0.1,
      laying: const AnterosStackLaying(itemPositionNumberAtTop: 5),
    );
    return Column(
      children: [
        const Text('The fifth item is at the top:'),
        const SizedBox(height: 10),
        AnterosAvatarStack(
          height: 50,
          settings: settings,
          avatars: [for (var n = 0; n < 20; n++) NetworkImage(getAvatarUrl(n))],
        ),
      ],
    );
  }
}

String getAvatarUrl(int n) {
  // final url = 'https://i.pravatar.cc/150?img=$n';
  final url = 'https://robohash.org/$n?bgset=bg1';
  return url;
}
