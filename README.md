This theme is designed by Xiaoying Riley at 3rd Wave Media (http://themes.3rdwavemedia.com/). Visit her website for more themes [http://themes.3rdwavemedia.com/](http://themes.3rdwavemedia.com/)


I have made this into a Jekyll Theme.
**Demo:** [http://webjeda.com/online-cv/](http://webjeda.com/online-cv/)

The default theme would look like this

![online cv Jekyll theme](https://github.com/sharu725/online-cv/raw/master/assets/images/online-cv-jekyll-theme.png)

The theme is responsive

![online cv responsive Jekyll theme](https://github.com/sharu725/online-cv/raw/master/assets/images/online-cv-responsive-jekyll-theme.png)

There are 6 color schemes available

![online cv Jekyll theme](https://github.com/sharu725/online-cv/raw/master/assets/images/online-cv-jekyll-theme-2.png)

## Installation
* Fork the repository
* Go to settings and set Github Pages source as master.
* Your new site should be ready at https://username.github.io/online-cv/

[Watch my video on instlallation](https://www.youtube.com/embed/T2nx6tj-ZH4)

Thanks to [Nelson Estevão](https://github.com/nelsonmestevao) for all the [contributions](https://github.com/sharu725/online-cv/commits?author=nelsonmestevao).

Check out for more themes: [**Jekyll Themes**](http://jekyll-themes.com)

### Build Steps ###
* After changes css less files run `lessc ./assets/less/default/styles.less ./assets/less/css/styles.css`
* Followed by `mv ./assets/less/css/styles.css ./assets/css/styles.css`

## Build New PDF ##

* build-resume DOES NOT YET WORK INSTEAD:
* npm run start-pdf-version
* npm run output-resume

## Other Notes ##

* currently working with ruby v2.4.2p198 (2017-09-14 revision 59899) and node v8.9.4
* On System76 16.04 laptop it does build unless logged into a tmux session

