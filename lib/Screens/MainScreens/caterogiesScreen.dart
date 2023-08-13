import 'package:digestdraft/Screens/MainScreens/homepage2.dart';
import 'package:digestdraft/config/styling.dart';
import 'package:digestdraft/utils/static_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 8,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return HomePage2(
                              filter:
                                  'topic ~ "${StaticData.categories[index].title.toLowerCase()}"');
                        },
                      ));
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.width - 20,
                        width: MediaQuery.of(context).size.width - 20,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: (index == 1 ||
                                  index == 2 ||
                                  index == 5 ||
                                  index == 6)
                              ? ColorSchemes.backgroundWhite
                              : ColorSchemes.ForestGreen,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StaticData.categories[index].icon,
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                StaticData.categories[index].title,
                                style: index % 2 == 0
                                    ? TextStyles().introStyle
                                    : TextStyles().introStyle,
                              )
                            ])),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
