# Create a file with
# profession, index, heading, level, content.


ges <- readr::read_csv("data-raw/application-of-knowledge.csv") |>
  dplyr::bind_rows(readr::read_csv("data-raw/analysis-of-data.csv")) |>
  dplyr::bind_rows(readr::read_csv("data-raw/effective-communication.csv")) |>
  dplyr::mutate(profession = "Government Economic Service") |>
  dplyr::relocate(profession)

gors <- readr::read_csv("data-raw/gors-technical-framework.csv")
gors
ges
write.csv(ges, "data/analytical-professions-competency-data.csv", row.names = FALSE)
