import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/database/app_database.dart';

class MovimentacoesScreen extends StatefulWidget{
  final int produtoId;
  final String produtoNome;

  const MovimentacoesScreen({
    super.key,
    required this.produtoId,
    required this.produtoNome,
  });

  @override
  State<MovimentacoesScreen> createState() => _MovimentacoesScreenState();
}
class _MovimentacoesScreenState extends State<MovimentacoesScreen>{
  final _formKey = GlobalKey<FormState>();
  final _tipoController = TextEditingController();
}  
