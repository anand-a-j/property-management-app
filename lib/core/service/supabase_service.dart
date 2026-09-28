import 'dart:developer';

import 'package:naseem/core/constants/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseService._();

  static final SupabaseService instance = SupabaseService._();

  late final SupabaseClient client;

  Future<void> init() async {
    log("keys test  URL: ${Env.supabaseUrl}");

    log("supabasePublishableKey: ${Env.supabasePublishableKey}");
    try {
      await Supabase.initialize(
        url: "https://papxwknhqckfcyzwurhp.supabase.co",
        publishableKey: "sb_publishable_smBksUe2Zd-wcqJyICQX6A_JlnOyzel",
      );

      client = Supabase.instance.client;
    } catch (e) {
      log("suppabase connect error : ${e.toString()}");
    }
  }
}

final supabaseService = SupabaseService.instance;
