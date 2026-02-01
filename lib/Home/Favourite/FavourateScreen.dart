import 'package:eventapp/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';

import '../../widgets/CustemTextformField.dart';
import '../../widgets/CustomStack.dart';

class Favouratescreen extends StatelessWidget {
  const Favouratescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.lightBackGround,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Custemtextformfield(
                hintText: 'Search for events',
                obscureText: false,
                suffixIcon: const Icon(Icons.search),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return const Customstack();
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: 5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
