import 'package:dio/dio.dart';
import 'package:trading_app/app/app.dart';
import '../../domain/datasources/auth_remote_datasource.dart';

/// AuthRemoteDataSource
///
/// Responsable de realizar las llamadas HTTP relacionadas
/// con autenticación usando Dio.
///
/// Endpoints:
/// - POST /api/auth/login
/// - POST /api/auth/logout
///
/// Incluye:
/// - Manejo avanzado de errores con DioException
/// - Logs detallados para debugging
/// - Control de statusCode
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  /// 🔐 LOGIN
  ///
  /// Envía las credenciales del usuario:
  ///
  /// {
  ///   "email": "test1@google.com",
  ///   "password": "Abc123"
  /// }
  ///
  /// Retorna el JSON de respuesta del backend:
  ///
  /// {
  ///   "id": "...",
  ///   "email": "...",
  ///   "fullName": "...",
  ///   "isActive": true,
  ///   "roles": ["admin"],
  ///   "token": "JWT..."
  /// }
  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final url = '${EnvConfig.apiBaseUrl}/auth/login';

    try {
      print('🔵 [LOGIN] Iniciando petición a: $url');
      print('📤 [LOGIN] Payload: { email: $email }');

      final response = await dio.post(
        url,
        data: {"email": email, "password": password},
      );

      print('📥 [LOGIN] StatusCode: ${response.statusCode}');
      print('📥 [LOGIN] ResponseData: ${response.data}');

      if (response.statusCode == 200) {
        print('✅ [LOGIN] Login exitoso');
        print('🔑 [LOGIN] Token recibido correctamente');

        return Map<String, dynamic>.from(response.data);
      } else {
        print(
          '❌ [LOGIN] Error inesperado con statusCode: ${response.statusCode}',
        );
        throw Exception('Error en login: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      print('🚨 [LOGIN] DioException detectado');
      print('📛 Tipo de error: ${dioError.type}');
      print('📥 Response: ${dioError.response?.data}');
      print('📥 StatusCode: ${dioError.response?.statusCode}');
      print('🧵 StackTrace: ${dioError.stackTrace}');
      rethrow;
    } catch (e, stackTrace) {
      print('🚨 [LOGIN] Error inesperado: $e');
      print('🧵 StackTrace: $stackTrace');
      rethrow;
    }
  }

  /// 🚪 LOGOUT
  ///
  /// Realiza cierre de sesión en el backend.
  ///
  /// Requiere token JWT en header Authorization.
  ///
  /// Header:
  /// Authorization: Bearer {token}
  @override
  Future<void> logout({required String token}) async {
    final url = '${EnvConfig.apiBaseUrl}/auth/logout';

    try {
      print('🔵 [LOGOUT] Iniciando petición a: $url');
      print('🔐 [LOGOUT] Enviando token en header Authorization');

      final response = await dio.post(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      print('📥 [LOGOUT] StatusCode: ${response.statusCode}');
      print('📥 [LOGOUT] ResponseData: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 204) {
        print('✅ [LOGOUT] Logout exitoso');
      } else {
        print(
          '❌ [LOGOUT] Error inesperado con statusCode: ${response.statusCode}',
        );
        throw Exception('Error en logout: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      print('🚨 [LOGOUT] DioException detectado');
      print('📛 Tipo de error: ${dioError.type}');
      print('📥 Response: ${dioError.response?.data}');
      print('📥 StatusCode: ${dioError.response?.statusCode}');
      print('🧵 StackTrace: ${dioError.stackTrace}');
      rethrow;
    } catch (e, stackTrace) {
      print('🚨 [LOGOUT] Error inesperado: $e');
      print('🧵 StackTrace: $stackTrace');
      rethrow;
    }
  }
}
