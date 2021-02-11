import 'package:dw3_pizz_delivery_api/application/config/database_connection_configuration.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/src/single_connection.dart';

import 'I_database_connection.dart';

@Injectable(as: IDatabaseConnection)
class DatabaseConnection implements IDatabaseConnection {
  final DatabaseConnectionConfiguration _configuration;

  DatabaseConnection(this._configuration);

  @override
  Future<MySqlConnection> openConnection() async {
    return await MySqlConnection.connect(ConnectionSettings(
        host: _configuration.host,
        port: int.parse(_configuration.port),
        db: _configuration.databaseName,
        password: _configuration.password,
        user: _configuration.user));
  }
}
