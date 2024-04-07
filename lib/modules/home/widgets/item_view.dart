// Widget for music item
// Has a hero animation
import 'package:flutter/material.dart';

import '../../detail/view/detail_page.dart';
import '../bloc/home.dart';
import '../models/MusicModel.dart';

class MusicItemWidget extends StatelessWidget {
  const MusicItemWidget({
    super.key,
    required this.item,
    required this.homeBloc,
  });

  final MusicModel item;
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Hero(
        tag: item.id,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        item.title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        item.artist,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: IconButton(
        icon: Icon(
          item.isFavorite ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () {
          // Add to favorite
          BlocProvider.of<HomeBloc>(context).add(
            HomeFavorite(
              item.id,
              !item.isFavorite,
            ),
          );
        },
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailPage.route + item.id,
          arguments: homeBloc,
        );
      },
    );
  }
}
