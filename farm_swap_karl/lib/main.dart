import "package:farm_swap_karl/routes/routes.dart";
import "package:flutter/material.dart";

void main() {
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
