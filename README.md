# otis

Outlining on touch device for image segmentation (otis).

This repository aims at providing a fully reproducible research work
accepted at ACM Multimedia 2017.
It features a web application, client and server,
as well as the data retrieved from the user study,
and the code to process it.

## Installation

Requirements:
The API server is an [express] app, which requires Node.js.
The client web app is based on [elm].
Make is used to ease the installation and compilation

[express]: https://expressjs.com/
[elm]: http://elm-lang.org/

* Node.js >= 7.6 (using `async` and `await` in server)
* npm
* elm = 0.18 (will be automatically installed if not already)
* make

```shell
# if requirements are satisfied, install with:
make install
```

During the installation, two non-versioned files are created:

* `.env`
* `api/.env`

Change their content for custom use.

## Compilation

```shell
make
```

The default server port is 8000,
now you can just open your browser at `localhost:8000`

## Other

Et pour le clin d'oeil :
[monologue d'Otis (Edouard Baer) dans Mission Cleopatre][monologue]

[monologue]: https://youtu.be/AMij3xjEW-A
