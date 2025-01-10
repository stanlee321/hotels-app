# Arquitectura del Proyecto: Aplicación para Huéspedes

## **Propósito**
Este documento centraliza los detalles arquitectónicos del proyecto, definiendo la estructura, flujos, componentes, y tecnologías a usar para la implementación de la aplicación móvil. Está diseñado para garantizar claridad en el desarrollo y facilitar la colaboración entre desarrolladores, diseñadores y equipos relacionados.

---

## **Estructura del Proyecto**

### **Carpetas Principales**

/project-root
├── /lib
│   ├── /screens          # Pantallas principales de la app.
│   ├── /widgets          # Componentes reutilizables de UI.
│   ├── /bloc             # Gestión de estado usando el patrón BLoC.
│   ├── /models           # Modelos de datos.
│   ├── /services         # Servicios API y de backend.
│   ├── /theme            # Configuración de colores, fuentes, etc.
│   └── main.dart         # Punto de entrada de la aplicación.
├── /assets
│   ├── /images           # Recursos de imágenes.
│   └── /icons            # Recursos de íconos.
├── /test                 # Pruebas unitarias y de integración.
└── pubspec.yaml          # Dependencias y configuración del proyecto.

---

## **Arquitectura General**

### **Patrón: MVVM + BLoC**
La arquitectura de la aplicación combina el patrón **MVVM (Model-View-ViewModel)** para organizar la lógica de UI con **BLoC (Business Logic Component)** para la gestión de estado. Esto asegura modularidad, escalabilidad y facilidad de pruebas.

1. **View (Pantallas):**
   - Define la interfaz de usuario y reacciona a cambios de estado proporcionados por el `Bloc`.
   - Archivo de ejemplo: `/screens/register_screen.dart`.

2. **ViewModel (Widgets y BLoC):**
   - Actúa como intermediario entre la vista y la lógica del negocio.
   - Gestiona las interacciones de los usuarios y actualiza el estado.
   - Archivo de ejemplo: `/bloc/register_bloc.dart`.

3. **Model:**
   - Contiene la estructura de datos y mapea respuestas del backend o datos locales.
   - Archivo de ejemplo: `/models/guest_model.dart`.

---

## **Rutas y Navegación**

La navegación entre pantallas sigue un enfoque centralizado utilizando un `RouteManager`. Las rutas están definidas en el archivo `main.dart`.

### **Definición de Rutas**
```dart
class RouteManager {
  static const String startScreen = '/';
  static const String registerScreen = '/register';
  static const String budgetScreen = '/budget';
  static const String mapScreen = '/map';
  static const String activitiesScreen = '/activities';
  static const String optionsScreen = '/options';
  static const String detailScreen = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startScreen:
        return MaterialPageRoute(builder: (_) => StartScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case budgetScreen:
        return MaterialPageRoute(builder: (_) => BudgetScreen());
      case mapScreen:
        return MaterialPageRoute(builder: (_) => MapScreen());
      case activitiesScreen:
        return MaterialPageRoute(builder: (_) => ActivitiesScreen());
      case optionsScreen:
        final category = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => OptionsScreen(category: category));
      case detailScreen:
        final activityId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => DetailScreen(activityId: activityId));
      default:
        return MaterialPageRoute(builder: (_) => StartScreen());
    }
  }
}

Gestión de Estado

Uso del Patrón BLoC

El patrón BLoC se implementa para manejar el flujo de datos y la interacción en la app. Cada pantalla tiene su propio Bloc y State asociados.

Ejemplo: Registro de Huésped
	1.	Archivo BLoC:
	•	/bloc/register_bloc.dart

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is SubmitRegister) {
      yield RegisterLoading();
      try {
        // Simular validación de datos
        await Future.delayed(Duration(seconds: 2));
        yield RegisterSuccess();
      } catch (_) {
        yield RegisterFailure(error: "Error al registrar");
      }
    }
  }
}


	2.	Estados:

abstract class RegisterState {}
class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterFailure extends RegisterState {
  final String error;
  RegisterFailure({required this.error});
}


	3.	Eventos:

abstract class RegisterEvent {}
class SubmitRegister extends RegisterEvent {
  final GuestModel guest;
  SubmitRegister(this.guest);
}

Temas y Estilo

Tema Principal

Archivo: /theme/theme.dart.

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xFFFF385C),
    accentColor: Color(0xFF008489),
    backgroundColor: Color(0xFFF7F7F7),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
      bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Color(0xFF717171)),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFFFF385C),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}

Dependencias Clave

Flutter Plugins
	1.	Gestión de Estado:
	•	flutter_bloc
	2.	Mapas:
	•	flutter_map (Leaflet para mapas interactivos).
	3.	API y Backend:
	•	http para llamadas REST.
	4.	Diseño:
	•	google_fonts para tipografías.
	•	flutter_svg para íconos SVG.

Pruebas

Estrategia de Pruebas
	•	Unitarias:
	•	Probar lógica en los archivos Bloc.
	•	De Integración:
	•	Validar navegación entre pantallas y flujo de datos.
	•	UI:
	•	Testear la interfaz en diferentes tamaños de pantalla.

Ejemplo de Prueba Unitaria

void main() {
  group('RegisterBloc Tests', () {
    late RegisterBloc bloc;

    setUp(() {
      bloc = RegisterBloc();
    });

    test('Initial state is RegisterInitial', () {
      expect(bloc.state, RegisterInitial());
    });

    blocTest<RegisterBloc, RegisterState>(
      'emits [RegisterLoading, RegisterSuccess] on successful registration',
      build: () => bloc,
      act: (bloc) => bloc.add(SubmitRegister(guest)),
      expect: () => [RegisterLoading(), RegisterSuccess()],
    );
  });
}

Resumen

Este documento define la arquitectura centralizada del proyecto, desde la estructura de carpetas hasta los detalles técnicos del flujo de datos y el diseño. Está diseñado para garantizar claridad, modularidad y escalabilidad en el desarrollo. Si necesitas ajustes, se puede iterar sobre esta base.

Este archivo proporciona una descripción clara y detallada de la arquitectura del proyecto, lo que permite a cualquier programador humano o IA trabajar eficientemente en su implementación.