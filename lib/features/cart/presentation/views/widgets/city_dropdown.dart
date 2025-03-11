import 'package:costly/core/helper_functions/show_error_bar.dart';
import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/features/home/data/models/city/city.dart';
import 'package:costly/features/home/presentation/cubits/cities/cities_cubit.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityDropdown extends StatefulWidget {
  const CityDropdown(
      {super.key,
      required this.onCitySelected,
      this.countryID,
      this.selectedCityId});

  final Function(String?) onCitySelected;
  final String? countryID;
  final String? selectedCityId;

  @override
  State<CityDropdown> createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  String? selectedItem;
  List<City> cityList = [];

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedCityId; // Preselect city if available
    fetchCities(); // Initial call
  }

  @override
  void didUpdateWidget(covariant CityDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.countryID != widget.countryID) {
      setState(() {
        selectedItem = null; // Reset city when country changes
      });
      fetchCities(); // Refetch when country changes
    }
  }

  void fetchCities() {
    if (widget.countryID != null) {
      context.read<CitiesCubit>().getCities(widget.countryID);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CitiesCubit, CitiesState>(
      listener: (context, state) {
        if (state is CitiesFailure) {
          return showErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
       
        if (state is CitiesInitial) {
          return DropdownButton<String>(
            value: null,
            hint: Text(
              S.of(context).city,
              style: TextStyles.light10.copyWith(color: Colors.black),
            ),
            items: [],
            onChanged: null,
          );
        }
        if (state is CitiesFailure) {
               return Center(
                    child: Text(state.message, style: TextStyle(color: Colors.red)));
          }
        if (state is CitiesSuccess) {
             cityList = state.cities;
             if (selectedItem == null && widget.selectedCityId != null) {
            bool exists = cityList.any((city) => city.id == widget.selectedCityId);
            if (exists) {
              selectedItem = widget.selectedCityId;
            }
          }
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(10),
                value: selectedItem,
                hint: Text(S.of(context).city,
                  style: TextStyles.light10.copyWith(color: Colors.black),
                ),
                items: cityList.map((city) {
                  return DropdownMenuItem<String>(
                    value: city.id,
                    child: Text(
                      isArabic() ? city.arName : city.enName,
                      style: TextStyles.light10.copyWith(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedItem = value;
                    widget.onCitySelected(value);
                  });
                },
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
