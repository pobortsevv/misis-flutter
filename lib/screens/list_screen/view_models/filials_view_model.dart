import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:misis/models/Domain/filial.dart';
import 'package:misis/provider/provider.dart';
import 'package:misis/screens/list_screen/view_models/list_view_model.dart';

final class FilialsViewModel extends ListViewModel<Filial> {
  @override
  final String title = 'Выберите филиал';
  final AppProvider provider;
  late final Future<List<Filial>> filials;

  FilialsViewModel({required this.provider});

  @override
  Future<List<Filial>> getModelsList() {
    filials = provider.fetchFilials();

    return filials;
  }

  @override
  void onTap(int id, BuildContext context) async {
    final filials = await this.filials;
    final selectedFilial = filials.firstWhere((element) => element.id == id);

    if (context.mounted) context.pushNamed(FilialsRoute.status.name, extra: selectedFilial);
  }
}

enum FilialsRoute {
  status
}