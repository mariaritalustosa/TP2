// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProdutosTable extends Produtos with TableInfo<$ProdutosTable, Produto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProdutosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 5,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precoMeta = const VerificationMeta('preco');
  @override
  late final GeneratedColumn<double> preco = GeneratedColumn<double>(
    'preco',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome, preco];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'produtos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Produto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('preco')) {
      context.handle(
        _precoMeta,
        preco.isAcceptableOrUnknown(data['preco']!, _precoMeta),
      );
    } else if (isInserting) {
      context.missing(_precoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Produto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Produto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      preco: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}preco'],
      )!,
    );
  }

  @override
  $ProdutosTable createAlias(String alias) {
    return $ProdutosTable(attachedDatabase, alias);
  }
}

class Produto extends DataClass implements Insertable<Produto> {
  final int id;
  final String nome;
  final double preco;
  const Produto({required this.id, required this.nome, required this.preco});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['preco'] = Variable<double>(preco);
    return map;
  }

  ProdutosCompanion toCompanion(bool nullToAbsent) {
    return ProdutosCompanion(
      id: Value(id),
      nome: Value(nome),
      preco: Value(preco),
    );
  }

  factory Produto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Produto(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      preco: serializer.fromJson<double>(json['preco']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'preco': serializer.toJson<double>(preco),
    };
  }

  Produto copyWith({int? id, String? nome, double? preco}) => Produto(
    id: id ?? this.id,
    nome: nome ?? this.nome,
    preco: preco ?? this.preco,
  );
  Produto copyWithCompanion(ProdutosCompanion data) {
    return Produto(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      preco: data.preco.present ? data.preco.value : this.preco,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Produto(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('preco: $preco')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, preco);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Produto &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.preco == this.preco);
}

class ProdutosCompanion extends UpdateCompanion<Produto> {
  final Value<int> id;
  final Value<String> nome;
  final Value<double> preco;
  const ProdutosCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.preco = const Value.absent(),
  });
  ProdutosCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required double preco,
  }) : nome = Value(nome),
       preco = Value(preco);
  static Insertable<Produto> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<double>? preco,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (preco != null) 'preco': preco,
    });
  }

  ProdutosCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<double>? preco,
  }) {
    return ProdutosCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      preco: preco ?? this.preco,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (preco.present) {
      map['preco'] = Variable<double>(preco.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProdutosCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('preco: $preco')
          ..write(')'))
        .toString();
  }
}

class $ClientesTable extends Clientes with TableInfo<$ClientesTable, Cliente> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 5,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clientes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Cliente> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cliente map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cliente(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
    );
  }

  @override
  $ClientesTable createAlias(String alias) {
    return $ClientesTable(attachedDatabase, alias);
  }
}

class Cliente extends DataClass implements Insertable<Cliente> {
  final int id;
  final String nome;
  const Cliente({required this.id, required this.nome});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    return map;
  }

  ClientesCompanion toCompanion(bool nullToAbsent) {
    return ClientesCompanion(id: Value(id), nome: Value(nome));
  }

  factory Cliente.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cliente(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
    };
  }

  Cliente copyWith({int? id, String? nome}) =>
      Cliente(id: id ?? this.id, nome: nome ?? this.nome);
  Cliente copyWithCompanion(ClientesCompanion data) {
    return Cliente(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cliente(')
          ..write('id: $id, ')
          ..write('nome: $nome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cliente && other.id == this.id && other.nome == this.nome);
}

class ClientesCompanion extends UpdateCompanion<Cliente> {
  final Value<int> id;
  final Value<String> nome;
  const ClientesCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
  });
  ClientesCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
  }) : nome = Value(nome);
  static Insertable<Cliente> custom({
    Expression<int>? id,
    Expression<String>? nome,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
    });
  }

  ClientesCompanion copyWith({Value<int>? id, Value<String>? nome}) {
    return ClientesCompanion(id: id ?? this.id, nome: nome ?? this.nome);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientesCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome')
          ..write(')'))
        .toString();
  }
}

class $VendedoresTable extends Vendedores
    with TableInfo<$VendedoresTable, Vendedore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VendedoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 5,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vendedores';
  @override
  VerificationContext validateIntegrity(
    Insertable<Vendedore> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vendedore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vendedore(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
    );
  }

  @override
  $VendedoresTable createAlias(String alias) {
    return $VendedoresTable(attachedDatabase, alias);
  }
}

class Vendedore extends DataClass implements Insertable<Vendedore> {
  final int id;
  final String nome;
  const Vendedore({required this.id, required this.nome});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    return map;
  }

  VendedoresCompanion toCompanion(bool nullToAbsent) {
    return VendedoresCompanion(id: Value(id), nome: Value(nome));
  }

  factory Vendedore.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vendedore(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
    };
  }

  Vendedore copyWith({int? id, String? nome}) =>
      Vendedore(id: id ?? this.id, nome: nome ?? this.nome);
  Vendedore copyWithCompanion(VendedoresCompanion data) {
    return Vendedore(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Vendedore(')
          ..write('id: $id, ')
          ..write('nome: $nome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vendedore && other.id == this.id && other.nome == this.nome);
}

class VendedoresCompanion extends UpdateCompanion<Vendedore> {
  final Value<int> id;
  final Value<String> nome;
  const VendedoresCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
  });
  VendedoresCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
  }) : nome = Value(nome);
  static Insertable<Vendedore> custom({
    Expression<int>? id,
    Expression<String>? nome,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
    });
  }

  VendedoresCompanion copyWith({Value<int>? id, Value<String>? nome}) {
    return VendedoresCompanion(id: id ?? this.id, nome: nome ?? this.nome);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VendedoresCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome')
          ..write(')'))
        .toString();
  }
}

class $MovimentacoesTable extends Movimentacoes
    with TableInfo<$MovimentacoesTable, Movimentacoe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovimentacoesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantidadeMeta = const VerificationMeta(
    'quantidade',
  );
  @override
  late final GeneratedColumn<int> quantidade = GeneratedColumn<int>(
    'quantidade',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<DateTime> data = GeneratedColumn<DateTime>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _produtoIdMeta = const VerificationMeta(
    'produtoId',
  );
  @override
  late final GeneratedColumn<int> produtoId = GeneratedColumn<int>(
    'produto_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES produtos (id)',
    ),
  );
  static const VerificationMeta _clienteIdMeta = const VerificationMeta(
    'clienteId',
  );
  @override
  late final GeneratedColumn<int> clienteId = GeneratedColumn<int>(
    'cliente_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clientes (id)',
    ),
  );
  static const VerificationMeta _vendedorIdMeta = const VerificationMeta(
    'vendedorId',
  );
  @override
  late final GeneratedColumn<int> vendedorId = GeneratedColumn<int>(
    'vendedor_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vendedores (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tipo,
    quantidade,
    data,
    produtoId,
    clienteId,
    vendedorId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movimentacoes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Movimentacoe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _tipoMeta,
        tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('quantidade')) {
      context.handle(
        _quantidadeMeta,
        quantidade.isAcceptableOrUnknown(data['quantidade']!, _quantidadeMeta),
      );
    } else if (isInserting) {
      context.missing(_quantidadeMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('produto_id')) {
      context.handle(
        _produtoIdMeta,
        produtoId.isAcceptableOrUnknown(data['produto_id']!, _produtoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_produtoIdMeta);
    }
    if (data.containsKey('cliente_id')) {
      context.handle(
        _clienteIdMeta,
        clienteId.isAcceptableOrUnknown(data['cliente_id']!, _clienteIdMeta),
      );
    }
    if (data.containsKey('vendedor_id')) {
      context.handle(
        _vendedorIdMeta,
        vendedorId.isAcceptableOrUnknown(data['vendedor_id']!, _vendedorIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movimentacoe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Movimentacoe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      quantidade: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantidade'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data'],
      )!,
      produtoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}produto_id'],
      )!,
      clienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cliente_id'],
      ),
      vendedorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vendedor_id'],
      ),
    );
  }

  @override
  $MovimentacoesTable createAlias(String alias) {
    return $MovimentacoesTable(attachedDatabase, alias);
  }
}

class Movimentacoe extends DataClass implements Insertable<Movimentacoe> {
  final int id;
  final String tipo;
  final int quantidade;
  final DateTime data;
  final int produtoId;
  final int? clienteId;
  final int? vendedorId;
  const Movimentacoe({
    required this.id,
    required this.tipo,
    required this.quantidade,
    required this.data,
    required this.produtoId,
    this.clienteId,
    this.vendedorId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tipo'] = Variable<String>(tipo);
    map['quantidade'] = Variable<int>(quantidade);
    map['data'] = Variable<DateTime>(data);
    map['produto_id'] = Variable<int>(produtoId);
    if (!nullToAbsent || clienteId != null) {
      map['cliente_id'] = Variable<int>(clienteId);
    }
    if (!nullToAbsent || vendedorId != null) {
      map['vendedor_id'] = Variable<int>(vendedorId);
    }
    return map;
  }

  MovimentacoesCompanion toCompanion(bool nullToAbsent) {
    return MovimentacoesCompanion(
      id: Value(id),
      tipo: Value(tipo),
      quantidade: Value(quantidade),
      data: Value(data),
      produtoId: Value(produtoId),
      clienteId: clienteId == null && nullToAbsent
          ? const Value.absent()
          : Value(clienteId),
      vendedorId: vendedorId == null && nullToAbsent
          ? const Value.absent()
          : Value(vendedorId),
    );
  }

  factory Movimentacoe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Movimentacoe(
      id: serializer.fromJson<int>(json['id']),
      tipo: serializer.fromJson<String>(json['tipo']),
      quantidade: serializer.fromJson<int>(json['quantidade']),
      data: serializer.fromJson<DateTime>(json['data']),
      produtoId: serializer.fromJson<int>(json['produtoId']),
      clienteId: serializer.fromJson<int?>(json['clienteId']),
      vendedorId: serializer.fromJson<int?>(json['vendedorId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tipo': serializer.toJson<String>(tipo),
      'quantidade': serializer.toJson<int>(quantidade),
      'data': serializer.toJson<DateTime>(data),
      'produtoId': serializer.toJson<int>(produtoId),
      'clienteId': serializer.toJson<int?>(clienteId),
      'vendedorId': serializer.toJson<int?>(vendedorId),
    };
  }

  Movimentacoe copyWith({
    int? id,
    String? tipo,
    int? quantidade,
    DateTime? data,
    int? produtoId,
    Value<int?> clienteId = const Value.absent(),
    Value<int?> vendedorId = const Value.absent(),
  }) => Movimentacoe(
    id: id ?? this.id,
    tipo: tipo ?? this.tipo,
    quantidade: quantidade ?? this.quantidade,
    data: data ?? this.data,
    produtoId: produtoId ?? this.produtoId,
    clienteId: clienteId.present ? clienteId.value : this.clienteId,
    vendedorId: vendedorId.present ? vendedorId.value : this.vendedorId,
  );
  Movimentacoe copyWithCompanion(MovimentacoesCompanion data) {
    return Movimentacoe(
      id: data.id.present ? data.id.value : this.id,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      quantidade: data.quantidade.present
          ? data.quantidade.value
          : this.quantidade,
      data: data.data.present ? data.data.value : this.data,
      produtoId: data.produtoId.present ? data.produtoId.value : this.produtoId,
      clienteId: data.clienteId.present ? data.clienteId.value : this.clienteId,
      vendedorId: data.vendedorId.present
          ? data.vendedorId.value
          : this.vendedorId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Movimentacoe(')
          ..write('id: $id, ')
          ..write('tipo: $tipo, ')
          ..write('quantidade: $quantidade, ')
          ..write('data: $data, ')
          ..write('produtoId: $produtoId, ')
          ..write('clienteId: $clienteId, ')
          ..write('vendedorId: $vendedorId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, tipo, quantidade, data, produtoId, clienteId, vendedorId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movimentacoe &&
          other.id == this.id &&
          other.tipo == this.tipo &&
          other.quantidade == this.quantidade &&
          other.data == this.data &&
          other.produtoId == this.produtoId &&
          other.clienteId == this.clienteId &&
          other.vendedorId == this.vendedorId);
}

class MovimentacoesCompanion extends UpdateCompanion<Movimentacoe> {
  final Value<int> id;
  final Value<String> tipo;
  final Value<int> quantidade;
  final Value<DateTime> data;
  final Value<int> produtoId;
  final Value<int?> clienteId;
  final Value<int?> vendedorId;
  const MovimentacoesCompanion({
    this.id = const Value.absent(),
    this.tipo = const Value.absent(),
    this.quantidade = const Value.absent(),
    this.data = const Value.absent(),
    this.produtoId = const Value.absent(),
    this.clienteId = const Value.absent(),
    this.vendedorId = const Value.absent(),
  });
  MovimentacoesCompanion.insert({
    this.id = const Value.absent(),
    required String tipo,
    required int quantidade,
    required DateTime data,
    required int produtoId,
    this.clienteId = const Value.absent(),
    this.vendedorId = const Value.absent(),
  }) : tipo = Value(tipo),
       quantidade = Value(quantidade),
       data = Value(data),
       produtoId = Value(produtoId);
  static Insertable<Movimentacoe> custom({
    Expression<int>? id,
    Expression<String>? tipo,
    Expression<int>? quantidade,
    Expression<DateTime>? data,
    Expression<int>? produtoId,
    Expression<int>? clienteId,
    Expression<int>? vendedorId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tipo != null) 'tipo': tipo,
      if (quantidade != null) 'quantidade': quantidade,
      if (data != null) 'data': data,
      if (produtoId != null) 'produto_id': produtoId,
      if (clienteId != null) 'cliente_id': clienteId,
      if (vendedorId != null) 'vendedor_id': vendedorId,
    });
  }

  MovimentacoesCompanion copyWith({
    Value<int>? id,
    Value<String>? tipo,
    Value<int>? quantidade,
    Value<DateTime>? data,
    Value<int>? produtoId,
    Value<int?>? clienteId,
    Value<int?>? vendedorId,
  }) {
    return MovimentacoesCompanion(
      id: id ?? this.id,
      tipo: tipo ?? this.tipo,
      quantidade: quantidade ?? this.quantidade,
      data: data ?? this.data,
      produtoId: produtoId ?? this.produtoId,
      clienteId: clienteId ?? this.clienteId,
      vendedorId: vendedorId ?? this.vendedorId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (quantidade.present) {
      map['quantidade'] = Variable<int>(quantidade.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    if (produtoId.present) {
      map['produto_id'] = Variable<int>(produtoId.value);
    }
    if (clienteId.present) {
      map['cliente_id'] = Variable<int>(clienteId.value);
    }
    if (vendedorId.present) {
      map['vendedor_id'] = Variable<int>(vendedorId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovimentacoesCompanion(')
          ..write('id: $id, ')
          ..write('tipo: $tipo, ')
          ..write('quantidade: $quantidade, ')
          ..write('data: $data, ')
          ..write('produtoId: $produtoId, ')
          ..write('clienteId: $clienteId, ')
          ..write('vendedorId: $vendedorId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProdutosTable produtos = $ProdutosTable(this);
  late final $ClientesTable clientes = $ClientesTable(this);
  late final $VendedoresTable vendedores = $VendedoresTable(this);
  late final $MovimentacoesTable movimentacoes = $MovimentacoesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    produtos,
    clientes,
    vendedores,
    movimentacoes,
  ];
}

typedef $$ProdutosTableCreateCompanionBuilder =
    ProdutosCompanion Function({
      Value<int> id,
      required String nome,
      required double preco,
    });
typedef $$ProdutosTableUpdateCompanionBuilder =
    ProdutosCompanion Function({
      Value<int> id,
      Value<String> nome,
      Value<double> preco,
    });

final class $$ProdutosTableReferences
    extends BaseReferences<_$AppDatabase, $ProdutosTable, Produto> {
  $$ProdutosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MovimentacoesTable, List<Movimentacoe>>
  _movimentacoesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.movimentacoes,
    aliasName: $_aliasNameGenerator(db.produtos.id, db.movimentacoes.produtoId),
  );

  $$MovimentacoesTableProcessedTableManager get movimentacoesRefs {
    final manager = $$MovimentacoesTableTableManager(
      $_db,
      $_db.movimentacoes,
    ).filter((f) => f.produtoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_movimentacoesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProdutosTableFilterComposer
    extends Composer<_$AppDatabase, $ProdutosTable> {
  $$ProdutosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get preco => $composableBuilder(
    column: $table.preco,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> movimentacoesRefs(
    Expression<bool> Function($$MovimentacoesTableFilterComposer f) f,
  ) {
    final $$MovimentacoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.movimentacoes,
      getReferencedColumn: (t) => t.produtoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MovimentacoesTableFilterComposer(
            $db: $db,
            $table: $db.movimentacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProdutosTableOrderingComposer
    extends Composer<_$AppDatabase, $ProdutosTable> {
  $$ProdutosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get preco => $composableBuilder(
    column: $table.preco,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProdutosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProdutosTable> {
  $$ProdutosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<double> get preco =>
      $composableBuilder(column: $table.preco, builder: (column) => column);

  Expression<T> movimentacoesRefs<T extends Object>(
    Expression<T> Function($$MovimentacoesTableAnnotationComposer a) f,
  ) {
    final $$MovimentacoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.movimentacoes,
      getReferencedColumn: (t) => t.produtoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MovimentacoesTableAnnotationComposer(
            $db: $db,
            $table: $db.movimentacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProdutosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProdutosTable,
          Produto,
          $$ProdutosTableFilterComposer,
          $$ProdutosTableOrderingComposer,
          $$ProdutosTableAnnotationComposer,
          $$ProdutosTableCreateCompanionBuilder,
          $$ProdutosTableUpdateCompanionBuilder,
          (Produto, $$ProdutosTableReferences),
          Produto,
          PrefetchHooks Function({bool movimentacoesRefs})
        > {
  $$ProdutosTableTableManager(_$AppDatabase db, $ProdutosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProdutosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProdutosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProdutosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<double> preco = const Value.absent(),
              }) => ProdutosCompanion(id: id, nome: nome, preco: preco),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nome,
                required double preco,
              }) => ProdutosCompanion.insert(id: id, nome: nome, preco: preco),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProdutosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({movimentacoesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (movimentacoesRefs) db.movimentacoes,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (movimentacoesRefs)
                    await $_getPrefetchedData<
                      Produto,
                      $ProdutosTable,
                      Movimentacoe
                    >(
                      currentTable: table,
                      referencedTable: $$ProdutosTableReferences
                          ._movimentacoesRefsTable(db),
                      managerFromTypedResult: (p0) => $$ProdutosTableReferences(
                        db,
                        table,
                        p0,
                      ).movimentacoesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.produtoId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProdutosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProdutosTable,
      Produto,
      $$ProdutosTableFilterComposer,
      $$ProdutosTableOrderingComposer,
      $$ProdutosTableAnnotationComposer,
      $$ProdutosTableCreateCompanionBuilder,
      $$ProdutosTableUpdateCompanionBuilder,
      (Produto, $$ProdutosTableReferences),
      Produto,
      PrefetchHooks Function({bool movimentacoesRefs})
    >;
typedef $$ClientesTableCreateCompanionBuilder =
    ClientesCompanion Function({Value<int> id, required String nome});
typedef $$ClientesTableUpdateCompanionBuilder =
    ClientesCompanion Function({Value<int> id, Value<String> nome});

final class $$ClientesTableReferences
    extends BaseReferences<_$AppDatabase, $ClientesTable, Cliente> {
  $$ClientesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MovimentacoesTable, List<Movimentacoe>>
  _movimentacoesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.movimentacoes,
    aliasName: $_aliasNameGenerator(db.clientes.id, db.movimentacoes.clienteId),
  );

  $$MovimentacoesTableProcessedTableManager get movimentacoesRefs {
    final manager = $$MovimentacoesTableTableManager(
      $_db,
      $_db.movimentacoes,
    ).filter((f) => f.clienteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_movimentacoesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ClientesTableFilterComposer
    extends Composer<_$AppDatabase, $ClientesTable> {
  $$ClientesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> movimentacoesRefs(
    Expression<bool> Function($$MovimentacoesTableFilterComposer f) f,
  ) {
    final $$MovimentacoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.movimentacoes,
      getReferencedColumn: (t) => t.clienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MovimentacoesTableFilterComposer(
            $db: $db,
            $table: $db.movimentacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientesTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientesTable> {
  $$ClientesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientesTable> {
  $$ClientesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  Expression<T> movimentacoesRefs<T extends Object>(
    Expression<T> Function($$MovimentacoesTableAnnotationComposer a) f,
  ) {
    final $$MovimentacoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.movimentacoes,
      getReferencedColumn: (t) => t.clienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MovimentacoesTableAnnotationComposer(
            $db: $db,
            $table: $db.movimentacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientesTable,
          Cliente,
          $$ClientesTableFilterComposer,
          $$ClientesTableOrderingComposer,
          $$ClientesTableAnnotationComposer,
          $$ClientesTableCreateCompanionBuilder,
          $$ClientesTableUpdateCompanionBuilder,
          (Cliente, $$ClientesTableReferences),
          Cliente,
          PrefetchHooks Function({bool movimentacoesRefs})
        > {
  $$ClientesTableTableManager(_$AppDatabase db, $ClientesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
              }) => ClientesCompanion(id: id, nome: nome),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String nome}) =>
                  ClientesCompanion.insert(id: id, nome: nome),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ClientesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({movimentacoesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (movimentacoesRefs) db.movimentacoes,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (movimentacoesRefs)
                    await $_getPrefetchedData<
                      Cliente,
                      $ClientesTable,
                      Movimentacoe
                    >(
                      currentTable: table,
                      referencedTable: $$ClientesTableReferences
                          ._movimentacoesRefsTable(db),
                      managerFromTypedResult: (p0) => $$ClientesTableReferences(
                        db,
                        table,
                        p0,
                      ).movimentacoesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.clienteId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ClientesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientesTable,
      Cliente,
      $$ClientesTableFilterComposer,
      $$ClientesTableOrderingComposer,
      $$ClientesTableAnnotationComposer,
      $$ClientesTableCreateCompanionBuilder,
      $$ClientesTableUpdateCompanionBuilder,
      (Cliente, $$ClientesTableReferences),
      Cliente,
      PrefetchHooks Function({bool movimentacoesRefs})
    >;
typedef $$VendedoresTableCreateCompanionBuilder =
    VendedoresCompanion Function({Value<int> id, required String nome});
typedef $$VendedoresTableUpdateCompanionBuilder =
    VendedoresCompanion Function({Value<int> id, Value<String> nome});

final class $$VendedoresTableReferences
    extends BaseReferences<_$AppDatabase, $VendedoresTable, Vendedore> {
  $$VendedoresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MovimentacoesTable, List<Movimentacoe>>
  _movimentacoesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.movimentacoes,
    aliasName: $_aliasNameGenerator(
      db.vendedores.id,
      db.movimentacoes.vendedorId,
    ),
  );

  $$MovimentacoesTableProcessedTableManager get movimentacoesRefs {
    final manager = $$MovimentacoesTableTableManager(
      $_db,
      $_db.movimentacoes,
    ).filter((f) => f.vendedorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_movimentacoesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VendedoresTableFilterComposer
    extends Composer<_$AppDatabase, $VendedoresTable> {
  $$VendedoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> movimentacoesRefs(
    Expression<bool> Function($$MovimentacoesTableFilterComposer f) f,
  ) {
    final $$MovimentacoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.movimentacoes,
      getReferencedColumn: (t) => t.vendedorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MovimentacoesTableFilterComposer(
            $db: $db,
            $table: $db.movimentacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VendedoresTableOrderingComposer
    extends Composer<_$AppDatabase, $VendedoresTable> {
  $$VendedoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VendedoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $VendedoresTable> {
  $$VendedoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  Expression<T> movimentacoesRefs<T extends Object>(
    Expression<T> Function($$MovimentacoesTableAnnotationComposer a) f,
  ) {
    final $$MovimentacoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.movimentacoes,
      getReferencedColumn: (t) => t.vendedorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MovimentacoesTableAnnotationComposer(
            $db: $db,
            $table: $db.movimentacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VendedoresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VendedoresTable,
          Vendedore,
          $$VendedoresTableFilterComposer,
          $$VendedoresTableOrderingComposer,
          $$VendedoresTableAnnotationComposer,
          $$VendedoresTableCreateCompanionBuilder,
          $$VendedoresTableUpdateCompanionBuilder,
          (Vendedore, $$VendedoresTableReferences),
          Vendedore,
          PrefetchHooks Function({bool movimentacoesRefs})
        > {
  $$VendedoresTableTableManager(_$AppDatabase db, $VendedoresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VendedoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VendedoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VendedoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
              }) => VendedoresCompanion(id: id, nome: nome),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String nome}) =>
                  VendedoresCompanion.insert(id: id, nome: nome),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VendedoresTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({movimentacoesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (movimentacoesRefs) db.movimentacoes,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (movimentacoesRefs)
                    await $_getPrefetchedData<
                      Vendedore,
                      $VendedoresTable,
                      Movimentacoe
                    >(
                      currentTable: table,
                      referencedTable: $$VendedoresTableReferences
                          ._movimentacoesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$VendedoresTableReferences(
                            db,
                            table,
                            p0,
                          ).movimentacoesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.vendedorId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$VendedoresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VendedoresTable,
      Vendedore,
      $$VendedoresTableFilterComposer,
      $$VendedoresTableOrderingComposer,
      $$VendedoresTableAnnotationComposer,
      $$VendedoresTableCreateCompanionBuilder,
      $$VendedoresTableUpdateCompanionBuilder,
      (Vendedore, $$VendedoresTableReferences),
      Vendedore,
      PrefetchHooks Function({bool movimentacoesRefs})
    >;
typedef $$MovimentacoesTableCreateCompanionBuilder =
    MovimentacoesCompanion Function({
      Value<int> id,
      required String tipo,
      required int quantidade,
      required DateTime data,
      required int produtoId,
      Value<int?> clienteId,
      Value<int?> vendedorId,
    });
typedef $$MovimentacoesTableUpdateCompanionBuilder =
    MovimentacoesCompanion Function({
      Value<int> id,
      Value<String> tipo,
      Value<int> quantidade,
      Value<DateTime> data,
      Value<int> produtoId,
      Value<int?> clienteId,
      Value<int?> vendedorId,
    });

final class $$MovimentacoesTableReferences
    extends BaseReferences<_$AppDatabase, $MovimentacoesTable, Movimentacoe> {
  $$MovimentacoesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProdutosTable _produtoIdTable(_$AppDatabase db) =>
      db.produtos.createAlias(
        $_aliasNameGenerator(db.movimentacoes.produtoId, db.produtos.id),
      );

  $$ProdutosTableProcessedTableManager get produtoId {
    final $_column = $_itemColumn<int>('produto_id')!;

    final manager = $$ProdutosTableTableManager(
      $_db,
      $_db.produtos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_produtoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ClientesTable _clienteIdTable(_$AppDatabase db) =>
      db.clientes.createAlias(
        $_aliasNameGenerator(db.movimentacoes.clienteId, db.clientes.id),
      );

  $$ClientesTableProcessedTableManager? get clienteId {
    final $_column = $_itemColumn<int>('cliente_id');
    if ($_column == null) return null;
    final manager = $$ClientesTableTableManager(
      $_db,
      $_db.clientes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clienteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VendedoresTable _vendedorIdTable(_$AppDatabase db) =>
      db.vendedores.createAlias(
        $_aliasNameGenerator(db.movimentacoes.vendedorId, db.vendedores.id),
      );

  $$VendedoresTableProcessedTableManager? get vendedorId {
    final $_column = $_itemColumn<int>('vendedor_id');
    if ($_column == null) return null;
    final manager = $$VendedoresTableTableManager(
      $_db,
      $_db.vendedores,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vendedorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MovimentacoesTableFilterComposer
    extends Composer<_$AppDatabase, $MovimentacoesTable> {
  $$MovimentacoesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantidade => $composableBuilder(
    column: $table.quantidade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  $$ProdutosTableFilterComposer get produtoId {
    final $$ProdutosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.produtoId,
      referencedTable: $db.produtos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdutosTableFilterComposer(
            $db: $db,
            $table: $db.produtos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ClientesTableFilterComposer get clienteId {
    final $$ClientesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clienteId,
      referencedTable: $db.clientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientesTableFilterComposer(
            $db: $db,
            $table: $db.clientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VendedoresTableFilterComposer get vendedorId {
    final $$VendedoresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vendedorId,
      referencedTable: $db.vendedores,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendedoresTableFilterComposer(
            $db: $db,
            $table: $db.vendedores,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MovimentacoesTableOrderingComposer
    extends Composer<_$AppDatabase, $MovimentacoesTable> {
  $$MovimentacoesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantidade => $composableBuilder(
    column: $table.quantidade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProdutosTableOrderingComposer get produtoId {
    final $$ProdutosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.produtoId,
      referencedTable: $db.produtos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdutosTableOrderingComposer(
            $db: $db,
            $table: $db.produtos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ClientesTableOrderingComposer get clienteId {
    final $$ClientesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clienteId,
      referencedTable: $db.clientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientesTableOrderingComposer(
            $db: $db,
            $table: $db.clientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VendedoresTableOrderingComposer get vendedorId {
    final $$VendedoresTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vendedorId,
      referencedTable: $db.vendedores,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendedoresTableOrderingComposer(
            $db: $db,
            $table: $db.vendedores,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MovimentacoesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MovimentacoesTable> {
  $$MovimentacoesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<int> get quantidade => $composableBuilder(
    column: $table.quantidade,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  $$ProdutosTableAnnotationComposer get produtoId {
    final $$ProdutosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.produtoId,
      referencedTable: $db.produtos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdutosTableAnnotationComposer(
            $db: $db,
            $table: $db.produtos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ClientesTableAnnotationComposer get clienteId {
    final $$ClientesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clienteId,
      referencedTable: $db.clientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientesTableAnnotationComposer(
            $db: $db,
            $table: $db.clientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VendedoresTableAnnotationComposer get vendedorId {
    final $$VendedoresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vendedorId,
      referencedTable: $db.vendedores,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendedoresTableAnnotationComposer(
            $db: $db,
            $table: $db.vendedores,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MovimentacoesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MovimentacoesTable,
          Movimentacoe,
          $$MovimentacoesTableFilterComposer,
          $$MovimentacoesTableOrderingComposer,
          $$MovimentacoesTableAnnotationComposer,
          $$MovimentacoesTableCreateCompanionBuilder,
          $$MovimentacoesTableUpdateCompanionBuilder,
          (Movimentacoe, $$MovimentacoesTableReferences),
          Movimentacoe,
          PrefetchHooks Function({
            bool produtoId,
            bool clienteId,
            bool vendedorId,
          })
        > {
  $$MovimentacoesTableTableManager(_$AppDatabase db, $MovimentacoesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MovimentacoesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MovimentacoesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MovimentacoesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<int> quantidade = const Value.absent(),
                Value<DateTime> data = const Value.absent(),
                Value<int> produtoId = const Value.absent(),
                Value<int?> clienteId = const Value.absent(),
                Value<int?> vendedorId = const Value.absent(),
              }) => MovimentacoesCompanion(
                id: id,
                tipo: tipo,
                quantidade: quantidade,
                data: data,
                produtoId: produtoId,
                clienteId: clienteId,
                vendedorId: vendedorId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String tipo,
                required int quantidade,
                required DateTime data,
                required int produtoId,
                Value<int?> clienteId = const Value.absent(),
                Value<int?> vendedorId = const Value.absent(),
              }) => MovimentacoesCompanion.insert(
                id: id,
                tipo: tipo,
                quantidade: quantidade,
                data: data,
                produtoId: produtoId,
                clienteId: clienteId,
                vendedorId: vendedorId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MovimentacoesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({produtoId = false, clienteId = false, vendedorId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (produtoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.produtoId,
                                    referencedTable:
                                        $$MovimentacoesTableReferences
                                            ._produtoIdTable(db),
                                    referencedColumn:
                                        $$MovimentacoesTableReferences
                                            ._produtoIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (clienteId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.clienteId,
                                    referencedTable:
                                        $$MovimentacoesTableReferences
                                            ._clienteIdTable(db),
                                    referencedColumn:
                                        $$MovimentacoesTableReferences
                                            ._clienteIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (vendedorId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.vendedorId,
                                    referencedTable:
                                        $$MovimentacoesTableReferences
                                            ._vendedorIdTable(db),
                                    referencedColumn:
                                        $$MovimentacoesTableReferences
                                            ._vendedorIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$MovimentacoesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MovimentacoesTable,
      Movimentacoe,
      $$MovimentacoesTableFilterComposer,
      $$MovimentacoesTableOrderingComposer,
      $$MovimentacoesTableAnnotationComposer,
      $$MovimentacoesTableCreateCompanionBuilder,
      $$MovimentacoesTableUpdateCompanionBuilder,
      (Movimentacoe, $$MovimentacoesTableReferences),
      Movimentacoe,
      PrefetchHooks Function({bool produtoId, bool clienteId, bool vendedorId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProdutosTableTableManager get produtos =>
      $$ProdutosTableTableManager(_db, _db.produtos);
  $$ClientesTableTableManager get clientes =>
      $$ClientesTableTableManager(_db, _db.clientes);
  $$VendedoresTableTableManager get vendedores =>
      $$VendedoresTableTableManager(_db, _db.vendedores);
  $$MovimentacoesTableTableManager get movimentacoes =>
      $$MovimentacoesTableTableManager(_db, _db.movimentacoes);
}
