import 'package:connectivity/connectivity.dart';
import 'package:f_web_service_random_user_template/core/network_info.dart';
import 'package:f_web_service_random_user_template/data/repositories/user_repository.dart';
import 'package:f_web_service_random_user_template/domain/use_case/users.dart';
import 'package:f_web_service_random_user_template/ui/controllers/home_controller.dart';
import 'package:f_web_service_random_user_template/ui/home.dart';
import 'package:f_web_service_random_user_template/ui/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:loggy/loggy.dart';

Future<Widget> createHomeScreen() async {
  WidgetsFlutterBinding.ensureInitialized();

  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put(Connectivity());
  Connectivity c = Get.find();
  Get.put(NetworkInfo(connectivity: c));
  Get.put(UserRepository());
  Get.put(Users());
  Get.put(HomeController());
  return const Home();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Complete test", (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);

    // delete all
    await tester.tap(find.byKey(const Key('deleteAllButton')));

    await tester.pumpAndSettle();

    // verify
    expect(find.byType(ListItem), findsNothing);

    // add two users
    expect(find.byKey(const Key('addUserButton')), findsOneWidget);

    await tester.tap(find.byKey(const Key('addUserButton')));

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));

    await tester.tap(find.byKey(const Key('addUserButton')));

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));

    // verify
    expect(find.byType(ListItem), findsNWidgets(2));

    // swipe to delete the first one

    // verify

    // delete all
    await tester.tap(find.byKey(const Key('deleteAllButton')));

    await tester.pumpAndSettle();

    // verify
    expect(find.byType(ListItem), findsNothing);
  });
}
