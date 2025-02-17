# Lorem Ipsum

A sample project containing a set of small files in a wide variety of formats useful for testing tools, content management systems, collaboration tools.

The build will produce a number of files in the `build` directory and the content may be used to host a small website using:

- a local web server
- docker
- cloud foundry

See the [project board](https://github.com/dougapd/loremipsum/projects/1?fullscreen=true) for more info

## Getting Started

Clone this repository to a folder on your computer.

Install Python with pip. This can be done in a number of ways including [`homebrew`](https://brew.sh/) as follows:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew install python
```

In the application folder, type the following to install the prerequisites:

```
make dependencies
```

Use make to build the content

```
make all
```

## Making Changes

To make changes, add new files into the `source` folder and update the index.md file which contains links to all the content. Ideally generate the files from existing ones.


## Preview

then run the tests to ensure it is consistent

```
make tests
```

## GitHub actions and packages 
will use this repo to test out GitHub actions and github packages


## License

[LICENSE](LICENSE.txt)

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Dataset" property="dct:title" rel="dct:type">LOREM IPSUM</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/dougapd/loremipsum" property="cc:attributionName" rel="cc:attributionURL">Lorem Ipsum</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.
