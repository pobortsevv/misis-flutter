import 'package:flutter/material.dart';
import 'package:misis/screens/list_screen/view_models/list_view_model.dart';
import 'package:misis/widgets/misis_progress_indicator/misis_progress_indicator.dart';

class ListScreen extends StatefulWidget {
  final ListViewModel vm;

  const ListScreen({required this.vm, super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.vm.title)
        ),
        body: Center(
          child: FutureBuilder<List<IdentifiableModel>>(
            future: widget.vm.getModelsList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final model = snapshot.data![index];

                    return GestureDetector(
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8.0,
                          ),
                          child: ListTile(title: Text(model.name)),
                      ),
                      onTap: () => widget.vm.onTap(model.id, context)
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const MisisProgressIndicator();
            },
          ),
        ),
      );
  }
}
