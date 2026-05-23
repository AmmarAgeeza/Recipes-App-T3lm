import 'core/constants/app_import.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  ServiceLocator.setup();
  runApp(const MyApp());
}
