import 'package:myapp/app/modules/home/models/filtre_model.dart';

class FiltredService {
  Future<List<Filtred>> getAllFiltred() async {
    await Future.delayed(const Duration(seconds: 3));
    List<Filtred> list = [];

    list.add(Filtred(name: "All"));
    list.add(Filtred(name: "Category"));
    list.add(Filtred(name: "Top"));
    list.add(Filtred(name: "Recommended"));
    return list;
  }
}