import 'package:anterosflutter/anterosflutter.dart';
import 'package:anterosflutter/components/form/fields/anteros_form_rating_bar.dart';
import 'package:anterosflutter/components/form/fields/anteros_form_searchable_dropdown.dart';
import 'package:anterosflutter/components/form/fields/anteros_form_signature_pad.dart';
import 'package:anterosflutter/components/form/fields/anteros_form_touch_spin.dart';
import 'package:anterosflutter/components/form/fields/anteros_form_typeahead.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class ApiImage {
  final String imageUrl;
  final String id;
  ApiImage({
    required this.imageUrl,
    required this.id,
  });
}

class ExtraFields extends StatefulWidget {
  const ExtraFields({Key? key}) : super(key: key);

  @override
  _ExtraFieldsState createState() => _ExtraFieldsState();
}

class _ExtraFieldsState extends State<ExtraFields> {
  final _formKey = GlobalKey<AnterosFormState>();
  final List<String>? _allowedExtensions = ['pdf'];

  void _onChanged(dynamic val) => debugPrint(val.toString());

  SizedBox getSpace() => const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AnterosColors.DARK,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: const Text(
          'Campos extras',
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnterosForm(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                AnterosFormSearchableDropdown<String>(
                    context: context,
                    name: 'searchable_dropdown_online',
                    // items: allCountries,
                    labelText: 'Lista pesquisável on-line',
                    onChanged: _onChanged,
                    showSearchBox: true,
                    isFilteredOnline: true,
                    compareFn: (item, selectedItem) =>
                        item?.toLowerCase() == selectedItem?.toLowerCase(),
                    onFind: (text) async {
                      await Future.delayed(const Duration(seconds: 1));
                      return allCountries
                          .where((element) => element
                              .toLowerCase()
                              .contains(text!.toLowerCase()))
                          .toList();
                    }),
                getSpace(),
                getSearchableOffline(context),
                getSpace(),
                getColorPicker(context),
                getSpace(),
                getChipsInput(context),
                getSpace(),
                getCurpertinoDatetime(context),
                getSpace(),
                getCupertinoDate(context),
                getSpace(),
                getCupertinoTime(context),
                getSpace(),
                getTypeAHead(context),
                getSpace(),
                getTouchSpin(),
                getSpace(),
                getRatingBar(),
                getSpace(),
                getSignaturePad(),
                getSpace(),
                AnterosFormImagePicker(
                  name: 'photos',
                  displayCustomType: (obj) =>
                      obj is ApiImage ? obj.imageUrl : obj,
                  decoration:
                      const InputDecoration(labelText: 'Selecione as imagens'),
                  maxImages: 5,
                  initialValue: [
                    'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                    const Text('this is an image\nas a widget !'),
                    ApiImage(
                      id: 'whatever',
                      imageUrl:
                          'https://images.pexels.com/photos/8311418/pexels-photo-8311418.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                    ),
                  ],
                ),
                AnterosFormAssetPicker(
                    name: 'pick-file',
                    allowedExtensions: _allowedExtensions,
                    allowMultiple: true,
                    maxFiles: 5,
                    type: FileType.custom,
                    decoration: const InputDecoration(border: InputBorder.none),
                    selector: Row(children: const [
                      Icon(Icons.file_upload),
                      Text('Upload')
                    ]),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Campo requerido';
                      }
                      bool _checkExt = val.every((element) {
                        if (!_allowedExtensions!.contains(element.extension)) {
                          return false;
                        } else {
                          return true;
                        }
                      });

                      if (_checkExt == false) {
                        return 'Extensão de arquivo não permitida';
                      }
                    }),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: AnterosButton(
                        shape: AnterosButtonShape.standard,
                        child: const Text('Enviar',
                            style: TextStyle(color: AnterosColors.WHITE)),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            debugPrint(_formKey.currentState?.value.toString());
                          } else {
                            debugPrint(_formKey.currentState?.value.toString());
                            debugPrint('validation failed');
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: AnterosButton(
                        shape: AnterosButtonShape.standard,
                        child: const Text('Limpar',
                            style: TextStyle(color: AnterosColors.WHITE)),
                        color: AnterosColors.DANGER,
                        onPressed: () {
                          _formKey.currentState?.reset();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnterosFormSignaturePad getSignaturePad() {
    return AnterosFormSignaturePad(
      labelText: 'Bloco de assinatura',
      name: 'signature',
      border: Border.all(color: Colors.green),
      onChanged: _onChanged,
    );
  }

  AnterosFormRatingBar getRatingBar() {
    return AnterosFormRatingBar(
      labelText: 'Barra de classificação',
      name: 'rate',
      // enabled: false,
      itemSize: 32.0,
      initialValue: 1.0,
      maxRating: 5.0,
      onChanged: _onChanged,
    );
  }

  AnterosFormTouchSpin getTouchSpin() {
    return AnterosFormTouchSpin(
      labelText: "Touch spin",
      name: 'touch_spin',
      initialValue: 10,
      step: 1,
      iconSize: 48.0,
      addIcon: const Icon(Icons.arrow_right),
      subtractIcon: const Icon(Icons.arrow_left),
      onChanged: _onChanged,
    );
  }

  AnterosFormTypeAhead<String> getTypeAHead(BuildContext context) {
    return AnterosFormTypeAhead<String>(
      context: context,
      labelText: "Auto complete",
      hintText: "Comece a digitar o nome do país",
      name: 'country',
      onChanged: _onChanged,
      itemBuilder: (context, country) {
        return ListTile(
          title: Text(country),
        );
      },
      controller: TextEditingController(text: ''),
      initialValue: 'Brazil',
      suggestionsCallback: (query) {
        if (query.isNotEmpty) {
          var lowercaseQuery = query.toLowerCase();
          return allCountries.where((country) {
            return country.toLowerCase().contains(lowercaseQuery);
          }).toList(growable: false)
            ..sort((a, b) => a
                .toLowerCase()
                .indexOf(lowercaseQuery)
                .compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
        } else {
          return allCountries;
        }
      },
    );
  }

  AnterosFormCupertinoDateTimePicker getCupertinoTime(BuildContext context) {
    return AnterosFormCupertinoDateTimePicker(
      name: 'time',
      labelText: "Cupertino seletor hora",
      initialValue: DateTime.now(),
      inputType: CupertinoDateTimePickerInputType.time,
      locale: const Locale.fromSubtags(languageCode: 'en_GB'),
    );
  }

  AnterosFormCupertinoDateTimePicker getCupertinoDate(BuildContext context) {
    return AnterosFormCupertinoDateTimePicker(
      name: 'date',
      labelText: "Cupertino seletor data",
      initialValue: DateTime.now(),
      inputType: CupertinoDateTimePickerInputType.date,
      locale: const Locale.fromSubtags(languageCode: 'en_GB'),
    );
  }

  AnterosFormCupertinoDateTimePicker getCurpertinoDatetime(
      BuildContext context) {
    return AnterosFormCupertinoDateTimePicker(
      name: 'date_time',
      labelText: "Cupertino seletor data/hora",
      initialValue: DateTime.now(),
      inputType: CupertinoDateTimePickerInputType.both,
      locale: const Locale.fromSubtags(languageCode: 'en_GB'),
    );
  }

  AnterosFormChipsInput<Contact> getChipsInput(BuildContext context) {
    return AnterosFormChipsInput<Contact>(
      name: 'chips_test',
      labelText: 'Entrada de fichas',
      onChanged: _onChanged,
      maxChips: 5,
      findSuggestions: (String query) {
        if (query.isNotEmpty) {
          var lowercaseQuery = query.toLowerCase();
          return contacts.where((profile) {
            return profile.name.toLowerCase().contains(query.toLowerCase()) ||
                profile.email.toLowerCase().contains(query.toLowerCase());
          }).toList(growable: false)
            ..sort((a, b) => a.name
                .toLowerCase()
                .indexOf(lowercaseQuery)
                .compareTo(b.name.toLowerCase().indexOf(lowercaseQuery)));
        } else {
          return const <Contact>[];
        }
      },
      chipBuilder: (context, state, profile) {
        return InputChip(
          key: ObjectKey(profile),
          label: Text(profile.name),
          avatar: CircleAvatar(
            backgroundImage: NetworkImage(profile.imageUrl),
          ),
          onDeleted: () => state.deleteChip(profile),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      },
      suggestionBuilder: (context, state, profile) {
        return ListTile(
          key: ObjectKey(profile),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(profile.imageUrl),
          ),
          title: Text(profile.name),
          subtitle: Text(profile.email),
          onTap: () => state.selectSuggestion(profile),
        );
      },
    );
  }

  AnterosFormColorPickerField getColorPicker(BuildContext context) {
    return AnterosFormColorPickerField(
      name: 'color_picker',
      labelText: 'Seletor de cor',
      initialValue: Colors.yellow,
      // readOnly: true,
      colorPickerType: AnterosColorPickerType.materialPicker,
    );
  }

  AnterosFormSearchableDropdown<String> getSearchableOffline(
      BuildContext context) {
    return AnterosFormSearchableDropdown<String>(
      context: context,
      name: 'searchable_dropdown_offline',
      labelText: 'Lista pesquisável Offline',
      items: allCountries,
      onChanged: _onChanged,
      showSearchBox: true,
    );
  }
}
