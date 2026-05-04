import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter_by_examples/features/bmi_calc/bmi_calc_app.dart';
// import 'package:learn_flutter_by_examples/features/joke_app_poc/joke_app.dart';
// import 'package:learn_flutter_by_examples/features/theme_app/theme_app.dart';
// import 'package:learn_flutter_by_examples/features/employee_riverpod_crud/employee_riverpod_crud.dart';
// import 'package:learn_flutter_by_examples/features/appbar_with_tabs/appbar_with_tab.dart';
// import 'package:learn_flutter_by_examples/features/riverpod_from_t/t_app_5.dart';
// import 'package:learn_flutter_by_examples/features/user_crud_app/my_user_app.dart';
// import 'package:learn_flutter_by_examples/features/riverpod_poc/riverpod_app.dart';
// import 'package:learn_flutter_by_examples/features/go_router_poc/pages/login.dart';
// import 'package:learn_flutter_by_examples/features/responsive_app_1/responsive_main.dart';
// import 'package:learn_flutter_by_examples/features/go_router_poc/go_router_example.dart';
// import 'package:learn_flutter_by_examples/features/scroll_poc/scroll_items.dart';
// import 'package:learn_flutter_by_examples/features/school_app_1/index.dart';

// void main() => runApp(GoRouterExample());

// void main() => runApp(InfiniteScrollApp());

// void main() => runApp(SchoolApp());

// void main() => runApp(LoginExampleApp());

// void main() => runApp(const MyResponsiveApp());

// void main() => runApp(ProviderScope(child: MyRiverPodApp()));

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();

//   runApp(const ProviderScope(child: MyUserCrudApp()));
// }

// void main() => runApp(ProviderScope(child: MyAppWithTabs()));
// void main() => runApp(ProviderScope(child: MyRiverPodAppFromT()));
void main() => runApp(ProviderScope(child: BMICalculator()));
// void main() => runApp(const ProviderScope(child: MyEmployeeApp()));

// void main() => runApp(MyThemeApp());
// void main() => runApp(JokeApp());
