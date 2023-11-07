import 'package:employee_management_app/src/presentation/pages/home-page/components/home_body.dart';
import 'package:employee_management_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.homePageTitle),
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},child:const Icon(Icons.add),),
      body: const HomeBody(),
    );
  }
}
