import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';


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
  TextColumn get tipo => text().withLength(min: 3, max: 10)();
  IntColumn get quantidade => integer()();
  DateTimeColumn get data => dateTime()();

  IntColumn get produtoId => integer().references(Produtos, #id)();
  IntColumn get clienteId =>
      integer().nullable().references(Clientes, #id)();
  IntColumn get vendedorId =>
      integer().nullable().references(Vendedores, #id)();
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
  Future<List<Movimentacoe>> getMovimentacoesByProduto(int produtoId) =>
      (select(movimentacoes)..where((m) => m.produtoId.equals(produtoId))).get();
  Future<int> insertMovimentacao(Insertable<Movimentacoe> m) =>
      into(movimentacoes).insert(m);
  Future<bool> updateMovimentacao(Insertable<Movimentacoe> m) =>
      update(movimentacoes).replace(m);
  Future<int> deleteMovimentacao(int id) =>
      (delete(movimentacoes)..where((t) => t.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final pasta = await getApplicationDocumentsDirectory();
    final file = File(p.join(pasta.path, 'app_db.sqlite'));
    return NativeDatabase(file);
  });
}
