import 'package:flutter/cupertino.dart';

class MerchatItem extends StatefulWidget {
  const MerchatItem({super.key});

  @override
  State<MerchatItem> createState() => _MerchatItemState();
}

class _MerchatItemState extends State<MerchatItem> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        Text("CBN"),
        Text("Beers")
      ],
    );
  }
}
