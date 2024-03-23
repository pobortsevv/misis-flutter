import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:misis/models/Domain/filial.dart';
import 'package:misis/provider/provider.dart';
import 'package:misis/screens/list_screen/view_models/list_view_model.dart';

final class FilialsViewModel extends ListViewModel<Filial> {
  @override
  final String title = 'Выберите филиал';
  late List<Filial> _allFilials;

  final AppProvider _provider;

  FilialsViewModel({
    required AppProvider provider
  }) : _provider = provider;

  @override
  void loadData() {
    notify(LoadingEvent(isLoading: true));
    _provider.fetchFilials().then((value) {
      _allFilials = value;
      notify(ListDataLoadedEvent(data: value));
    }).catchError((onError) {
      notify(LoadingErrorEvent(error: onError));
    });
  }

  @override
  void onTap(int id, BuildContext context) {
    final filials = _allFilials;
    final selectedFilial = filials.firstWhere((element) => element.id == id);

    if (context.mounted) context.pushNamed(FilialsRoute.status.name, extra: selectedFilial);
  }
}

enum FilialsRoute { status }
