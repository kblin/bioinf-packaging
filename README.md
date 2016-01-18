# bioinf-packaging

Scripts used to package bioinformatics tools I care about for Debian(-like)
systems. Two approaches are used: 'proper' debian packages for things that are
just updates of what already exists in Debian, and
'[fpm](https://github.com/jordansissel/fpm)'-based quick-and-dirty packages.

## FPM-based

### DIAMOND
Basically, I just grab DIAMOND from the [download
page](http://ab.inf.uni-tuebingen.de/software/diamond/).


### Prodigal
[Prodigal](http://prodigal.ornl.gov/) is built according to the install
instructions and then packaged up with `fpm`.
