import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prestochallengue/modules/search_merchants/presentation/bloc/custom_blocs.dart';

class MerchatItem extends StatefulWidget {
  final String id;
  final String name;
  final String category;
  final bool isFavorite;

  const MerchatItem({
    Key? key,
    required this.id,
    required this.name,
    required this.category,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  MerchatItemState createState() => MerchatItemState();
}

class MerchatItemState extends State<MerchatItem> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void addFavoriteMerchant() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    context.read<SearchBloc>().add(OnAddFavoriteMerchat(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: addFavoriteMerchant,
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.name),
              if (_isFavorite)
                const Icon(
                  CupertinoIcons.heart_fill,
                  color: CupertinoColors.systemRed,
                ),
            ],
          ),
          Text(widget.category),
        ],
      ),
    );
  }
}