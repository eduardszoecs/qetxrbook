

## Install additional packages

Packages extent the functionality of R. Currently, there are more the 7000 packages available on the main repository [CRAN](https://cran.r-project.org/).

To install a package simply type


```r
install.packages('vegan')
```

into the console and hit `ENTER`.
This will download and **install** the `vegan` package to your computer and you should see something like this:


```r
Installing package into ‘/home/edisz/R_libs/all’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/src/contrib/vegan_2.3-0.tar.gz'
Content type 'application/x-gzip' length 2059624 bytes (2.0 MB)
==================================================
downloaded 2.0 MB

* installing *source* package ‘vegan’ ...
** package ‘vegan’ successfully unpacked and MD5 sums checked
** libs
[...]
** testing if installed package can be loaded
* DONE (vegan)
```

After installing the package, you need to **load** the package to use its functionality, which is done with the `library()` function.


```r
library('vegan')
```

Now we have the additional functions available, like RDA:

```r
?rda
```


#### Update a package
You only need to install a package once. However, from time to time you should update the packages.
This can be done via


```r
update.packages(ask = FALSE)
```

Or by using the [RStudio interface](../rintro/rstudio.html) (`Update` button in the packages pane).



### Exercises

1. Update all your packages
2. Install the following packages (we will need them later on):

* `drc`
* `vegan`
* `multcomp`

(Hint: To save you some typing/copyinf: you can also install multiple packages at once.)
