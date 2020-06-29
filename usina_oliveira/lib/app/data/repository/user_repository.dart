import 'package:meta/meta.dart';
import 'package:usina_oliveira/app/data/provider/api_client.dart';

class UserRepository {

final ApiClient apiClient;

UserRepository({@required this.apiClient}) : assert(apiClient != null);


}