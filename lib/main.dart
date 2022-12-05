import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Page1(),
    ),
  );
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Text('Go go!'),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    const items = <String>['第一項', '第二項', '第三項'];
    const icons = <String>['assets/11.png', 'assets/2.png', 'assets/33.png'];
    return Scaffold(
      appBar: AppBar(
        title: Text('page2'),
      ),
      body: Center(
          child: ListView.separated(
            itemCount: items.length,
            itemBuilder: (context, index) =>
                ListTile(
                  title: Text(items[index], style: TextStyle(fontSize: 20),),
                  onTap: () => Text('點選' + items[index]),
                  leading: Container(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(icons[index],),),
                    padding: EdgeInsets.symmetric(
                        vertical: 8, horizontal: 10),),
                  subtitle: Text('每項說明', style: TextStyle(fontSize: 16),),),
            separatorBuilder: (context, index) => Divider(),
          )
      ),
    );
  }
}