import 'package:flutter/material.dart';

import 'package:fgc7_pelcls_109/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  // const -DetailsScreen({ Key? key }) : super(key: key);
  // Key? es una forma de identificar el widgfet en el arbol de widget
  // de manera independiente o especifica

  @override
  Widget build(BuildContext context) {
    // Cambiar luego por una instancia de movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
        body: CustomScrollView(
      //  El CustomScrollView esta hecho especificamente para trabajar
      //  con slivers que son widgets que tienen comportamiento
      //  preprogramados cuando se hace scroll en el comportamiento del padre
      slivers: [
        _CustomAppBar(),
        //  Añadimos una lista de slivers
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(),
            _Overview(),
            _Overview(),
            _Overview(),
            CastingCards(),
          ]),
        )
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        // title: Text('movie.title'),
        // Podemos ver que title es un widget y podemos definirlo como:
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          // image: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.originalTitle',
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_outline,
                    size: 16,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'movie.voteAverage',
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Esse aliquip ullamco velit duis incididunt. Culpa ipsum deserunt eu consectetur. Nostrud elit ex nostrud laboris tempor laborum Lorem.Ex aute eiusmod aliquip aliquip ullamco amet aute officia sint sint elit do.',
        textAlign: TextAlign.justify,
        style: textTheme.subtitle1,
      ),
    );
  }
}
