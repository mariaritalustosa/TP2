import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:tp2/screens/tela_principal.dart';
import 'package:tp2/themes/themes.dart';


class ProdutosScreen extends StatefulWidget {
  const ProdutosScreen({super.key});

  @override

State<ProdutosScreen> createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen>{

  late AppDatabase database;
  late Future <List<Produto>> produtosFuture;

  @override
  void initState(){
    super.initState();
    database = Provider.of<AppDatabase>(context, listen: false);
    _carregarProdutos();
  }

  void _carregarProdutos(){
    setState((){
      produtosFuture = database.getAllProdutos();
    });
  }

  Future<void> _adicionarProduto() async {
    final nomeController = TextEditingController();
    final precoController = TextEditingController();

    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adicionar Produto'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomeController,
              decoration: AppTheme.inputDecoration.copyWith(labelText: 'Nome'),
            ),
            const SizedBox(height: 3),
            TextField(
              controller: precoController,
              decoration: AppTheme.inputDecoration.copyWith(labelText: 'Preço'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
        actions: [
          TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text('Cancelar'),
          ),
          ElevatedButton(
          onPressed: () async{
            final nome = nomeController.text.trim();
            final preco = double.tryParse(precoController.text.trim()) ?? 0.0;

            if(nome.isNotEmpty){
              await database.insertProduto(
                ProdutosCompanion(
                  nome: drift.Value(nome),
                  preco: drift.Value(preco),
                ),
              );
              Navigator.pop(context, true);
            }
          },
          child: Text('Salvar'),
          ),
        ],
      ),
    );
    if(confirmado == true){
      _carregarProdutos();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TelaPrincipal()),);
          }
        ),
      ),
      body: FutureBuilder<List<Produto>>(
        future: produtosFuture,
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

                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text('ID: ${produto.id} - ${produto.nome}'),
                      subtitle: Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(icon: const Icon(Icons.edit),
                          onPressed: () async{
                            final nomeController = TextEditingController(text: produto.nome);
                            final precoController = TextEditingController(text: produto.preco.toString());

                            final confirmado = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Editar informações do produto'),
                                content: Column(mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: nomeController,
                                    decoration: const InputDecoration(labelText: 'Nome'),
                                  ),
                                  TextField(
                                    controller: precoController,
                                    decoration: const InputDecoration(labelText: 'Preço'),
                                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                                  ),
                                ],
                                ),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context, false),
                                   child: Text('Cancelar'),
                                   ),
                                   ElevatedButton(onPressed: () async{
                                    final novoNome = nomeController.text;
                                    final novoPreco = double.tryParse(precoController.text) ?? produto.preco;

                                    final db = Provider.of<AppDatabase>(context, listen: false);

                                    final produtoAtualizado = Produto(id: 
                                    produto.id,
                                    nome: novoNome, 
                                    preco: novoPreco,
                                    );

                                    await db.updateProduto(produtoAtualizado);
                                    Navigator.pop(context, true);
                                   },
                                   child: Text('Salvar'),
                                   ),
                                ],
                              ),
                            );

                            if(confirmado == true){
                              _carregarProdutos();
                            }
                          },),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async{
                              await database.deleteProduto(produto.id);
                              _carregarProdutos();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarProduto,
        child: Icon(Icons.add),
        tooltip: 'Adicionar Produtos',
      ),
    );
  }
}
