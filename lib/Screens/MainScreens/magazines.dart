import 'package:cached_network_image/cached_network_image.dart';
import 'package:digestdraft/config/styling.dart';
import 'package:digestdraft/controllers/magazineController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MagazinesScreen extends ConsumerWidget {
  const MagazinesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final magdata = ref.watch(magazinesprovider(''));
    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: magdata.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.items!.length,
                itemBuilder: (context, index) {
                  return MagazineCard(
                      title: data.items![index].title!,
                      url: data.items![index].cover!);
                },
              );
            },
            error: (error, stackTrace) {
              return Container(
                child: Text(error.toString()),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          )),
    );
  }
}

class MagazineCard extends StatelessWidget {
  MagazineCard({super.key, required this.title, required this.url});
  String title;
  String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorSchemes.BackgroundBlack,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(title, style: TextStyles().headingStyleWhite),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: (MediaQuery.of(context).size.width) - 20,
                child: CachedNetworkImage(
                  imageUrl: url,
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height / 2,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1.0,
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
