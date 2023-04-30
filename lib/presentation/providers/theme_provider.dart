import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final isDarkmodeProvider = StateProvider<bool>((ref) => false);

final colorListProvider = Provider<List<Color>>((ref) => colorList);
