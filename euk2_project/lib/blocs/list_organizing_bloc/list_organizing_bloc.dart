import 'package:bloc/bloc.dart';
import 'package:eurokey2/features/location_data/euk_location_data.dart';
import 'package:eurokey2/features/location_data/location_manager.dart';
import 'package:meta/meta.dart';

part 'list_organizing_event.dart';
part 'list_organizing_state.dart';

class ListOrganizingBloc extends Bloc<ListOrganizingEvent, ListOrganizingState> {
  late EUKLocationManager _manager;
  late ListOrganizingEvent _currentSort;
  List<EUKLocationData> _organizedLocations = [];

  ListOrganizingBloc({required EUKLocationManager locManager}) : super(ListOrganizingDefaultState()) {
    _manager = locManager;
    _currentSort = OnSortByLocationDistance();
    on<OnSortByLocationDistance>(_onSortByLocationDistance);
    on<OnFilterByText>(_onFilterByText);
  }

  void _onSortByLocationDistance(OnSortByLocationDistance event, emit) {
    emit(ListOrganizingSortingState());
    _organizedLocations.sort((a, b) => a.distanceFromDevice.compareTo(b.distanceFromDevice));
    _currentSort = event;
    emit(ListOrganizingDefaultState());
  }

  void _onFilterByText(OnFilterByText event, emit) {
    emit(ListOrganizingSortingState());
    _updateSortedLocations();
    _organizedLocations = _organizedLocations.where((element) {
      return element.address.toLowerCase().contains(event.value.toLowerCase()) || element.city.toLowerCase().contains(event.value.toLowerCase());
    },).toList();

    add(_currentSort);
    emit(ListOrganizingDefaultState());
  }

  void _updateSortedLocations() => _organizedLocations = List.from(_manager.locations);

  ///Get locations as a list of addresses.
  List<String> getSuggestions() => _manager.locations.map((loc) => loc.address).toList();

  List<EUKLocationData> get organizedLocations => _organizedLocations;
}
