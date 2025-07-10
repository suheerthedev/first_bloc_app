import 'package:bloc_practice/features/cart/ui/cart.dart';
import 'package:bloc_practice/features/home/bloc/home_bloc.dart';
import 'package:bloc_practice/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Wishlist()),
          );
        } else if (state is HomeNavigateToCartActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cart()),
          );
        }
      },
      builder: (context, state) {
        if (state.runtimeType == HomeLoadingState) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (state.runtimeType == HomeLoadedSuccessState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text(
                "Suheer's Grocery App",
                style: TextStyle(color: Colors.white),
              ),

              actions: [
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeWishlistButtonNavigateEvent());
                  },
                  icon: Icon(Icons.favorite_border, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeCartButtonNavigateEvent());
                  },
                  icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
                ),
              ],
            ),
          );
        } else if (state.runtimeType == HomeErrorState) {
          return Scaffold(body: Center(child: Text("Error in loading state")));
        }

        return const Scaffold(body: SizedBox.shrink());
      },
    );
  }
}
