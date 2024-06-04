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
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
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
  ChartSampleData('40%', 40)
];

List<ChartSampleData> chartData2 = [
  ChartSampleData('35%', 35),
  ChartSampleData('28%', 28),
  ChartSampleData('34%', 34),
  ChartSampleData('32%', 32),
  ChartSampleData('40%', 40)
];

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: Stack(
        children: [
          SfCircularChart(
            palette: [
              Colors.orange.shade700,
              Colors.orange.shade600,
              Colors.orange.shade500,
              Colors.orange.shade400,
              Colors.orange.shade200,
              Colors.orange.shade100,
            ],
            legend: const Legend(
              isVisible: true,
              offset: Offset(30, 0),
            ),
            series: <CircularSeries>[
              DoughnutSeries<ChartSampleData, String>(
                animationDelay: 0,
                animationDuration: 0,
                radius: '30%',
                dataSource: chartData,
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
          SfCircularChart(
            palette: [
              Colors.pink.shade700,
              Colors.pink.shade600,
              Colors.pink.shade500,
              Colors.pink.shade400,
              Colors.pink.shade200,
              Colors.pink.shade100,
            ],
            legend: const Legend(
              isVisible: true,
              offset: Offset(-110, 0),
            ),
            series: <CircularSeries>[
              DoughnutSeries<ChartSampleData, String>(
                animationDelay: 0,
                animationDuration: 0,
                radius: '65%',
                dataSource: chartData,
                xValueMapper: (ChartSampleData data, _) => data.x,
                yValueMapper: (ChartSampleData data, _) => data.y,
                dataLabelMapper: (ChartSampleData data, _) =>
                    '${data.y.toInt()}%',
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                ),
              )
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
