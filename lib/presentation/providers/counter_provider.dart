import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 5);

final boolProvider = StateProvider<bool>((ref) => true);

final stringProvider = StateProvider<String>((ref) => 'Luis');
