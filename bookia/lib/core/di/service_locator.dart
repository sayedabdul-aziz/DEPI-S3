import 'package:bookia/features/auth/data/data_source/auth_data_source.dart';
import 'package:bookia/features/auth/data/repository/auth_repo_impl.dart';
import 'package:bookia/features/auth/domain/repository/auth_repo.dart';
import 'package:bookia/features/auth/domain/usecase/login_usecase.dart';
import 'package:bookia/features/auth/domain/usecase/register_usecase.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

void setupServiceLocator() {
  // register data sources
  locator.registerLazySingleton<AuthDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  // register repositories
  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(locator()));

  // register use cases
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(locator()));
  locator.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(locator()),
  );

  // register cubits
  
}



// register factory : create new instance

// register singleton : create only one instance

// register lazy singleton : create only one instance, 
