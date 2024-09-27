import 'dart:io';

import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../utils.dart';
import 'no_data.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
    required this.borderRadius,
    this.width,
    this.height,
    this.errorImageAsset = '',
  });

  final String image;
  final double borderRadius;
  final double? width;
  final double? height;
  final String errorImageAsset;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(color: AppColors.main),
        child: Image.file(
          File(image),
          fit: BoxFit.cover,
          width: width,
          height: height,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              image,
              fit: BoxFit.cover,
              width: width,
              height: height,
              errorBuilder: (context, error, stackTrace) {
                logger('IMAGE ASSET NOT FOUND');
                logger(error);
                if (errorImageAsset.isEmpty) return const NoData();
                return Image.asset(
                  errorImageAsset,
                  fit: BoxFit.cover,
                  width: width,
                  height: height,
                  errorBuilder: (context, error, stackTrace) {
                    logger('ERROR IMAGE ASSET NOT FOUND');
                    logger(error);
                    return const NoData();
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
