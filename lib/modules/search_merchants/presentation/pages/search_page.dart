import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prestochallengue/modules/search_merchants/presentation/bloc/custom_blocs.dart';
import 'package:prestochallengue/modules/search_merchants/presentation/pages/widgets/widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final merchantState = context.watch<SearchBloc>().state;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const InputSearch(),
            if (merchantState.isLoadingListOfSearch ?? false)
               Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: const CircularProgressIndicator(color:Colors.red),
              )
            else if (merchantState.searchResult == null)
              Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: const Column(
                  children: [
                    Icon(
                      Icons.search,
                      size: 60.0,
                      color: Colors.grey,
                    ),
                    Text("Realice su busqueda"),
                  ],
                ),
              )
            else if (merchantState.searchResult!.isEmpty && merchantState.favoriteMerchants!.isEmpty)
              Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: const Column(
                  children: [
                     Icon(
                      Icons.search_off,
                      size: 60.0,
                      color: Colors.grey,
                    ),
                    Text(
                      "No se encontraron resultados",
                      style: TextStyle(color: Colors.grey),

                    ),
                  ],
                ),
              )
            else
              Flexible(
                child: ListView(
                  children: [
                    if (merchantState.favoriteMerchants != null && merchantState.favoriteMerchants!.isNotEmpty)
                      FavoriteResults(merchantState: merchantState),
                    if (merchantState.searchResult != null && merchantState.searchResult!.isNotEmpty)
                      SearchResults(merchantState: merchantState),
                  ],
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          context.read<SearchBloc>().add(OnSearchFavoriteMerchat());
        },
        child: const Icon(Icons.favorite, color: Colors.white),
      ),
    );
  }
}

class FavoriteResults extends StatelessWidget {
  const FavoriteResults({
    super.key,
    required this.merchantState,
  });

  final SearchState merchantState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Favoritos",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
    
        const SizedBox(height: 25),
          
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: merchantState.favoriteMerchants!.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (_, index) {
            return MerchatItem(
              id: merchantState.favoriteMerchants![index].merchantId,
              name: merchantState.favoriteMerchants![index].merchant,
              category: "",
              isFavorite: true,
            );
          },
        ),
      ],
    );
  }
}

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
    required this.merchantState,
  });

  final SearchState merchantState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Resultados",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
    
        Text(
          "Se encontraron ${merchantState.searchResult!.length} resultados",
          style: const TextStyle(color: Colors.grey),
        ),
    
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.all(color: Colors.grey, width:0.6),
            borderRadius: BorderRadius.circular(25.0),
          ),
            child: Text(
              "Presione dos veces para agregar a favoritos ❤️",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12.0
            ),
          ),
        ),
    
        const SizedBox(height: 15),
        
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: merchantState.searchResult!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (_, index) {
            return MerchatItem(
              id: merchantState.searchResult![index].id!,
              name: merchantState.searchResult![index].name!,
              category: merchantState.searchResult![index]
                  .category!,
            );
          },
        ),
      ],
    );
  }
}