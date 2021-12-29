Chris Wininger Online CV/Resume
==================================

This is the repo I used to generate my online resume along with a pdf version. It is currenlty hosted at chriswininger.com
using netlify.

It is built using Jekyll along with a theme designed by Xiaoying Riley at [3rd Wave Media](http://themes.3rdwavemedia.com/).

### Dependencies

1. ruby@2.6.9
2. phatomjs
3. lessc
4. node/npm: Much of this may go away as it was mostly used to orchestrate building, though we'll still need lessc
5. docker

### Building

This is in progress, see Docker sections below. The ruby and gem versions this is pinned to are quite old and hard to update
so going forward this project will be managed through docker.

At this time the docker scripts are pretty close, but they still likely need to invoke the lessc command and copy css
files to assets and there should probably be a way to update and push new versions of the pdf to assets without manual
interventions.

### Build Steps ###

* After changes css less files run `lessc ./assets/less/default/styles.less ./assets/less/css/styles.css`
* Followed by `mv ./assets/less/css/styles.css ./assets/css/styles.css`

### Docker: build

`docker build ./ -t online-cv`

### Docker: Start debug server

`docker run --rm --name online-cv -p 4000:4000 online-cv`

### Docker: Debugging

start attached to a bash session:

`docker run --rm -it --name online-cv online-cv /bin/ba`

or attach to an already running instance:

`docker exec -it online-cv /bin/bash`

### Docker: Serve local debug server

`docker run --rm --name online-cv -p 4000:4000 -v /home/chris/online-cv-pdf-output:/pdf-output online-cv serve`
`

### Docker: Run phantomjs to make pdf

`docker run --rm --name online-cv -p 4000:4000 -v /home/chris/online-cv-pdf-output:/pdf-output online-cv print-pdf`


### More Info From Theme Creator

* [Watch my video on instlallation](https://www.youtube.com/embed/T2nx6tj-ZH4)
