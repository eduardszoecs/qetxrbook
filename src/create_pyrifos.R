require(vegan)
data(pyrifos)
abu_t <- round((exp(pyrifos) - 1)/10)

pyr <- data.frame(env, abu_t, stringsAsFactors = FALSE)
write.table(pyr, file = 'data/pyrifos.csv', sep = ';', row.names = FALSE)
