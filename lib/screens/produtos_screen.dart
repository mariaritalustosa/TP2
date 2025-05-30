import 'package:flutter/material.dart';
import 'package:tp2/database/app_database.dart';

class Produtos extends StatefulWidget {
  final AppDatabase db;
  const Produtos({super.key, required this.db});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  late final Stream<List<Produto>> _produtosStream;

  @override
  void initState() {
    super.initState();
    _produtosStream = widget.db.select(widget.db.produtos).watch();
  }

  void _adicionarProduto() async {
    final nomeController = TextEditingController();
    final valorController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Novo Produto'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: valorController,
              decoration: const InputDecoration(labelText: 'Valor'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              final nome = nomeController.text;
              final preco = double.tryParse(valorController.text) ?? 0.0;
              if (nome.isNotEmpty) {
                await widget.db.into(widget.db.produtos).insert(
                      ProdutosCompanion.insert(
                        nome: nome,
                        preco: preco,
                      ),
                    );
              }
              Navigator.pop(context);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  void _removerProduto(int id) async {
    await (widget.db.delete(widget.db.produtos)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      body: StreamBuilder<List<Produto>>(
        stream: _produtosStream,
        builder: (context, snapshot) {
          final produtos = snapshot.data ?? [];

          if (produtos.isEmpty) {
            return const Center(child: Text('Nenhum produto cadastrado.'));
          }

          return ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              final produto = produtos[index];
              return Dismissible(
                key: Key(produto.id.toString()),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (_) => _removerProduto(produto.id),
                child: ListTile(
                  title: Text(produto.nome),
                  subtitle: Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarProduto,
        child: const Icon(Icons.add),
      ),
    );
  }
}
