import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

List<ChartSampleData> chartData = [
  ChartSampleData('35%', 35),
  ChartSampleData('28%', 28),
  ChartSampleData('34%', 34),
  ChartSampleData('32%', 32),
  ChartSampleData('40%', 40),
  ChartSampleData('20%', 20)
];

List<ChartSampleData> chartData2 = [
  ChartSampleData('20%', 20),
  ChartSampleData('25%', 25),
  ChartSampleData('32%', 32),
  ChartSampleData('40%', 40),
  ChartSampleData('25%', 25),
  ChartSampleData('18%', 18)
];

List<Color> paletteColorOuterDoughnut = [
  Colors.amber,
  Colors.red,
  Colors.deepPurple,
  Colors.deepOrange,
  Colors.blueGrey,
  Colors.green,
];

List<Color> paletteColorInnerDoughnut = [
  Colors.amber.shade200,
  Colors.red.shade200,
  Colors.deepPurple.shade200,
  Colors.deepOrange.shade200,
  Colors.blueGrey.shade200,
  Colors.green.shade200,
];

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Syncfusion Flutter chart')),
      ),
      body: Stack(
        children: [
          SfCircularChart(
            palette: paletteColorOuterDoughnut,
            legend: const Legend(
              isVisible: true,
              offset: Offset(40, 0),
            ),
            series: <CircularSeries>[
              DoughnutSeries<ChartSampleData, String>(
                animationDuration: 0,
                radius: '60%',
                strokeColor: Colors.white,
                dataSource: chartData,
                xValueMapper: (ChartSampleData data, _) => data.x,
                yValueMapper: (ChartSampleData data, _) => data.y,
                dataLabelMapper: (ChartSampleData data, _) =>
                    '${data.y.toInt()}%',
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                ),
              )
            ],
          ),
          SfCircularChart(
            palette: paletteColorInnerDoughnut,
            legend: const Legend(
              isVisible: true,
              offset: Offset(-100, 0),
            ),
            series: <CircularSeries>[
              DoughnutSeries<ChartSampleData, String>(
                animationDuration: 0,
                radius: '38%',
                strokeColor: Colors.white,
                dataSource: chartData2,
                xValueMapper: (ChartSampleData data, _) => data.x,
                yValueMapper: (ChartSampleData data, _) => data.y,
                dataLabelMapper: (ChartSampleData data, _) =>
                    '${data.y.toInt()}%',
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChartSampleData {
  ChartSampleData(this.x, this.y);

  final String x;
  final double y;
}
