import 'package:flutter/material.dart';
import 'package:anterosflutter/anterosflutter.dart';
import 'package:dio/dio.dart';
import 'package:async/async.dart';

class FeaturesOptionAsync extends StatefulWidget {
  @override
  _FeaturesOptionAsyncState createState() => _FeaturesOptionAsyncState();
}

class _FeaturesOptionAsyncState extends State<FeaturesOptionAsync> {
  String? _user;
  List<AnterosChoice<String>> _users = [];
  bool? _usersIsLoading;

  List<String> _countries = [];
  final _countriesMemoizer = AsyncMemoizer<List<AnterosChoice<String>>>();

  List<String> _invitations = [];
  List<String> _breeds = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 7),
        AnterosSmartSelect<String?>.single(
          title: 'Admin',
          selectedValue: _user,
          onChange: (selected) => setState(() => _user = selected.value),
          modalFilter: true,
          choiceItems: _users,
          choiceType: AnterosChoiceType.chips,
          choiceGrouped: true,
          choiceStyle: AnterosChoiceStyle(
            showCheckmark: true,
            highlightColor: Theme.of(context).primaryColor.withOpacity(.4),
          ),
          choiceActiveStyle: AnterosChoiceStyle(
            raised: true,
            highlightColor: Theme.of(context).accentColor.withOpacity(.4),
          ),
          choiceSecondaryBuilder: (context, state, choice) => CircleAvatar(
            backgroundImage: NetworkImage(choice.meta['picture']['thumbnail']),
          ),
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              isLoading: _usersIsLoading,
              leading: Builder(
                builder: (context) {
                  String avatarUrl = state.selected?.choice != null
                      ? state.selected?.choice?.meta['picture']['thumbnail']
                      : 'https://source.unsplash.com/8I-ht65iRww/100x100';
                  return CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                  );
                },
              ),
            );
          },
        ),
        const Divider(indent: 20),
        FutureBuilder<List<AnterosChoice<String>>>(
          initialData: [],
          future: this._countriesMemoizer.runOnce(_getCountries),
          builder: (context, snapshot) {
            return AnterosSmartSelect<String>.multiple(
              title: 'Country',
              selectedValue: _countries,
              modalFilter: true,
              choiceItems: snapshot.data,
              choiceGrouped: true,
              choiceType: AnterosChoiceType.checkboxes,
              onChange: (selected) {
                setState(() => _countries = selected.value);
              },
              tileBuilder: (context, state) {
                return AnterosTile.fromState(
                  state,
                  isTwoLine: true,
                  isLoading:
                      snapshot.connectionState == ConnectionState.waiting,
                  leading: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.flag),
                  ),
                );
              },
            );
          },
        ),
        const Divider(indent: 20),
        AnterosSmartSelect<String>.multiple(
          title: 'Invite Friends',
          selectedValue: _invitations,
          // selectedResolver: (values) {
          //   return Future.value(AnterosChoice.listFrom<String, String>(
          //     source: values,
          //     value: (i, v) => v,
          //     title: (i, v) => v,
          //   ));
          // },
          choiceLoader: (info) {
            return _getUsers(
              limit: info.limit ?? 20,
              page: info.page ?? 0,
            );
          },
          choiceConfig: const AnterosChoiceConfig(
            type: AnterosChoiceType.cards,
            gridCount: 3,
            gridSpacing: 2,
            pageLimit: 17,
          ),
          choiceSecondaryBuilder: (context, state, choice) {
            return CircleAvatar(
              backgroundImage: NetworkImage(
                choice.meta['picture']['thumbnail'],
              ),
            );
          },
          onChange: (selected) {
            setState(() => _invitations = selected.value);
          },
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              isLoading: state.selected.isResolving,
              leading: const SizedBox(
                width: 40,
                height: 40,
                child: Icon(Icons.people_alt),
              ),
            );
          },
        ),
        AnterosSmartSelect<String>.multiple(
          title: 'Cat Breeds',
          selectedValue: _breeds,
          // selectedResolver: (values) {
          //   return Future.value(AnterosChoice.listFrom<String, String>(
          //     source: values,
          //     value: (i, v) => v,
          //     title: (i, v) => v,
          //   ));
          // },
          choiceLoader: (info) {
            return _getCatBreeds(
              limit: info.limit ?? 20,
              page: (info.page ?? 0) - 1,
            );
          },
          choiceConfig: const AnterosChoiceConfig(
            type: AnterosChoiceType.cards,
            gridCount: 3,
            gridSpacing: 2,
            pageLimit: 17,
          ),
          choiceSecondaryBuilder: (context, state, choice) {
            return CircleAvatar(
              backgroundImage: NetworkImage(choice.meta),
            );
          },
          onChange: (selected) {
            setState(() => _invitations = selected.value);
          },
          tileBuilder: (context, state) {
            return AnterosTile.fromState(
              state,
              isTwoLine: true,
              isLoading: state.selected.isResolving,
              leading: CircleAvatar(
                backgroundColor: state.theme.primaryColor,
                child: Text((state.selected.length).toString()),
              ),
            );
          },
        ),
        const SizedBox(height: 7),
      ],
    );
  }

  @override
  initState() {
    super.initState();

    _loadUsers();
  }

  void _loadUsers() async {
    try {
      setState(() => _usersIsLoading = true);
      final choices = await _getUsers();
      setState(() => _users = choices);
    } catch (e) {
      print(e);
    } finally {
      setState(() => _usersIsLoading = false);
    }
  }

  Future<List<AnterosChoice<String>>> _getUsers({
    String fields = 'gender,name,nat,picture,email',
    int limit = 25,
    int page = 0,
  }) async {
    final Map<String, dynamic> params = {
      'seed': 'smartselect',
      'inc': fields,
      'results': limit.toString(),
      'page': page.toString(),
    };
    final String url = "https://randomuser.me/api";
    final Response res = await Dio().get(url, queryParameters: params);
    return AnterosChoice.listFrom<String, dynamic>(
      source: res.data['results'],
      value: (index, item) => item['email'],
      title: (index, item) =>
          item['name']['first'] + ' ' + item['name']['last'],
      subtitle: (index, item) => item['email'],
      group: (index, item) => item['gender'],
      meta: (index, item) => item,
    );
  }

  Future<List<AnterosChoice<String>>> _getCountries([String? query]) async {
    final Map<String, dynamic> params = {
      'fields': 'name;capital;region;subregion',
    };
    final String path = query == null ? 'all' : 'name/$query';
    final String url = "https://restcountries.com/v3.1/$path";
    final Response res = await Dio().get(url /*, queryParameters: params*/);
    final result = AnterosChoice.listFrom<String, dynamic>(
      source: res.data,
      value: (index, item) {
        try {
          return '${item['region']} - ${item['name']['common']}';
        } catch (e) {
          return 'Unknown value';
        }
      },
      title: (index, item) {
        return item['name']['common'];
      },
      subtitle: (index, item) {
        try {
          return item['capital'].first ?? 'Unknown';
        } catch (e) {
          return 'Unknown';
        }
      },
      group: (index, item) => item['region'],
    );

    return result;
  }

  Future<List<AnterosChoice<String>>> _getCatBreeds({
    int limit = 25,
    int page = 1,
  }) async {
    final Map<String, dynamic> params = <String, String>{
      'api_key': '81ae0339-431c-475b-b78f-d53685c3cee3',
      'limit': limit.toString(),
      'page': page.toString(),
    };
    final String url = "https://api.thecatapi.com/v1/breeds";
    final Response res = await Dio().get(url, queryParameters: params);
    // print(res.request.uri);
    return AnterosChoice.listFrom<String, dynamic>(
      source: res.data,
      value: (index, item) => item['id'],
      title: (index, item) => item['name'],
      subtitle: (index, item) => item['temperament'],
      group: (index, item) => item['origin'],
      meta: (index, item) => item['image']['url'],
    );
  }
}
