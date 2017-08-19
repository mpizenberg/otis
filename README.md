# otis

Outlining on touch device for image segmentation (otis).

This repository aims at providing a fully reproducible research work
accepted at ACM Multimedia 2017.
It features a web application, client and server,
as well as the data retrieved from the user study,
and the code to analyze it.

## Installation

First, you can retrieve this application with git (beware of submodules):

```shell
git clone --recursive https://github.com/mpizenberg/otis.git
cd otis
```

The API server is an [express] app, which requires Node.js.
The client web app is based on [elm].
Make is used to ease the installation and compilation

[express]: https://expressjs.com/
[elm]: http://elm-lang.org/

### Requirements

You can check your version installed with the `--version` flag.
For make for example: `make --version`.
For Node and npm, I recommend using [nvm][install-nvm].

* [Node.js][install-node] >= 7.6 (using `async` and `await` in server)
* [npm][install-npm] (tested with 5.2.0)
* [elm][install-elm] = 0.18.0 <= v < 0.19
* make (tested with 4.2.1)
* matlab for analysis (tested with R2016b)

[install-node]: https://nodejs.org/en/download/package-manager/
[install-npm]: https://docs.npmjs.com/getting-started/installing-node
[install-elm]: https://guide.elm-lang.org/install.html
[install-nvm]: https://github.com/creationix/nvm#install-script

### Installation

```shell
# if requirements are satisfied, install with:
make install
```

### Configuration

During the installation, two non-versioned files are created: `.env` and `api/.env`.
Change their content for custom configuration (ports, ...).

## Compilation (local web server)

This will compile and run a local instance of the web server application.

```shell
make
```

The default server port is 8000,
now you can just open your browser at `localhost:8000`

## Data analysis

For reference, the data retrieved from the user study is available
in the `users_annotations/` directory.
All the code to process this data is located in the `analysis/` directory.
A make rule is available to run it with default parameters:

```shell
make analyse
```

This will process the users annotations and generate the figures
used in the research paper.
You can of course run this manually by opening matlab in the `analysis/` folder.

## Creative reference ;)

[monologue d'Otis (Edouard Baer) dans Mission Cleopatre][monologue]

[monologue]: https://youtu.be/AMij3xjEW-A
