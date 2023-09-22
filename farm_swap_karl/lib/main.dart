import "package:farm_swap_karl/routes/routes.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

Future main() async {
  //ENSURE THAT ASSYNCHRONOUS TASKS ARE BEING INITIALIZED
  WidgetsFlutterBinding.ensureInitialized;

  /*A CONDITION THAT CHECKS IF THE APP IS RUNNING ON A WEB PLATFORM
  IF IT IS, THEN THIS WILL INITIALIZE THE FIREBASE FIRESTORE DATABASE
  */
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDbZpBhzByJp9w4xIXHhwsxSLXCvDTpQAI",
        appId: "1:69776895929:web:036ee729e2199f1a3c5068",
        messagingSenderId: "69776895929",
        projectId: "farmswapsample",
      ),
    );
  }

//INITIALIZE THE PLATFORM TO USE THE FIREBASE
await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      /*SETTING THE INITIAL ROUTER, OR ROUTE THAT WILL FIRST APPEAR USING THE
      ROUTESMANAGER CLASS AND CALL A PARTICULAR PAGE THAT WE CREATE IN ROUTES.DART CLASS */
      initialRoute: RoutesManager.introPage,
      /* USING THE ROUTES MAANGER CLASS AND CALL THE ROUTES MANAGER METHOD SO THAT
      EVERY TIME THE ROUTES MANAGER SUMMONS A PAGE, THE PAGE NAME WILL BE PUT
      INSIDE THE GENERATE ROUTE AND THEN USED IN THE SWITCH STATEMENT INSIDE THE 
      METHOD TO CHOOSE WHICH PAGE TO GO*/
      onGenerateRoute: RoutesManager.generateRoute,
    );
  }
}
