import 'package:flutter/material.dart';
import 'package:tp2/database/app_database.dart';

class MovimentacoesViewModel extends ChangeNotifier {
  final AppDatabase _db;

  List<Movimentacao> movimentacoes = [];
  bool isLoading = false;

  MovimentacoesViewModel(this._db);

  Future<void> carregarMovimentacoes() async {
    isLoading = true;
    notifyListeners();

    movimentacoes = await _db.getMovimentacoesComDetalhes();

    isLoading = false;
    notifyListeners();
  }
}
