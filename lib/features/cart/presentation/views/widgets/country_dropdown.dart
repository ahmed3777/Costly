import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/features/home/data/models/country/countrys.dart';
import 'package:costly/features/home/presentation/cubits/countries/countries_cubit.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDropdown extends StatefulWidget {
  const CountryDropdown(
      {super.key, required this.onCountrySelected, this.initialCountryId});
  final Function(String?) onCountrySelected;
  final String? initialCountryId; // Add this

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  String? selectedItem;
  List<Country> countriesList = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
      if (state is CountriesInitial) {
        return DropdownButton(
          value: selectedItem,
          hint: Text(
            S.of(context).country,
            style: TextStyles.light10.copyWith(color: Colors.black),
          ),
          items: [],
          onChanged: null,
        );
      }
      if (state is CountriesFailure) {
        return Center(child: Text(state.errMessage));
      }
      if (state is CountriesLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is CountriesSuccess) {
        countriesList = state.countries;

        if (selectedItem == null && widget.initialCountryId != null) {
          bool exists =
              countriesList.any((co) => co.id == widget.initialCountryId);
          if (exists) {
            selectedItem = widget.initialCountryId;
          }
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: (10)),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(10),
                value: selectedItem,
                hint: Text(
                  S.of(context).country,
                  style: TextStyles.light10.copyWith(color: Colors.black),
                ),
                items: countriesList.map((co) {
                  return DropdownMenuItem<String>(
                    value: co.id,
                    child: Text(isArabic() ? co.arName : co.enName,
                        style:
                            TextStyles.light10.copyWith(color: Colors.black)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedItem = value; // Update selected service
                    widget.onCountrySelected(value);
                  });
                }),
          ),
        );
      }
      return Container();
    });
  }
}
