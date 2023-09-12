import 'package:flutter/material.dart';

import '../app_colors.dart';

class FavoriteIconButton extends StatefulWidget {
  bool isFavorite;
  Function(bool isFavorite) favoritePressed;

  FavoriteIconButton({super.key, 
    required this.isFavorite, 
    required this.favoritePressed});

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState(
    isFavorite: isFavorite,
    favoritePressed: favoritePressed);
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool isFavorite;
  Function(bool isFavorite) favoritePressed;

  _FavoriteIconButtonState({required this.isFavorite, required this.favoritePressed});

  @override
  Widget build(BuildContext context) {
    var icon =  Icon(
      isFavorite ? Icons.favorite : Icons.favorite_border, 
      size: 20, color: AppColors.likeButtonColor);

    return IconButton(
      icon: icon,
      onPressed: () {
        favoritePressed(!isFavorite);
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}