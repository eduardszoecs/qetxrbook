

## Community Ecotoxicology

### Introduction

In the previous chapters we have dealt with one species at a time.
However, in nature species occur together with other species and might might interact with each other.
All the species and their interactions occurring at one time and space together form a *community*.

As ecotoxicologists we might also to test whole communities with their biotic interactions in order to make more realistic assessments.



### The data used in this chapter

We will analyse the pyrifos data set of (van den
Brink and ter
Braak, 1999) 
which is shipped with the vegan package. 
This is a classical multivariate dataset as commonly produced in mesocosm experiments.

Twelve experimental ditches were used in this experiment: 
Four ditches served as control and the remaining eight were treated in duplicates once with the insecticide chlorpyrifos at doses of 0.1, 0.9, 6 and 44 ug / L. 
Invertebrates were sampled 11 times from week -4 pre-treatment through week 24 post-treatment. 
A total of 178 taxa were identified, this resulted in a table of 132 rows (11 * 12 samples) and 178 columns (taxa).

The dataset can be found in the `data` folder:

```r
pyrifos <- read.table('data/pyrifos.csv', 
                      header = TRUE, sep = ';')
```

```
## Warning in file(file, "rt"): cannot open file 'data/pyrifos.csv': No such
## file or directory
```

```
## Error in file(file, "rt"): cannot open the connection
```

And check if this has worked as expected:

```r
str(pyrifos)
```

```
## 'data.frame':	132 obs. of  178 variables:
##  $ Simve   : num  3.95 2.3 4.59 2.4 4.03 ...
##  $ Daplo   : num  0 0 0 0 0 0 0 0 0 0.693 ...
##  $ Cerpu   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Alogu   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Aloco   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Alore   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Aloaf   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Copsp   : num  2.77 2.08 3.76 3.3 3.47 ...
##  $ Ostsp   : num  0 0 0 0.693 0 0 0.693 0 0 0 ...
##  $ Slyla   : num  1.386 0 0.693 0 0 ...
##  $ Acrha   : num  0 1.1 0 0 1.61 ...
##  $ Aloex   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Chysp   : num  1.946 0 2.639 1.386 0.693 ...
##  $ Alona   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Plead   : num  0 0 0 0 1.1 ...
##  $ Oxyte   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Grate   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Copdi   : num  4.62 0 0 0 0 ...
##  $ NauLa   : num  8.59 5.99 7.82 6.55 7.78 ...
##  $ CilHa   : num  13.4 11.2 11.8 13.2 11.7 ...
##  $ Strvi   : num  9.27 7.09 9.17 5.3 7.86 ...
##  $ amosp   : num  0 5.99 0 6.69 7.09 ...
##  $ Ascmo   : num  0 6.55 5.3 0 0 ...
##  $ Synsp   : num  6.22 8.37 7.25 5.99 6.69 ...
##  $ Squro   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Squmu   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Polar   : num  6.22 4.62 8.04 8.39 0 ...
##  $ Kerqu   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Anufi   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Mytve   : num  0 0 0 0 0 ...
##  $ Mytvi   : num  4.62 0 0 0 0 ...
##  $ Mytmu   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Lepsp   : num  0 0 5.71 5.3 0 ...
##  $ Leppa   : num  0 5.3 4.62 0 0 ...
##  $ Colob   : num  4.62 0 4.62 0 0 ...
##  $ Colbi   : num  0 0 5.3 5.3 0 ...
##  $ Colun   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Lecsp   : num  0 0 4.62 0 5.3 ...
##  $ Lecqu   : num  0 4.62 0 4.62 0 ...
##  $ Lecco   : num  0 0 0 0 0 ...
##  $ Leclu   : num  0 0 0 0 0 ...
##  $ Lecfl   : num  4.62 0 5.3 0 0 ...
##  $ Tripo   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Cepsp   : num  0 0 0 5.3 5.99 ...
##  $ Monlo   : num  0 0 0 0 0 ...
##  $ Monae   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Scalo   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Trilo   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Tripo.1 : num  0 0 0 0 0 ...
##  $ Tricy   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Trisp   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Tepat   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Rotne   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Notla   : num  0 0 0 0 0 ...
##  $ Filsp   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ Lopox   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ hydrspec: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ bothrosp: num  0 2.35 2.35 3.37 0 ...
##  $ olchaeta: num  4.03 4.99 5.5 6.39 0 ...
##  $ erpoocto: num  4.53 4.62 3.86 4.43 4.92 ...
##  $ glsicomp: num  0 0 0 0 3.37 ...
##  $ alglhete: num  3.86 3.64 4.71 3.64 2.99 ...
##  $ hebdstag: num  0 2.99 0 2.35 0 ...
##  $ sphidae : num  0 2.35 2.99 0 2.35 ...
##  $ ansuvote: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ armicris: num  4.53 6.21 6.88 6 4.18 ...
##  $ bathcont: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ binitent: num  2.35 0 4.18 0 0 ...
##  $ gyraalbu: num  0 0 0 0 0 ...
##  $ hippcomp: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ lymnstag: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ lymnaes7: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ physfont: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ plbacorn: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ popyanti: num  0 2.35 4.78 0 7.28 ...
##  $ radiovat: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ radipere: num  0 0 0 0 3.37 ...
##  $ valvcris: num  0 0 2.35 0 0 ...
##  $ valvpisc: num  0 3.37 6.21 0 0 ...
##  $ hycarina: num  0 2.35 0 0 0 ...
##  $ gammpule: num  0 0 0 0 0 ...
##  $ aselaqua: num  0 0 2.35 0 3.86 ...
##  $ proameri: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ collembo: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ caenhora: num  7.19 6.43 6.21 7.08 7.19 ...
##  $ caenluct: num  0 0 2.35 2.35 2.35 ...
##  $ caenrobu: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ cloedipt: num  8.4 8.34 7.32 8.1 8.39 ...
##  $ cloesimi: num  0 3.37 2.35 3.86 0 ...
##  $ aeshniae: num  2.99 0 0 3.37 0 ...
##  $ libellae: num  0 2.35 0 0 0 ...
##  $ conagrae: num  4.03 4.03 2.35 2.99 4.71 ...
##  $ corident: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ coripanz: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ coripunc: num  0 0 0 0 2.35 ...
##  $ cymabons: num  0 0 0 0 0 ...
##  $ hesplinn: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ hespsahl: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ notoglau: num  0 0 0 0 0 0 0 0 0 0 ...
##   [list output truncated]
```

```r
head(pyrifos)
```

```
##        Simve Daplo Cerpu Alogu Aloco Alore Aloaf Copsp Ostsp Slyla Acrha
## w.4.c1 3.951     0     0     0     0     0     0 2.773 0.000 1.386 0.000
## w.4.c2 2.303     0     0     0     0     0     0 2.079 0.000 0.000 1.099
## w.4.c3 4.595     0     0     0     0     0     0 3.761 0.000 0.693 0.000
## w.4.c4 2.398     0     0     0     0     0     0 3.296 0.693 0.000 0.000
## w.4.c5 4.025     0     0     0     0     0     0 3.466 0.000 0.000 1.609
## w.4.c6 2.303     0     0     0     0     0     0 2.197 0.000 0.000 0.693
##        Aloex Chysp Alona Plead Oxyte Grate Copdi NauLa  CilHa  Strvi amosp
## w.4.c1     0 1.946     0 0.000     0     0 4.615 8.594 13.441  9.269 0.000
## w.4.c2     0 0.000     0 0.000     0     0 0.000 5.994 11.233  7.091 5.994
## w.4.c3     0 2.639     0 0.000     0     0 0.000 7.824 11.823  9.170 0.000
## w.4.c4     0 1.386     0 0.000     0     0 0.000 6.552 13.193  5.303 6.686
## w.4.c5     0 0.693     0 1.099     0     0 0.000 7.784 11.702  7.864 7.091
## w.4.c6     0 0.693     0 0.000     0     0 0.000 6.217 11.672 10.166 5.994
##        Ascmo Synsp Squro Squmu Polar Kerqu Anufi Mytve Mytvi Mytmu Lepsp
## w.4.c1 0.000 6.217     0     0 6.217     0     0     0 4.615     0 0.000
## w.4.c2 6.552 8.367     0     0 4.615     0     0     0 0.000     0 0.000
## w.4.c3 5.303 7.245     0     0 8.040     0     0     0 0.000     0 5.707
## w.4.c4 0.000 5.994     0     0 8.390     0     0     0 0.000     0 5.303
## w.4.c5 0.000 6.686     0     0 0.000     0     0     0 0.000     0 0.000
## w.4.c6 6.804 6.399     0     0 9.787     0     0     0 0.000     0 0.000
##        Leppa Colob Colbi Colun Lecsp Lecqu Lecco Leclu Lecfl Tripo Cepsp
## w.4.c1 0.000 4.615 0.000     0 0.000 0.000 0.000     0 4.615     0 0.000
## w.4.c2 5.303 0.000 0.000     0 0.000 4.615 0.000     0 0.000     0 0.000
## w.4.c3 4.615 4.615 5.303     0 4.615 0.000 0.000     0 5.303     0 0.000
## w.4.c4 0.000 0.000 5.303     0 0.000 4.615 0.000     0 0.000     0 5.303
## w.4.c5 0.000 0.000 0.000     0 5.303 0.000 0.000     0 0.000     0 5.994
## w.4.c6 0.000 4.615 0.000     0 0.000 0.000 4.615     0 0.000     0 0.000
##        Monlo Monae Scalo Trilo Tripo.1 Tricy Trisp Tepat Rotne Notla Filsp
## w.4.c1     0     0     0     0       0     0     0     0     0     0     0
## w.4.c2     0     0     0     0       0     0     0     0     0     0     0
## w.4.c3     0     0     0     0       0     0     0     0     0     0     0
## w.4.c4     0     0     0     0       0     0     0     0     0     0     0
## w.4.c5     0     0     0     0       0     0     0     0     0     0     0
## w.4.c6     0     0     0     0       0     0     0     0     0     0     0
##        Lopox hydrspec bothrosp olchaeta erpoocto glsicomp alglhete
## w.4.c1     0        0    0.000    4.034    4.529     0.00    3.858
## w.4.c2     0        0    2.353    4.986    4.621     0.00    3.644
## w.4.c3     0        0    2.353    5.497    3.858     0.00    4.706
## w.4.c4     0        0    3.370    6.387    4.426     0.00    3.644
## w.4.c5     0        0    0.000    0.000    4.923     3.37    2.987
## w.4.c6     0        0    0.000    3.858    4.312     0.00    3.370
##        hebdstag sphidae ansuvote armicris bathcont binitent gyraalbu
## w.4.c1    0.000   0.000        0    4.529        0    2.353        0
## w.4.c2    2.987   2.353        0    6.211        0    0.000        0
## w.4.c3    0.000   2.987        0    6.882        0    4.183        0
## w.4.c4    2.353   0.000        0    5.997        0    0.000        0
## w.4.c5    0.000   2.353        0    4.183        0    0.000        0
## w.4.c6    2.987   3.644        0    5.340        0    4.784        0
##        hippcomp lymnstag lymnaes7 physfont plbacorn popyanti radiovat
## w.4.c1        0        0        0        0        0    0.000        0
## w.4.c2        0        0        0        0        0    2.353        0
## w.4.c3        0        0        0        0        0    4.784        0
## w.4.c4        0        0        0        0        0    0.000        0
## w.4.c5        0        0        0        0        0    7.276        0
## w.4.c6        0        0        0        0        0    0.000        0
##        radipere valvcris valvpisc hycarina gammpule aselaqua proameri
## w.4.c1    0.000    0.000    0.000    0.000     0.00    0.000        0
## w.4.c2    0.000    0.000    3.370    2.353     0.00    0.000        0
## w.4.c3    0.000    2.353    6.211    0.000     0.00    2.353        0
## w.4.c4    0.000    0.000    0.000    0.000     0.00    0.000        0
## w.4.c5    3.370    0.000    0.000    0.000     0.00    3.858        0
## w.4.c6    2.353    0.000    3.644    0.000     3.37    2.353        0
##        collembo caenhora caenluct caenrobu cloedipt cloesimi aeshniae
## w.4.c1        0    7.190    0.000        0    8.404    0.000    2.987
## w.4.c2        0    6.430    0.000        0    8.344    3.370    0.000
## w.4.c3        0    6.211    2.353        0    7.323    2.353    0.000
## w.4.c4        0    7.081    2.353        0    8.104    3.858    3.370
## w.4.c5        0    7.190    2.353        0    8.393    0.000    0.000
## w.4.c6        0    7.157    2.353        0    8.460    3.370    0.000
##        libellae conagrae corident coripanz coripunc cymabons hesplinn
## w.4.c1    0.000    4.034        0        0    0.000        0        0
## w.4.c2    2.353    4.034        0        0    0.000        0        0
## w.4.c3    0.000    2.353        0        0    0.000        0        0
## w.4.c4    0.000    2.987        0        0    0.000        0        0
## w.4.c5    0.000    4.706        0        0    2.353        0        0
## w.4.c6    0.000    3.858        0        0    0.000        0        0
##        hespsahl notoglau notomacu notoobli notoviri pacoconc pleaminu
## w.4.c1        0        0        0        0    0.000        0        0
## w.4.c2        0        0        0        0    0.000        0        0
## w.4.c3        0        0        0        0    2.353        0        0
## w.4.c4        0        0        0        0    0.000        0        0
## w.4.c5        0        0        0        0    2.987        0        0
## w.4.c6        0        0        0        0    2.353        0        0
##        sigadist sigafall sigastri sigarasp colyfusc donacis6 gyrimari
## w.4.c1        0        0        0        0        0        0    0.000
## w.4.c2        0        0        0        0        0        0    0.000
## w.4.c3        0        0        0        0        0        0    0.000
## w.4.c4        0        0        0        0        0        0    0.000
## w.4.c5        0        0        0        0        0        0    2.353
## w.4.c6        0        0        0        0        0        0    0.000
##        haliconf haliflav haligruf haliobli herubrev hya_herm hyglpusi
## w.4.c1        0        0        0    0.000        0        0        0
## w.4.c2        0        0        0    0.000        0        0        0
## w.4.c3        0        0        0    0.000        0        0        0
## w.4.c4        0        0        0    2.353        0        0        0
## w.4.c5        0        0        0    0.000        0        0        0
## w.4.c6        0        0        0    0.000        0        0        0
##        hyhyovat hypoplan hyporusp hytuinae hytuvers laphminu noteclav
## w.4.c1        0        0        0    0.000    2.353    0.000        0
## w.4.c2        0        0        0    0.000    0.000    0.000        0
## w.4.c3        0        0        0    2.353    2.353    0.000        0
## w.4.c4        0        0        0    3.370    0.000    0.000        0
## w.4.c5        0        0        0    4.183    0.000    2.353        0
## w.4.c6        0        0        0    3.370    0.000    0.000        0
##        rhantusp sialluta ablalong ablaphmo cltanerv malopisp mopetenu
## w.4.c1        0    2.353        0    4.183    0.000        0        0
## w.4.c2        0    2.353        0    3.858    2.353        0        0
## w.4.c3        0    0.000        0    3.858    0.000        0        0
## w.4.c4        0    0.000        0    4.784    0.000        0        0
## w.4.c5        0    0.000        0    2.987    0.000        0        0
## w.4.c6        0    0.000        0    2.353    0.000        0        0
##        prdiussp pstavari chironsp crchirsp crclglat ditendsp mitegchl
## w.4.c1    0.000        0    0.000        0        0        0        0
## w.4.c2    4.034        0    0.000        0        0        0        0
## w.4.c3    3.644        0    0.000        0        0        0        0
## w.4.c4    4.784        0    2.353        0        0        0        0
## w.4.c5    0.000        0    0.000        0        0        0        0
## w.4.c6    2.353        0    0.000        0        0        0        0
##        pachgarc pachgvit popegnub popedisp acriluce chclpige conescut
## w.4.c1        0        0        0        0        0        0        0
## w.4.c2        0        0        0        0        0        0        0
## w.4.c3        0        0        0        0        0        0        0
## w.4.c4        0        0        0        0        0        0        0
## w.4.c5        0        0        0        0        0        0        0
## w.4.c6        0        0        0        0        0        0        0
##        cricotsp liesspec psclbarb psclgsli psclobvi psclplat psclpsil
## w.4.c1        0        0        0    0.000        0        0        0
## w.4.c2        0        0        0    0.000        0        0        0
## w.4.c3        0        0        0    0.000        0        0        0
## w.4.c4        0        0        0    2.353        0        0        0
## w.4.c5        0        0        0    0.000        0        0        0
## w.4.c6        0        0        0    0.000        0        0        0
##        pscladsp cladotsp laa_spec patanysp tatarssp zaa_spec anopmacu
## w.4.c1        0        0        0        0    0.000        0        0
## w.4.c2        0        0        0        0    0.000        0        0
## w.4.c3        0        0        0        0    2.987        0        0
## w.4.c4        0        0        0        0    0.000        0        0
## w.4.c5        0        0        0        0    0.000        0        0
## w.4.c6        0        0        0        0    0.000        0        0
##        cepogoae chaoobsc cucidae4 tabanusp agdasphr athrater cyrncren
## w.4.c1    2.987    2.566        0        0    0.000        0        0
## w.4.c2    3.858    3.387        0        0    2.987        0        0
## w.4.c3    0.000    3.838        0        0    0.000        0        0
## w.4.c4    0.000    2.739        0        0    0.000        0        0
## w.4.c5    2.353    3.757        0        0    3.644        0        0
## w.4.c6    0.000    2.566        0        0    0.000        0        0
##        holodubi holopici leceriae lilurhom monaangu mystazur mystloni
## w.4.c1    0.000    2.353        0    0.000    2.353        0    2.987
## w.4.c2    0.000    2.353        0    0.000    4.312        0    4.529
## w.4.c3    0.000    0.000        0    2.353    0.000        0    4.312
## w.4.c4    0.000    4.183        0    0.000    0.000        0    4.923
## w.4.c5    0.000    0.000        0    2.353    2.353        0    5.997
## w.4.c6    2.353    4.183        0    0.000    0.000        0    3.858
##        oecefurv oecelacu triabico paponysp
## w.4.c1        0        0        0        0
## w.4.c2        0        0        0        0
## w.4.c3        0        0        0        0
## w.4.c4        0        0        0        0
## w.4.c5        0        0        0        0
## w.4.c6        0        0        0        0
```

In this dataset row correspond to samples and the first three columns are identifiers of the sample (`week`, `dose` and `ditch`).

The rest of the columns are the species (with abbreviated names). 
This is a *species x sites* matrix as commonly used in community ecology.

Let's have a first look at the abundance of some taxa during the experiment.
The code here is more lengthy and you don't need to fully understand it.
The code subsets and prepares the data and then shows a plot with time on x-axis, 
abundance on y-axis and dose as color for each species.


[---!!!bettergivedatahere!!!---]


```r
# subset species
take <- c('binitent', 'olchaeta', 'caenhora', 'cloedipt', 'chaoobsc',  'gammpule', 
          'libellae','agdasphr' )
abu <- pyrifos[ , names(pyrifos) %in% take]
names(abu) <- c('Oligochaeta', 'Bithynia tentaculata', 'Gammarus pulex', 
                  'Caenis horaria', 'Cloeon dipterum', 'Libellulidae', 
                  'Chaoborus obscuripes', 'Agrypnia/Dasystegia/Phryganea')

# data has been ln-transformed - back-transformation to raw abundances
abu_t <- round((exp(abu) - 1)/10)

# join with enviromental variables and bring to long format,
require(reshape2)
dfm <- melt(data.frame(dose, week, abu_t), id.vars = c('dose', 'week'))  
# week should be numeric for plot
dfm$week <- as.numeric(as.character(dfm$week))

# x-axis: week, y-axis: abundances (log-scale), color: doses, splitted by taxon)
require(ggplot2)
ggplot(dfm, aes(x = week, y = value + 1, col = dose)) +
  geom_point() +
  geom_smooth(aes(group = dose), se = FALSE) +
  facet_wrap(~variable, scales = 'free_y') +
  geom_vline(aes_string(xintercept = 0), col = "red") +
  scale_y_log10() +
  theme_bw() +
  ylab('Abundance + 1') +
  xlab('Week')
```

![plot of chunk pyrifos_raw_plot](figure/pyrifos_raw_plot-1.png) 

From this plot we see that after application (red vertical line) the abundance of 
*Caenis horaria*, *Cloeon dipterum* and *Chaoborus obscuripes* decreases for the highest doses,
but recovers to the end of experiment.
Whereas, *Gamarus pulex* does not recover. 
*Bithynia tentaculata* and Oligochaeta seem the profit from treatment.
Moreover, there are species in very low abundances where we cannot make any inferences (like *Libellulidae*).
