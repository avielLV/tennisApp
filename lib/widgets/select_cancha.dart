import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennisapp/helpers/helpers.dart';
import 'package:tennisapp/provider/provider.dart';
import 'package:tennisapp/services/services.dart';

class SelectCancha extends StatefulWidget {
  final int valor;
  final int initindex;
  const SelectCancha({Key? key, required this.valor, required this.initindex})
      : super(key: key);

  @override
  State<SelectCancha> createState() => _SelectCanchaState();
}

class _SelectCanchaState extends State<SelectCancha>
    with SingleTickerProviderStateMixin {
  final _selectColor = Colors.deepPurple;

  final _tabs = [
    const Tab(text: 'Cancha A'),
    const Tab(text: 'Cancha B'),
    const Tab(text: 'Cancha C'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: widget.initindex,
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final homeService = Provider.of<HomeService>(context);
    final size = MediaQuery.of(context).size;

    //todo prueba temporal para cargar datos

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 46,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: _selectColor),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        tabs: _tabs,
        onTap: (value) async {
          homeProvider.cancha = value;
          await homeService.cargarReserva(
              homeProvider.date.format, homeProvider.cancha);
        },
      ),
    );
  }
}
