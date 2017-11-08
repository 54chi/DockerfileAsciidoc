# Asciidoctor Docker Container

An asciidoctor dockerfile with nodejs and compass support (~370Mb)

### Features:

This Docker container provides:

* Alpine (latest)
* Node (latest)
* Asciidoctor 1.5.6.1
* Aciidoctor Diagram with Graphviz integration so you can use plantuml and graphiz diagrams
* Asciidoctor PDF (alpha)
* Source highlighting using CodeRay or Pygments
* Asciidoctor Stylesheet factory

## Getting Started

You will need to have [**docker**](https://www.docker.com/) installed in your machine and clone/download this repo.

Using the Dockerfile is as simple as having the docker daemon run one. The output after executing the script will be the ID of the new docker image.

Usage:

The first time, you will need to build a base image using the Dockerfile at current location

#### Example: sudo docker build -t [image_name] .

```sh
$ sudo docker build -t cc_asciidoctor .  
```

After the image is ready (it should take a few minutes), you are ready to spawn containers based on that image:

### Using the container:

From within the container:

#### To run:

HTML:

`asciidoctor -b html5 -a stylesheet=foundation.css -r asciidoctor-diagram -a toc=left techtraining.adoc`

PDF:

`asciidoctor-pdf  -r asciidoctor-diagram techtraining.adoc`


#### Asciidoctor Themes:

The themes are built from SASS and are using the [Stylesheet Factory]( https://github.com/asciidoctor/asciidoctor-stylesheet-factory)

To build:

`compass compile`

The generated stylesheets will be upserted into the `css` folder.
