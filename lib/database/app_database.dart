import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

// Tabelas
class Produtos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 5, max: 100)();
  RealColumn get preco => real()();
}

class Clientes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 5, max: 50)();
}

class Vendedores extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 5, max: 50)();
}

class Movimentacoes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tipo => text().withLength(min: 3, max: 10)(); // Compra ou Venda
  IntColumn get quantidade => integer()();
  DateTimeColumn get data => dateTime()();

  IntColumn get produtoId => integer().references(Produtos, #id)();
  IntColumn get clienteId => integer().nullable().references(Clientes, #id)();
  IntColumn get vendedorId => integer().nullable().references(Vendedores, #id)();
}

class Movimentacao {
  final int idProduto;
  final String nomeProduto;
  final String tipo;
  final DateTime data;
  final int quantidade;
  final int? idCliente;
  final String? nomeCliente;
  final int? idVendedor;
  final String? nomeVendedor;

  Movimentacao({
    required this.idProduto,
    required this.nomeProduto,
    required this.tipo,
    required this.data,
    required this.quantidade,
    this.idCliente,
    this.nomeCliente,
    this.idVendedor,
    this.nomeVendedor,
  });
}

@DriftDatabase(tables: [Produtos, Clientes, Vendedores, Movimentacoes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //CRUD de produtos
  Future<List<Produto>> getAllProdutos() => select(produtos).get();
  Future<int> insertProduto(Insertable<Produto> p) => into(produtos).insert(p);
  Future<bool> updateProduto(Insertable<Produto> p) => update(produtos).replace(p);
  Future<int> deleteProduto(int id) =>
      (delete(produtos)..where((t) => t.id.equals(id))).go();

  //CRUD de clientes
  Future<List<Cliente>> getAllClientes() => select(clientes).get();
  Future<int> insertCliente(Insertable<Cliente> c) => into(clientes).insert(c);

  //CRUD de vendedores
  Future<List<Vendedore>> getAllVendedores() => select(vendedores).get();
  Future<int> insertVendedor(Insertable<Vendedore> v) => into(vendedores).insert(v);
  Future<int> deleteVendedor(int id) =>
      (delete(vendedores)..where((t) => t.id.equals(id))).go();

  //CRUD das movimentacoes
  Future<List<Movimentacoe>> getAllMovimentacoes() => select(movimentacoes).get();
  Future<int> insertMovimentacao(Insertable<Movimentacoe> m) =>
      into(movimentacoes).insert(m);
  Future<bool> updateMovimentacao(Insertable<Movimentacoe> m) =>
      update(movimentacoes).replace(m);
  Future<int> deleteMovimentacao(int id) =>
      (delete(movimentacoes)..where((t) => t.id.equals(id))).go();

  Future<List<Movimentacao>> getMovimentacoesComDetalhes() {
    final query = (select(movimentacoes).join([
      innerJoin(produtos, produtos.id.equalsExp(movimentacoes.produtoId)),
      leftOuterJoin(clientes, clientes.id.equalsExp(movimentacoes.clienteId)),
      leftOuterJoin(vendedores, vendedores.id.equalsExp(movimentacoes.vendedorId)),
    ])..orderBy([
      OrderingTerm(expression: movimentacoes.data, mode: OrderingMode.desc),
    ]));

    return query.map((row) {
      final movimentacao = row.readTable(movimentacoes);
      final produto = row.readTable(produtos);
      final cliente = row.readTableOrNull(clientes);
      final vendedor = row.readTableOrNull(vendedores);

      return Movimentacao(
        idProduto: produto.id,
        nomeProduto: produto.nome,
        tipo: movimentacao.tipo,
        data: movimentacao.data,
        quantidade: movimentacao.quantidade,
        idCliente: cliente?.id,
        nomeCliente: cliente?.nome,
        idVendedor: vendedor?.id,
        nomeVendedor: vendedor?.nome,
      );
    }).get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final pasta = await getApplicationDocumentsDirectory();
    final file = File(p.join(pasta.path, 'app_db.sqlite'));
    return NativeDatabase(file);
  });
}
