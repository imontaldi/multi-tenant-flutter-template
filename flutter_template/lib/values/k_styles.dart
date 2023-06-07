import 'package:flutter/material.dart';
import 'package:flutter_template/src/managers/config_manager.dart';

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
      color: ConfigManager().colors.KPrimary.withOpacity(0.2),
      spreadRadius: -5,
      blurRadius: 5,
      offset: const Offset(0, 4),
    );
