

## Generating data

If you don't have data you can make up some data for yourself ;)
Seriously, this is very helpful when doing simulations. 
We will use these techniques in the parametric bootstrap for Species Sensitivity Distributions (SSDs) [---!!!Link here!!!---].


### Random sampling from a predified vector?

Suppose we have ten beakers in Daphnia mortality test and want to assign them randomly to ten positions on our lab bench (we do this to avoid problems with edge effects).

We could let R decide for us and draw random positions.

The general function for this `sample()`:


```r
sample(1:10)
```

```
##  [1] 10  3  6  2  1  8  7  4  9  5
```

This randomly shuffles the ten positions. So the first beaker goes to position 8, the second to 10 and so on.

If we repeat this 


```r
sample(1:10)
```

```
##  [1]  4 10  6  5  1  7  8  9  3  2
```

we get a different result, because of random draws.
However, this your computer is a machine and therefore generates only pseudo-random numbers.
We can fix and replicate the random numbers of we specify a start point for the random number generator (RNG).
We do this with the `set.seed()` function.


```r
set.seed(1234)
sample(1:10)
```

```
##  [1]  2  6  5  8  9  4  1  7 10  3
```


If we repeat this with exactly the same start point of the RNG (`set.seed(1234)`) we get the same numbers:


```r
set.seed(1234)
sample(1:10)
```

```
##  [1]  2  6  5  8  9  4  1  7 10  3
```

The argument of set.seed can be every integer. This function is especially useful if your code contains random sampling and you want someoneelse to exactly produce the same results as you.


If you want to assign your experimental units randomly to two treatments you can also use `sample()`.

Here I assign the ten experimental units to different treatments:


```r
sample(x = c('Control', 'Treatment1'), size = 10, replace = TRUE)
```

```
##  [1] "Treatment1" "Treatment1" "Control"    "Treatment1" "Control"   
##  [6] "Treatment1" "Control"    "Control"    "Control"    "Control"
```

Note, that we need to add `replace=TRUE`, because x is only of length 2, but we request ten samples (try what happens if you omit the replace argument).



### Random sampling from a distribution.

We can also draw random samples from distributions.

Here I draw ten samples from a normal distribution with mean 5 and a standard deviation of 1 [=N(5, 1)].

```r
rnorm(n = 10, mean = 5, sd = 1)
```

```
##  [1] 4.522807 4.001614 4.223746 5.064459 5.959494 4.889715 4.488990
##  [8] 4.088805 4.162828 7.415835
```

Similarily for counts from a poisson distributikon with mean 5 [P(5)]:


```r
rpois(n = 10, lambda = 5)
```

```
##  [1] 5 6 4 6 4 5 6 5 3 7
```


Or if we want to simulate flips of coins, the binomial distribution [Bin(1, 0.5)]:


```r
rbinom(n = 10, size = 1, prob = 0.5)
```

```
##  [1] 0 0 1 1 0 1 0 1 0 1
```




