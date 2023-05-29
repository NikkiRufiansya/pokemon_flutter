import 'package:flutter/material.dart';
import 'package:flutter_pokemon/UI/bloc/interface/i_pokemon_list_bloc.dart';
import 'package:flutter_pokemon/UI/widgets/pokemon/pokemon_card.dart';
import 'package:flutter_pokemon/UI/widgets/pokemon/pokemon_tile.dart';
import 'package:flutter_pokemon/application/dependency_injection.dart';
import 'package:flutter_pokemon/domain/models/api_resource.dart';
import 'package:flutter_pokemon/domain/models/pokedex.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({
    Key? key,
  }) : super(key: key);

  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  late final IPokemonListBloc bloc;
  _ViewType _viewType = _ViewType.GRID;

  @override
  void initState() {
    // construir bloc
    bloc = DependencyInjector().pokemonListBloc;
    bloc.initialize();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  Widget _buildPokemonGrid(List<APIResource> data) {
    return SliverPadding(
      padding: EdgeInsets.all(12),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.9,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final pokemon = data[index];
            return IndexedSemantics(
                index: index,
                child: PokemonCard(
                    key: ValueKey(index), pokemonID: pokemon.id.toString()));
          },
          addSemanticIndexes: true,
          childCount: data.length,
        ),
      ),
    );
  }

  Widget _buildPokemonList(List<APIResource> data) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final pokemon = data[index];
        return _buildPokemonTile(pokemon);
      }, childCount: data.length),
    );
  }

  Widget _buildPokemonTile(APIResource pokemon) {
    return PokemonTile(
      bloc: DependencyInjector().getPokemonBloc(pokemon.id),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon'),
        actions: [_buildViewTypeSelector()],
      ),
      body: StreamBuilder<Pokedex>(
        stream: bloc.stream,
        initialData: bloc.pokedex,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(
              semanticChildCount: snapshot.data!.pokemonEntries.length,
              slivers: [
                
                _viewType == _ViewType.GRID
                    ? _buildPokemonGrid(snapshot.data!.pokemonEntries)
                    : _buildPokemonList(snapshot.data!.pokemonEntries),
              ],
            );
          }
          if (snapshot.hasError) {
            return Container(
              child: Text(snapshot.error.toString()),
            );
          }
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildViewTypeSelector() {
    return IconButton(
      onPressed: () {
        setState(() {
          if (_viewType == _ViewType.GRID)
            _viewType = _ViewType.LIST;
          else
            _viewType = _ViewType.GRID;
        });
      },
      icon: Icon(
        _viewType == _ViewType.GRID ? Icons.list : Icons.grid_3x3_outlined,
      ),
    );
  }
}

enum _ViewType { GRID, LIST }
