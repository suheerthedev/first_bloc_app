import 'package:bloc_practice/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_practice/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Wishlist", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state.runtimeType == WishlistLoadingState) {
            return Center(child: CircularProgressIndicator(color: Colors.teal));
          } else if (state.runtimeType == WishlistSuccessState) {
            final successState = state as WishlistSuccessState;
            return ListView.builder(
              itemCount: successState.wishlistItems.length,
              itemBuilder: (context, index) {
                return WishlistTileWidget(
                  wishlistItem: successState.wishlistItems[index],
                  wishlistBloc: wishlistBloc,
                );
              },
            );
          } else if (state.runtimeType == WishlistEmptyState) {
            return Center(
              child: Text(
                "Wishlist is Empty",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
