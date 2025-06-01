import 'package:flutter/material.dart';

class TelaAtualProvider with ChangeNotifier{
  int _indice = 0;

  int get indice => _indice;

  void mudarIndice(int novoIndice){
    _indice = novoIndice;
    notifyListeners();
  }
}