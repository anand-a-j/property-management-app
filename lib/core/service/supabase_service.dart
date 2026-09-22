import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseService._();

  static final SupabaseService instance = SupabaseService._();

  late final SupabaseClient client;

  Future<void> init() async {
    // TODO : IMPORTANT
    await Supabase.initialize(
      url: "https://nsufyrwiwiicarpzlmtq.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5zdWZ5cndpd2lpY2FycHpsbXRxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUyNzYyNjgsImV4cCI6MjA5MDg1MjI2OH0.5JkvzjCdE7xxBvRCj-TaoUqVK8uSxXqL69ODi25Ea38",
    );

    client = Supabase.instance.client;
  }
}

final supabaseService = SupabaseService.instance;
