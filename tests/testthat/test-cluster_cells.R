context("test-cluster_cells")

cds <- load_a549()
cds <- estimate_size_factors(cds)
cds <- preprocess_cds(cds, num_dim = 20)
cds <- reduce_dimension(cds)

test_that("cluster_cells works", {
  cds <- cluster_cells(cds)
  expect_equal(sum(colData(cds)$Cluster == 10), 55)
  expect_equal(sum(colData(cds)$Cluster == 1), 33)
  expect_equal(as.character(colData(cds)$Cluster[1]), "10")
})