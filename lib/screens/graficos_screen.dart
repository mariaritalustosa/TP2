import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tp2/database/app_database.dart';


class GraficosScreen extends StatefulWidget {
  const GraficosScreen({super.key});

  @override
  State<GraficosScreen> createState() => _GraficosScreenState();
}

class _GraficosScreenState extends State<GraficosScreen> {
  late Future<List<Movimentacao>> _futureMovimentacoes;

  @override
  void initState() {
    super.initState();
    final db = AppDatabase();
    _futureMovimentacoes = db.getMovimentacoesComDetalhes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gráficos de Movimentações')),
      body: FutureBuilder<List<Movimentacao>>(
        future: _futureMovimentacoes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma movimentação encontrada.'));
          }

          final movimentacoes = snapshot.data!;
          final dadosAgrupados = _agruparPorProduto(movimentacoes);

   return Padding(
            padding: const EdgeInsets.all(16.0),
            child: BarChart(
              BarChartData(
                maxY: _maximoEntradaSaida(dadosAgrupados) + 5,
                barGroups: List.generate(dadosAgrupados.length, (index) {
                  final entrada = double.parse(dadosAgrupados[index]['entrada']!);
                  final saida = double.parse(dadosAgrupados[index]['saida']!);

                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: entrada,
                        color: const Color.fromARGB(255, 42, 109, 44),
                        width: 10,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      BarChartRodData(
                        toY: saida,
                        color: const Color.fromARGB(255, 114, 22, 15),
                        width: 10,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                    barsSpace: 4,
                  );
                }),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        return SideTitleWidget(
                          meta: meta,
                          child: Text(
                            dadosAgrupados[index]['produto']!,
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 32),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        rod.toY.toString(),
                        const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
                gridData: FlGridData(show: true),
                borderData: FlBorderData(show: false),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Map<String, String>> _agruparPorProduto(List<Movimentacao> movimentacoes) {
    final Map<String, Map<String, int>> mapa = {};

    for (var m in movimentacoes) {
      final nome = m.nomeProduto;
      final tipo = m.tipo.toLowerCase();
      mapa.putIfAbsent(nome, () => {'entrada': 0, 'saida': 0});
      mapa[nome]![tipo] = (mapa[nome]![tipo] ?? 0) + m.quantidade;
    }

    return mapa.entries.map((e) {
      return {
        'produto': e.key,
        'entrada': e.value['entrada'].toString(),
        'saida': e.value['saida'].toString(),
      };
    }).toList();
  }

  double _maximoEntradaSaida(List<Map<String, String>> dados) {
    double max = 0;
    for (var item in dados) {
      final entrada = double.tryParse(item['entrada']!) ?? 0;
      final saida = double.tryParse(item['saida']!) ?? 0;
      if (entrada > max) max = entrada;
      if (saida > max) max = saida;
    }
    return max;
  }
}

