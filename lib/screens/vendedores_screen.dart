import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:tp2/screens/tela_principal.dart';


class VendedoresScreen extends StatefulWidget {
  const VendedoresScreen({super.key});

  @override
State<VendedoresScreen> createState() => _VendedoresScreenState();
}

class _VendedoresScreenState extends State<VendedoresScreen>{

  late AppDatabase database;
  late Future <List<Vendedore>> vendedoresFuture;

  @override
  void initState(){
    super.initState();
    database = Provider.of<AppDatabase>(context, listen: false);
    _carregarVendedores();
  }

  void _carregarVendedores(){
    setState((){
      vendedoresFuture = database.getAllVendedores();
    });
  }

  Future<void> _adicionarVendedor() async {
    final nomeController = TextEditingController();

    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adicionar Vendedor'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
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

            if(nome.isNotEmpty){
              await database.insertVendedor(
                VendedoresCompanion(
                  nome: drift.Value(nome),
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
      _carregarVendedores();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TelaPrincipal()),);
          }
        ),
      ),
      body: FutureBuilder<List<Vendedore>>(
        future: vendedoresFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError){
            return Center(child: Text('Erro ao carregar os vendedores ${snapshot.error}'),);
          }

          final vendedores = snapshot.data ?? [];

          if(vendedores.isEmpty){
            return const Center(child: Text('Nenhum vendedor cadastrado.'),);
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
