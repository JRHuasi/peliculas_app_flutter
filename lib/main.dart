import 'package:flutter/material.dart';
import 'package:pelicula_app/prividers/movie_provider.dart';
import 'package:pelicula_app/screens/screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
			providers: [
				ChangeNotifierProvider(
					create: ( _ ) => MoviesProvider(), lazy: false),				
			],
			child: MyApp(),
		);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Películas',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'details': (_) => DetailsScreen(),
        },
        theme: ThemeData.light()
            .copyWith(appBarTheme: AppBarTheme(color: Colors.indigo)));
  }
}
