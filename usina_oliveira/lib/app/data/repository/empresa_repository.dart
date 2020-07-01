
import 'package:meta/meta.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';

class EmpresaRepository {
final ApiClient apiClient;

EmpresaRepository({@required this.apiClient}) : assert(apiClient != null);

}
