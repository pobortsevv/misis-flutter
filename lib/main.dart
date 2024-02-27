import 'package:flutter/material.dart';
import 'package:misis/models/Domain/filial.dart';
import 'package:misis/models/Domain/group.dart';
import 'package:misis/models/Domain/room.dart';
import 'package:misis/models/Domain/teacher.dart';
import 'package:misis/provider/provider.dart';
import 'package:misis/router/app_router.dart';
import 'package:misis/widgets/misis_progress_indicator/misis_progress_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.shared,
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late final AppProvider provider;
//   late Future<List<Teacher>> futureModels;

//   @override
//   void initState() {
//     provider = AppProviderImp();
//     futureModels = provider.fetchTeachers(880);

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<List<Teacher>>(
//             future: futureModels,
//             builder: (context, snapshot) {


//               // if (snapshot.hasData) {
//               //   return ListView.builder(
//               //     itemCount: snapshot.data?.length,
//               //     itemBuilder: (BuildContext context, int index) {
//               //       final model = snapshot.data![index];

//               //       return ListTile(
//               //         title: Text(model.lastName)
//               //       );
//               //     },
//               //   );
//               // } else if (snapshot.hasError) {
//               //   return Text('${snapshot.error}');
//               // }

//               // By default, show a loading spinner.
//               return const MisisProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }