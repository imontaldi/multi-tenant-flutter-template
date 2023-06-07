import 'package:flutter/material.dart';
import 'package:flutter_template/values/k_colors.dart';

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

topContainerOrangeShadow() => const BoxShadow(
      color: KPrimary,
      spreadRadius: -5,
      blurRadius: 5,
      offset: Offset(0, 4),
    );
