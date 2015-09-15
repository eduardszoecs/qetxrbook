

## Community Ecotoxicology

We will analyse the pyrifos data set of **van_den_brink_principal_1999** which is shipped with the vegan package.
Twelve experimental ditches were used in this experiment: Four ditches served as control and the remaining eight were treated in duplicates once with in the insecticide chlorpyrifos at doses of 0.1, 0.9, 6 and 44 ug / L. 
Invertebrates were sampled 11 times from week -4 pre-treatment through week 24 post-treatment. A total of 178 taxa were identified, this resulted in a table  of 132 rows (11 * 12 samples) and 178 columns (taxa).


```r
require(knitcitations)
require(vegan)
data(pyrifos)
head(pyrifos[, c(1:11)])
```

```
##        Simve Daplo Cerpu Alogu Aloco Alore Aloaf Copsp Ostsp Slyla Acrha
## w.4.c1 3.951     0     0     0     0     0     0 2.773 0.000 1.386 0.000
## w.4.c2 2.303     0     0     0     0     0     0 2.079 0.000 0.000 1.099
## w.4.c3 4.595     0     0     0     0     0     0 3.761 0.000 0.693 0.000
## w.4.c4 2.398     0     0     0     0     0     0 3.296 0.693 0.000 0.000
## w.4.c5 4.025     0     0     0     0     0     0 3.466 0.000 0.000 1.609
## w.4.c6 2.303     0     0     0     0     0     0 2.197 0.000 0.000 0.693
```

(van den
Brink and ter
Braak, 1999)
