import 'app/app.dart';
import 'core/constants/app_import.dart';

void main()  {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
