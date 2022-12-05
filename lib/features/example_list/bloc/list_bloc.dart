import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:login_page/features/example_list/resources/example_repository.dart';
import 'package:login_page/model/example_list.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListRepository _repository = ListRepository();
  ListBloc() : super(ListInitial()) {
    on<FetchedListEvent>(_repository.getListData);
  }
}
