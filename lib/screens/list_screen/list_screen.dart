import 'package:flutter/cupertino.dart';
import 'package:misis/figma/styles.dart';
import 'package:misis/mvvm/observer.dart';
import 'package:misis/screens/list_screen/view_models/list_view_model.dart';
import 'package:misis/widgets/misis_progress_indicator/misis_progress_indicator.dart';

final class ListScreen extends StatefulWidget {
  final ListViewModel vm;

  const ListScreen({required this.vm, super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

final class _ListScreenState extends State<ListScreen> implements EventObserver {
  TextEditingController textEditingController = TextEditingController();

  ListLoadingState _state = ListLoadingState.isLoading;
  List<IdentifiableModel> _models = [];
  String _error = "";

  @override
  void initState() {
    widget.vm.subscribe(this);
    widget.vm.loadData();

    super.initState();
    textEditingController.addListener(() { widget.vm.searchListener(textEditingController.text); });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    widget.vm.unsubscribe(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: Border(bottom: BorderSide(color: CupertinoTheme.of(context).barBackgroundColor))
      ),
      child:
        SafeArea(child:
          switch (_state) {
            ListLoadingState.isLoading =>
              const Center(child: MisisProgressIndicator()),
            ListLoadingState.dataLoaded =>
              SearchableListingWidget(
                title: widget.vm.title,
                controller: textEditingController,
                models:  _models,
                onTap: (int id, BuildContext context) => widget.vm.onTap(id, context),
              ),
            ListLoadingState.loadingError =>
              Text(_error),
          }
        )
    );
  }
  
  @override
  void notify(ViewEvent event) {
    if (event is LoadingEvent) {
      setState(() {
        _state = ListLoadingState.isLoading;
      });
    } else if (event is ListDataLoadedEvent) {
      setState(() {
        _state = ListLoadingState.dataLoaded;
        _models = event.data;
      });
    } else if (event is LoadingErrorEvent) {
      setState(() {
        _state = ListLoadingState.loadingError;
        _error = event.error;
      });
    } else if (event is SearchEvent) {
      setState(() {
        _models = event.foundData;
      });
    }
  }
}

class SearchableListingWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final List<IdentifiableModel> models;
  final Function onTap;

  const SearchableListingWidget({
    required this.title,
    required this.controller,
    required this.models,
    required this.onTap,
    super.key
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: CupertinoTextField(
            controller: controller,
            placeholder: 'Поиск',
            decoration: BoxDecoration(
              border: Border.all(color: FigmaColors.primary, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(8))
            )
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemCount: models.length,
              itemBuilder: (BuildContext context, int index) {
                final model = models[index];
                return ListItemWidget(
                  title: model.name,
                  onTap: () async { onTap(model.id, context); }
                );
              },
            )
          )
        )
      ],
    );
  }  
}

class ListItemWidget extends StatelessWidget {
  final Function onTap;
  final String title;

  const ListItemWidget({required this.title, required this.onTap, super.key});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async { onTap(); },
      child: CupertinoListTile(title: Text(title))
    );
  }
}
