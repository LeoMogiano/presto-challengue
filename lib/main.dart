import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prestochallengue/modules/search_merchants/data/repositories/repositories.dart';
import 'package:prestochallengue/modules/search_merchants/presentation/bloc/custom_blocs.dart';
import 'package:prestochallengue/modules/search_merchants/presentation/pages/pages.dart';
import 'package:prestochallengue/services/http_request/http_request.impl.dart';

void main() {
  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => SearchBloc(searchRepository: SearchRepositoryImpl(httpService: HttpRequestService()))),
    ],
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchPage(),
    );
  }
}
