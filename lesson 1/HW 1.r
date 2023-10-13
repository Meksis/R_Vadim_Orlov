var_int <- 5
var_float <- 2.22
var_str <- "Hello world"

cat(format(var_int / var_float, nsmall = 2), "\n")

cat(var_int > var_float, "\n")

cat(paste(var_str, var_str, var_str, sep = "|"), "\n")

for (year in 2021:2030) {
  if (year >= 2021 && year <= 2023) {
    cat(paste("Маркетинговый проект запустился в", year, "году"), "\n")
  } else {
    cat(paste("Маркетинговый проект будет запущен в", year, "году"), "\n")
  }
}
