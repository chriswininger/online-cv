Chris Wininger Online CV/Resume
==================================

This is the repo I used to generate my online resume along with a pdf version. It is currenlty hosted at chriswininger.com
using netlify.

It is built using Jekyll along with a theme designed by Xiaoying Riley at [3rd Wave Media](http://themes.3rdwavemedia.com/).

### Deployment

This site is hosted via (netlify)[https://www.netlify.com]. Netlify is configured to watch the main branch of this
repository and perform a deployment each time a change is pushed.

To perform the build it executes the docker-build_image_and_build_site script which builds a docker image based on the
current state of the repo. This image is then executed with the build command producing the statically built site under
./docker-build-output/_site. This directory is the directory which is served.

### Dependencies

1. Docker (This is really all you should need now, the docker image should handle debug serving and builds) 
2. ruby@2.6.9
3. phatomjs
4. lessc
5. node/npm: Much of this may go away as it was mostly used to orchestrate building, though we'll still need lessc



### Building

This is in progress, see Docker sections below. The ruby and gem versions this is pinned to are quite old and hard to update
so going forward this project will be managed through docker.

At this time the docker scripts are pretty close, but they still likely need to invoke the lessc command and copy css
files to assets and there should probably be a way to update and push new versions of the pdf to assets without manual
interventions.

* To do a full build production style run `./docker-build_image_and_build_site.sh`
  * Check for output under `docker-builds-output/_site`

### About `./docker-print_pdf`

This script can be used to update the pdf checked into assets/documents/resume.pdf. It used to be necessary to manually update this
and check it into source control. That is no longer the chase though as the docker build process will update this inside
the image making sure the static output has the current version.

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

### Other interesting info

There is a jekyll build command which publishes the static site to _site

### Build Steps ###

* After changes css less files run `lessc ./assets/less/default/styles.less ./assets/less/css/styles.css`
* Followed by `mv ./assets/less/css/styles.css ./assets/css/styles.css`
