import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'package:cps_ipn_app/services/push_notifications_services.dart';
import 'package:cps_ipn_app/providers/sliders_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';

//import 'widgets/widgets.dart';
//import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await PushNotificationsServices.initializeApp();
  //await Supabase.initialize(
  //  url: 'nuerubnfcivddxflfwls.supabase.co',
  //  anonKey:
  //      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51ZXJ1Ym5mY2l2ZGR4Zmxmd2xzIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1NTU0MDI5MCwiZXhwIjoyMDcxMTE2MjkwfQ.xyZVXZjABezJQwFYT5YmfZlbUOtOtRZW01PWNM4qUUw',
  //  );
  runApp(const AppState());
}

class AppState extends StatefulWidget {
  const AppState({super.key});

  @override
  State<AppState> createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  @override
  void initState() {
    super.initState();
    // Initialize any services or providers here if needed
    PushNotificationsServices.messageStream.listen((message) {
      // Handle incoming messages from the push notification service
      print("New message in myapp: $message");

      final snackBar = SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderProvider(), lazy: false),
      ],
      child: MyApp(),
    );
  }
}

Future<void> setup() async {
  await dotenv.load(fileName: ".env");
  MapboxOptions.setAccessToken(dotenv.env['MAPBOX_ACCESS_TOKEN']!);
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CPS - IPN',
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      routes: {
        '/': (_) => SplashPage(),
        'home': (_) => HomeScreen(),

        /* 'social': (_) => SocialLinksScreen(),*/
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: const Color.fromARGB(255, 194, 226, 196),
        ),
      ),
    );
  }
}
