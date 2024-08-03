import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestochallengue/modules/search_merchants/presentation/bloc/custom_blocs.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({ super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(  
        color: Colors.grey[50],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(25.0),
      ),
    
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Buscar",
          icon: Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: const Icon(Icons.search)),
          border: InputBorder.none,
        ),
        onChanged: (value) async {
          if (value.isEmpty) return;
          context.read<SearchBloc>().add(OnSearchMerchat(term: value));
        },
      ),
    );
  }
}