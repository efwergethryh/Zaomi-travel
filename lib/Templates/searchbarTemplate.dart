import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:transportation_application/barPages.dart/Explore.dart';
import 'package:transportation_application/Providers/passenger_notifier.dart';
import 'package:transportation_application/Templates/snackBar.dart';

class searchBar extends StatefulWidget {
  late String title;
  late Function(String _) update;
  searchBar({required this.title, required this.update});
  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  
  List<String> suggestons = [
    'Afghanistan', 'Albania', 'Algeria', 'Andorra', 'Angola',
    'Antigua and Barbuda', 'Argentina', 'Armenia', 'Australia', 'Austria',
    'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus',
    'Belgium', 'Belize', 'Benin', 'Bhutan', 'Bolivia',
    'Bosnia and Herzegovina', 'Botswana', 'Brazil', 'Brunei', 'Bulgaria',
    'Burkina Faso', 'Burundi', 'Cabo Verde', 'Cambodia', 'Cameroon',
    'Canada', 'Central African Republic', 'Chad', 'Chile', 'China', 'Colombia',
    'Comoros', 'Congo', 'Costa Rica', 'Cote d\'Ivoire',
    'Croatia', 'Cuba', 'Cyprus', 'Czechia', 'Denmark', 'Djibouti', 'Dominica',
    'Dominican Republic', 'Ecuador', 'Egypt', 'El Salvador',
    'Equatorial Guinea', 'Eritrea', 'Estonia', 'Eswatini', 'Ethiopia', 'Fiji',
    'Finland', 'France', 'Gabon', 'Gambia', 'Georgia', 'Germany',
    'Ghana', 'Greece', 'Grenada', 'Guatemala', 'Guinea', 'Guinea-Bissau',
    'Guyana', 'Haiti', 'Honduras', 'Hungary', 'Iceland', 'India',
    'Indonesia', 'Iran', 'Iraq', 'Ireland', 'Israel', 'Italy', 'Jamaica',
    'Japan', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati', 'Korea',
    'Kuwait', 'Kyrgyzstan', 'Laos', 'Latvia', 'Lebanon', 'Lesotho', 'Liberia',
    'Libya', 'Liechtenstein', 'Lithuania', 'Luxembourg',
    'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta',
    'Marshall Islands', 'Mauritania', 'Mauritius', 'Mexico', 'Micronesia',
    'Moldova', 'Monaco', 'Mongolia', 'Montenegro', 'Morocco', 'Mozambique',
    'Myanmar', 'Namibia', 'Nauru', 'Nepal', 'Netherlands',
    'New Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'North Macedonia', 'Norway',
    'Oman', 'Pakistan', 'Palau', 'Panama', 'Papua New Guinea',
    'Paraguay', 'Peru', 'Philippines', 'Poland', 'Portugal', 'Qatar', 'Romania',
    'Russia', 'Rwanda', 'Saint Kitts and Nevis', 'Saint Lucia',
    'Saint Vincent and the Grenadines', 'Samoa', 'San Marino',
    'Sao Tome and Principe', 'Saudi Arabia', 'Senegal', 'Serbia', 'Seychelles',
    'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands',
    'Somalia', 'South Africa', 'South Sudan', 'Spain', 'Sri Lanka',
    'Sudan', 'Suriname', 'Sweden', 'Switzerland', 'Syria', 'Taiwan',
    'Tajikistan', 'Tanzania', 'Thailand', 'Timor-Leste', 'Togo', 'Tonga',
    'Trinidad and Tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Tuvalu',
    'Uganda', 'Ukraine', 'United Arab Emirates', 'United Kingdom',
    'United States', 'Uruguay', 'Uzbekistan', 'Vanuatu', 'Vatican City',
    'Venezuela', 'Vietnam', 'Yemen', 'Zambia', 'Zimbabwe'
    // Add more countries as needed
  ];
  late SuggestionsBoxController _suggestionsBoxController =
      SuggestionsBoxController();
  TextEditingController _textEditingController = TextEditingController();
  bool showSuggestions = false;
  TextProvider textProvider = TextProvider();
  String query = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: new Size(MediaQuery.of(context).size.width, 200.0),
          child: Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(colors: [
              const Color.fromARGB(255, 12, 81, 138),
              Color.fromARGB(255, 142, 173, 199)
            ])),
            padding:
                new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30, bottom: 20.0, left: 10),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                    print(query);
                  },
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              TypeAheadField(
                suggestionsBoxController: _suggestionsBoxController,
                hideSuggestionsOnKeyboardHide: true,
                animationDuration: Duration.zero,
                textFieldConfiguration: TextFieldConfiguration(
                    controller: _textEditingController,
                    onTap: () {},
                    autofocus: true,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(border: OutlineInputBorder())),
                suggestionsBoxDecoration:
                    SuggestionsBoxDecoration(color: Colors.lightBlue[50]),
                suggestionsCallback: (pattern) {
                  List<String> matches = <String>[];
                  matches.addAll(suggestons);

                  matches.retainWhere((s) {
                    return s.toLowerCase().contains(pattern.toLowerCase());
                  });
                  return matches;
                },
                hideOnEmpty: true,
                itemBuilder: (context, sone) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(sone.toString()),
                    ),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  this._textEditingController.text = suggestion;
                  widget.update(suggestion);

                  print(textProvider.searchInput);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
