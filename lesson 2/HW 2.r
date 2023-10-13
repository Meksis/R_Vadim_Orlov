vector_str <- c("apple", "banana", "cherry", "date")
vector_int <- 5:25

cat(vector_str, "\n")
cat(length(vector_int), "\n")
cat(vector_int[1], "\n")
cat(vector_int[2:4], "\n")

vector_a <- 1:3
vector_b <- rep(4, times = 3)
cat(vector_a + vector_b, "\n")

mean_value <- mean(vector_int)
cat(mean_value, "\n")

divide_by_two <- function(X) {
  return(X / 2)
}

result <- divide_by_two(vector_int)
cat(result, "\n")

matrix_a <- matrix(1:9, nrow = 3, byrow = TRUE)
matrix_b <- matrix(9:1, nrow = 3, byrow = TRUE)

cat(matrix_a, "\n")
cat(matrix_b, "\n")
cat(matrix_a[, 1], "\n")
cat(matrix_b[, 1], "\n")
cat(matrix_a[2, ], "\n")
cat(matrix_b[2, ], "\n")
cat(matrix_a[1, 3], "\n")
cat(matrix_b[1, 3], "\n")
cat(matrix_a[3, 1], "\n")
cat(matrix_b[3, 1], "\n")
cat(matrix_a[1, 9], "\n")
cat(matrix_b[1, 9], "\n")


data <- read.csv("R_HW_2_dataset.csv")

head(data)

str(data)
summary(data)
