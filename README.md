# otis

Outlining on touch device for image segmentation (otis).

> [1] Outlining Objects for Interactive Segmentation on Touch Devices. 2017.
> Matthieu Pizenberg, Axel Carlier, Emmanuel Faure, Vincent Charvillat.
> In Proceedings of the 25th ACM International Conference on multimedia (MM'17).
> DOI: https://doi.org/10.1145/3123266.3123409

![paper cover][cover]

This repository aims at providing a fully reproducible research work
accepted at ACM Multimedia 2017.
It features a web application, client and server,
as well as the data retrieved from the user study,
and the code to analyze it and render the paper figures.
Please cite the aforementioned paper if used in a research work.

Here is the author version of the paper, for personal usage only:
[Outlining Objects for Interactive Segmentation on Touch Devices][paper]

[paper]: https://mpizenberg.github.io/resources/papers/outlining-objects-interactive.pdf
[cover]: https://mpizenberg.github.io/resources/papers/outlining-objects-interactive.jpg

> Other citations may be required depending on which part
> of this project you are using.
> Please refer to the References section for more details.

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

**Web application**:

If you are only interested in the web application,
the required dependencies are:
* make (tested with 4.2.1)
* Node.js >= 7.6 (using `async` and `await` in server)
* elm 0.18.0 <= v < 0.19

To avoid the possibility of conflicts with a root global install,
I strongly recommend to use [nvm (Node Version Manager)][install-nvm].

After installing nvm, installing node (and npm) and then elm is as easy as
running the following commands from anywhere:

```shell
nvm install node           # will install latest node and npm
nvm use node               # choose this latest version as current
npm install -g elm@0.18.0  # install elm in your current node packages
```

**Results analysis**:

If you are only interested in the results analysis,
the required dependencies are:
* make (tested with 4.2.1)
* matlab (tested with R2016b)

[install-nvm]: https://github.com/creationix/nvm#install-script

### Installation

First move into the `otis/` directory and ...

To install only the otis web application:

```shell
# if requirements are satisfied, install with:
make install_webapp
```

To install only the study results analysis:

```shell
# if requirements are satisfied, install with:
make install_analysis
```

To install everything:

```shell
# if requirements are satisfied, install with:
make install
```

### Configuration of web application

During the installation, two non-versioned files are created: `.env` and `api/.env`.
Change their content for custom configuration (ports, ...).

## Compilation of web application

This will compile and run a local instance of the web server application.

```shell
make webapp
```

The default server port is 8000,
now you can just open your browser at `localhost:8000`

## User study data analysis

For reference, the data retrieved from the user study is available
in the `users_annotations/` directory.
All the code to process this data is located in the `analysis/` directory.
A make rule is available to run it with default parameters:

```shell
make analyse
```

This will process the users annotations and generate the figures
used in the research paper.
All generated figures and cached intermediary results are stored
into the directory `analysis/results`.
You can of course run this manually by opening matlab in the `analysis/` folder
and running the `main.m` function.

## License

As a result of the dependency to GCMex in the analysis,
this software is licensed under the GNU GPL.

However, the web application parts (api and webclient)
are published under the MPL-2.0.

## References

Please cite the following paper if you use this in a research work.

> [1] Outlining Objects for Interactive Segmentation on Touch Devices. 2017.
> Matthieu Pizenberg, Axel Carlier, Emmanuel Faure, Vincent Charvillat.
> In Proceedings of the 25th ACM International Conference on multimedia (MM'17).
> DOI: https://doi.org/10.1145/3123266.3123409

Beware that the `analysis` part of this work depends on other research work:

* [Shai Bagon's graph cut wrapper for Matlab (GCMex) (GPL)][bagon-gcmex]
* [Shai Bagon's EDISON wrapper for Matlab (?)][bagon-edison]

[bagon-gcmex]: https://github.com/shaibagon/GCMex
[bagon-edison]: https://github.com/mpizenberg/meanshift_edison_matlab_interface

The GCMex software can only be used for research purposes.
You should cite all the following papers in any resulting publication.

> [2] Efficient Approximate Energy Minimization via Graph Cuts
> Yuri Boykov, Olga Veksler, Ramin Zabih,
> IEEE transactions on PAMI, vol. 20, no. 12, p. 1222-1239, November 2001.
>
> [3] What Energy Functions can be Minimized via Graph Cuts?
> Vladimir Kolmogorov and Ramin Zabih.
> IEEE Transactions on Pattern Analysis and Machine Intelligence (PAMI),
> vol. 26, no. 2, February 2004, pp. 147-159.
>
> [4] An Experimental Comparison of Min-Cut/Max-Flow Algorithms for Energy Minimization in Vision.
> Yuri Boykov and Vladimir Kolmogorov.
> In IEEE Transactions on Pattern Analysis and Machine Intelligence (PAMI),
> vol. 26, no. 9, September 2004, pp. 1124-1137.
>
> [5] Matlab Wrapper for Graph Cut. Shai Bagon.
> in www.wisdom.weizmann.ac.il/~bagon, December 2006.


## Creative reference ;)

[monologue d'Otis (Edouard Baer) dans Mission Cleopatre][monologue]

[monologue]: https://youtu.be/AMij3xjEW-A
