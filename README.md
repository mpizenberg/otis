# otis

Outlining on touch device for image segmentation (otis).
Online demo of the user study web app available at [mm17-otis.pizenberg.fr][demo].

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

[demo]: http://mm17-otis.pizenberg.fr
[paper]: https://mpizenberg.github.io/resources/otis/outlining-objects-interactive.pdf
[cover]: https://mpizenberg.github.io/resources/otis/cover.jpg

> Other citations may be required depending on which part
> of this project you are using.
> Please refer to the References section for more details.

## Table of Contents

* [Installation](#installation)
* [Compilation of web application](#compilation-of-web-application)
* [User study data analysis](#user-study-data-analysis)
* [License](#license)
* [References](#references)
* [FAQ](#faq)

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

### Installing otis

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

Online demo of the user study web app available at [mm17-otis.pizenberg.fr][demo].
The following command will compile and run a local instance of the server.

```shell
make webapp
```

The default server port is 8000,
now you can just open your browser at `localhost:8000`.

To open this on your mobile device, connect to the same network
and load the page `[computer_ip_address]:[port]` on your device.
`[computer_ip_address]` can be figured out with commands `ifconfig` or `ip a`.
`[port]` is the port you have chosen in config, it defaults to 8000.
At loading, you might get at random one of the three interactions
(bounding box, outline, scribbles) as shown in the following screenshot.

![][screenshot-webapp]

[screenshot-webapp]: https://mpizenberg.github.io/resources/otis/screenshot-webapp.jpg

## User study data analysis

For reference, the data retrieved from the user study is available
in the `users_annotations/` directory.
All the code to process this data is located in the `analysis/` directory.
A make rule is available to run it with default parameters:

```shell
make analyse
```

This will process the users annotations and generate the figures
presented in the research paper.
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


## FAQ

**Can I install this on a Mac?**

My guess is that it should work but I don't have any Mac at my disposal
to verify it.

**Can I install this on Windows?**

It will probably not work as is on Windows.
However, I believe that all techno used
(make, matlab, nodejs, elm) are compatible.
Therefore, don't hesitate to reach out and open an issue or pull request
if you know how to make this possible.

**Why don't I get the segmentation masks in the web application?**

It wasn't designed to perform live segmentations, only to gather user interactions.
Our goal was to estimate the viability of these interactions in the context
of fast creation of learning datasets.
As a consequence, we only ask for one interaction (or very few in case of scribbles)
without entering in a interactive refinement feedback loop.

Segmentation masks are computed later in the
"[analysis](#user-study-data-analysis)" part of otis.

**Can I reuse the web application with my own images?**

Yes but you shouldn't.
This web application was designed for the user study presented in the research paper.
The images resources are specified in the file `api/resources_list.json`,
which can be changed with the config file `api/.env` created at installation.
Nevertheless, you won't be able to easily change the user interface for example
to keep only the bounding box interaction.
What I encourage you to do is to reuse this elm package,
[mpizenberg/elm-image-annotation][elm-image-annotation],
and build your own interface with it.

If you are interested in building something more generic and reusable
for the community, reach out to us.

[elm-image-annotation]: https://github.com/mpizenberg/elm-image-annotation


## Creative reference ;)

[monologue d'Otis (Edouard Baer) dans Mission Cleopatre][monologue]

[monologue]: https://youtu.be/AMij3xjEW-A
