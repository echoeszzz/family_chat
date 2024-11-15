import 'package:get_it/get_it.dart';
import 'package:family_locator/features/contacts/data/contacts_datasource.dart';

final GetIt getIt = GetIt.I;

void setupLocator() {
  getIt.registerLazySingleton<ContactsDataSource>(() => ContactsDataSource());
}