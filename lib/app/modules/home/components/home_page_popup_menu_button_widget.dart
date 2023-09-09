import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:book_widgets/app/modules/home/home_controller.dart';

class HomePagePopupMenuButtonWidget extends StatelessWidget {
  final HomeController controller;
  const HomePagePopupMenuButtonWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PopupMenuButton(
      constraints: const BoxConstraints(maxWidth: 126),
      offset: const Offset(0, 50),
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem(
          child: TextButton(
            child: Text('Favoritos', style: Theme.of(context).textTheme.bodySmall),
            onPressed: () async {
              Modular.to.pop();
              Modular.to.pushNamed('/favorite/'); 
            },
          ),
        ),
      ],

      child: const Row(
        children: [
          Icon(
            Icons.account_circle_outlined,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Silas Wylly'),
          ),
        ],
      ),
    );
  }
}
