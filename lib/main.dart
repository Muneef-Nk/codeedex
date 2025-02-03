import 'package:codeedex/features/home/viewmodel/home_viewmodel.dart';
import 'package:codeedex/features/login/viewmodel/login_viewmodel.dart';
import 'package:codeedex/features/login/view/login_view.dart';
import 'package:codeedex/features/products_details/viewmodel/products_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => Homeviewmodel()),
        ChangeNotifierProvider(create: (context) => ProductsDetailsViewmodel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),
    );
  }
}
