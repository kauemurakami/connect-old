import 'package:meta/meta.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';

class ServicoRepository {

final ApiClient apiClient;

ServicoRepository({@required this.apiClient}) : assert(apiClient != null);

}