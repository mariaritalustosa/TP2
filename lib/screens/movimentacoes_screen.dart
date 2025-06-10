import 'package:flutter/material.dart';
import 'package:tp2/database/app_database.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' hide Column;

class MovimentacoesScreen extends StatefulWidget {
  const MovimentacoesScreen({super.key});

  @override
  State<MovimentacoesScreen> createState() => _MovimentacoesScreenState();
}

class _MovimentacoesScreenState extends State<MovimentacoesScreen> {
  late Future<List<Movimentacao>> _futureMovimentacoes;
  late AppDatabase database;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      database = Provider.of<AppDatabase>(context, listen: false);
      _carregarMovimentacoes();
    });
  }

  void _carregarMovimentacoes() {
    setState(() {
      _futureMovimentacoes = database.getMovimentacoesComDetalhes();
    });
  }

  Future<void> _abrirFormularioMovimentacao(String tipo) async {
    final produtos = await database.getAllProdutos();
    final clientes = await database.getAllClientes();
    final vendedores = await database.getAllVendedores();

    Produto? produtoSelecionado;
    Cliente? clienteSelecionado;
    Vendedore? vendedorSelecionado;
    final quantidadeController = TextEditingController();
    DateTime dataSelecionada = DateTime.now();

    final formKey = GlobalKey<FormState>();

    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tipo == 'entrada' ? 'Registrar Compra' : 'Registrar Venda'),
        content: StatefulBuilder(
          builder: (context, setStateDialog) {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<Produto>(
                      decoration: InputDecoration(labelText: 'Produto'),
                      items: produtos
                          .map((p) => DropdownMenuItem(
                                value: p,
                                child: Text(p.nome),
                              ))
                          .toList(),
                      onChanged: (p) => setStateDialog(() => produtoSelecionado = p),
                      validator: (p) => p == null ? 'Selecione um produto' : null,
                    ),
                    TextFormField(
                      controller: quantidadeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Quantidade'),
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Informe a quantidade';
                        if (int.tryParse(v) == null || int.parse(v) <= 0) return 'Quantidade inválida';
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () async {
                        final data = await showDatePicker(
                          context: context,
                          initialDate: dataSelecionada,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (data != null) {
                          setStateDialog(() => dataSelecionada = data);
                        }
                      },
                      child: Text('Selecionar Data: ${dataSelecionada.toLocal().toString().split(' ')[0]}'),
                    ),
                    DropdownButtonFormField<Cliente>(
                      decoration: InputDecoration(labelText: 'Cliente (opcional)'),
                      items: [null, ...clientes]
                          .map((c) => DropdownMenuItem(
                                value: c,
                                child: Text(c?.nome ?? 'Nenhum'),
                              ))
                          .toList(),
                      onChanged: (c) => setStateDialog(() => clienteSelecionado = c),
                    ),
                    DropdownButtonFormField<Vendedore>(
                      decoration: InputDecoration(labelText: 'Vendedor (opcional)'),
                      items: [null, ...vendedores]
                          .map((v) => DropdownMenuItem(
                                value: v,
                                child: Text(v?.nome ?? 'Nenhum'),
                              ))
                          .toList(),
                      onChanged: (v) => setStateDialog(() => vendedorSelecionado = v),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState?.validate() != true || produtoSelecionado == null) return;

              await database.insertMovimentacao(MovimentacoesCompanion.insert(
                tipo: tipo,
                quantidade: int.parse(quantidadeController.text),
                data: dataSelecionada,
                produtoId: produtoSelecionado!.id,
                clienteId: Value(clienteSelecionado?.id),
                vendedorId: Value(vendedorSelecionado?.id),
              ));

              Navigator.pop(context, true);
            },
            child: Text('Salvar'),
          ),
        ],
      ),
    );

    if (confirmado == true) {
      _carregarMovimentacoes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movimentações'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Movimentacao>>(
        future: _futureMovimentacoes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma movimentação encontrada.'));
          } else {
            final movimentacoes = snapshot.data!;
            return ListView.builder(
              itemCount: movimentacoes.length,
              itemBuilder: (context, index) {
                final m = movimentacoes[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: Icon(
                      m.tipo == 'entrada' ? Icons.call_received : Icons.call_made,
                      color: m.tipo == 'entrada' ? Colors.green : Colors.red,
                    ),
                    title: Text(m.nomeProduto),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tipo: ${m.tipo}'),
                        Text('Quantidade: ${m.quantidade}'),
                        Text('Data: ${m.data.toLocal().toString().split(' ')[0]}'),
                        if (m.nomeCliente != null) Text('Cliente: ${m.nomeCliente}'),
                        if (m.nomeVendedor != null) Text('Vendedor: ${m.nomeVendedor}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: 'btnCompra',
            onPressed: () => _abrirFormularioMovimentacao('entrada'),
            label: const Text('Registrar Compra'),
            icon: const Icon(Icons.add_shopping_cart),
            backgroundColor: Colors.green,
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            heroTag: 'btnVenda',
            onPressed: () => _abrirFormularioMovimentacao('saida'),
            label: const Text('Registrar Venda'),
            icon: const Icon(Icons.shopping_cart_checkout),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
