import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/database/app_database.dart';
import 'package:drift/drift.dart';

class ProdutosScreen extends StatelessWidget {
  const ProdutosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return Scaffold(
      body: FutureBuilder<List<Produto>>(
        future: database.getAllProdutos(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError){
            return Center(child: Text('Erro ao carregar os produtos: ${snapshot.error}'),);
          }

          final produtos = snapshot.data ?? [];

          if(produtos.isEmpty){
            return const Center(child: Text('Nenhum produto cadastrado.'),);
          }

          return LayoutBuilder(
            builder: (context, constraints){
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: produtos.length,
                itemBuilder: (context, index){
                  final produto = produtos[index];
                },
              )
            })
        }
        ),
    );
  }
 

}
