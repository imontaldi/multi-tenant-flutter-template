import 'package:flutter/material.dart';
import 'package:flutter_template/values/k_values.dart';

import 'k_colors.dart';

//Box Shadows
bottomContainerShadow() => const BoxShadow(
    color: Color(0x40666666),
    spreadRadius: -1,
    blurRadius: 5,
    offset: Offset(0, -1));

topContainerShadow() => const BoxShadow(
    color: Color(0x40666666),
    spreadRadius: -1,
    blurRadius: 5,
    offset: Offset(0, 1));

centerContainerShadow() => const BoxShadow(
    color: Color(0x40666666),
    spreadRadius: -1,
    blurRadius: 5,
    offset: Offset(0, 0));

topContainerOrangeShadow() => BoxShadow(
      color: KPrimary.withOpacity(0.2),
      spreadRadius: -5,
      blurRadius: 5,
      offset: const Offset(0, 4),
    );

//Text Styles

kBlack() => const TextStyle(color: KBlack);

kGrayW400Size45() => const TextStyle(
      color: KGray,
      fontWeight: FontWeight.w400,
      fontSize: KFontSizeXLarge45,
    );

kGrayL1W400Size45() => const TextStyle(
      color: KGray_L1,
      fontWeight: FontWeight.w400,
      fontSize: KFontSizeXLarge45,
    );

kWhiteW700Size40() => const TextStyle(
      color: KWhite,
      fontWeight: FontWeight.w700,
      fontSize: KFontSizeLarge40,
    );
