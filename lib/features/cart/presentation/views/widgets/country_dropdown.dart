import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/features/home/data/models/country/countrys.dart';
import 'package:costly/features/home/presentation/cubits/countries/countries_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({super.key, required this.onCountrySelected});
  final Function(String?) onCountrySelected;

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}
class _CountryDropdownState extends State<CountryDropdown> {
  String? selectedItem;
  List<Country> countries = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesCubit, CountriesState>(builder: (context, state) {
      if (state is CountriesInitial) {
        return DropdownMenuItem(
          value: null,
          child: Text(
            'Country',
            style: TextStyles.light10.copyWith(color: Colors.black),
          ));
      }
      if (state is CountriesFailure) {
        return Center(child: Text(state.errMessage));
      }
      if (state is CountriesSuccess) {
        countries = state.countries;

        return DropdownButton<String>(
            borderRadius: BorderRadius.circular(10),
            value: selectedItem,
            hint: Text(
              'Country',
              style: TextStyles.light10.copyWith(color: Colors.black),
            ),
            items: countries.map((co) {
              return DropdownMenuItem<String>(
                value: co.id,
                child: Text(isArabic() ? co.arName : co.enName,
                    style: TextStyles.light10.copyWith(color: Colors.black)),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedItem = value; // Update selected service
                widget.onCountrySelected(value);
              });
            });
      }
      return Container();
    });
  }
}
