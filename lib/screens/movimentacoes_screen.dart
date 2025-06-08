import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/database/app_database.dart'; 
import 'package:tp2/models/movimentacoes_viewmodel.dart'; 

class MovimentacoesScreen extends StatefulWidget {
  const MovimentacoesScreen({super.key});

  @override
  State<MovimentacoesScreen> createState() => _MovimentacoesScreenState();
}

class _MovimentacoesScreenState extends State<MovimentacoesScreen> {
  late MovimentacoesViewModel viewModel;

  @override
  void initState() {
    super.initState();

    Future.microtask((){
    viewModel = context.read<MovimentacoesViewModel>();
    viewModel.carregarMovimentacoes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movimentações'),
      ),
      body: Consumer<MovimentacoesViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.movimentacoes.isEmpty) {
            return const Center(child: Text('Nenhuma movimentação encontrada.'));
          }

          return ListView.builder(
            itemCount: vm.movimentacoes.length,
            itemBuilder: (context, index) {
              final mov = vm.movimentacoes[index];

              return ListTile(
                title: Text('${mov.nomeProduto} (ID: ${mov.idProduto})'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tipo: ${mov.tipo}'),
                    Text('Quantidade: ${mov.quantidade}'),
                    Text('Data: ${mov.data.toLocal().toString().split(" ")[0]}'),
                    Text('Cliente: ${mov.nomeCliente ?? 'N/A'} (ID: ${mov.idCliente ?? '-'})'),
                    Text('Vendedor: ${mov.nomeVendedor ?? 'N/A'} (ID: ${mov.idVendedor ?? '-'})'),
                  ],
                ),
                isThreeLine: true,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarMovimentacao(context),
        child: Icon(Icons.add),
        tooltip: 'Adicionar uma Movimentação',
        ),
    );
  }

  Future<void> _adicionarMovimentacao(BuildContext context) async{
    final produtos = await viewModel.db.getAllProdutos();
    final clientes = await viewModel.db.getAllClientes();
    final vendedores = await viewModel;db.getAllVendedores();

    Produto? produtoSelecionado;
    Cliente? clienteSelecionado;
    Vendedore? vendedorSelecionado;
    String tipo = 'Compra';
    final TextEditingController _quantidadeController = 
  }
}


