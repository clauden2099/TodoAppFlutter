import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/viewmodel/task_screen_viewmodel.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen>
    with TickerProviderStateMixin {
  //Indica que el tabController puede ser nulo
  TabController? _tabController;
  //Inicializa el viewmodel
  //Con late le decimos que la variable se inicializara despues
  //en el init state, no en la declaracion
  late final TaskScreenViewmodel _vm;

  @override
  void initState() {
    super.initState();

    // Guardamos referencia para no depender de context en dispose
    _vm = context.read<TaskScreenViewmodel>();

    // Escuchamos al VM para reconstruir el controller cuando cambie el length
    //Con la función .addListener se ejecuta un callback cuando se ejecuta notifyListeners
    //así que en este caso se ejecutara el método _syncController cada que cambie el estado del VM
    _vm.addListener(_syncController);

    // Carga inicial DESPUÉS del primer frame (evita "setState durante build")
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _vm.loadLists();
    });
  }

  @override
  void dispose() {
    _vm.removeListener(_syncController);
    _tabController?.dispose();
    super.dispose();
  }

  /// Mantiene el TabController en sync con la cantidad de listas.
  /// Se llama cada vez que el VM hace notifyListeners().
  void _syncController() {
    print(
      '🔵 _syncController: length=${_vm.lists.length}, current=${_tabController?.length ?? 0}',
    );
    if (!mounted) return;

    final length = _vm.lists.length;
    final currentLength = _tabController?.length ?? 0;

    // Nada cambió → salir (evita rebuilds innecesarios)
    if (length == currentLength) {
      print('   ⏭️ sin cambios, return');
      return;
    }
    print('   🔄 length cambió → setState');
    setState(() {
      if (length == 0) {
        _tabController?.dispose();
        _tabController = null;
      } else {
        final oldIndex = _tabController?.index ?? 0;
        _tabController?.dispose();
        _tabController = TabController(
          length: length,
          vsync: this,
          initialIndex: oldIndex.clamp(0, length - 1),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TaskScreenViewmodel>();
    print(
      '🟢 build ejecutado. lists=${vm.lists.length}, isLoading=${vm.isLoading}',
    );
    final lists = vm.lists;
    final hasTabs = _tabController != null && lists.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas'),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => debugPrint('HOLA'),
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/122833439?v=4',
                ),
              ),
            ),
          ),
        ],
        bottom: hasTabs
            ? TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: [
                  for (final list in lists)
                    Tab(key: ValueKey(list.id), child: Text(list.title)),
                ],
              )
            : null,
      ),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : lists.isEmpty
          ? const Center(child: Text('No hay listas aún'))
          : TabBarView(
              controller: _tabController,
              children: [
                for (final list in lists)
                  Center(child: Text('Tareas de ${list.title}')),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 1. Esperar a que addList termine (incluye el loadLists interno)
          await context.read<TaskScreenViewmodel>().addList('Prueba');

          // 2. Cuando el listener ya reconstruyó el controller, mover a la última tab
          if (!mounted || _tabController == null) return;
          _tabController!.animateTo(_tabController!.length - 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
