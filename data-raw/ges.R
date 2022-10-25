# Create a file with
# profession, index, heading, level, content.


aok <- readr::read_csv("data-raw/application-of-knowledge.csv") |>
  dplyr::rename(`sub-heading` = heading) |>
  dplyr::mutate(heading = "Application of Knowledge")
  
aod <- readr::read_csv("data-raw/analysis-of-data.csv") |>
  dplyr::rename(`sub-heading` = heading) |>
  dplyr::mutate(heading = "Analysis of Data")


ec <- readr::read_csv("data-raw/effective-communication.csv") |>
  dplyr::rename(`sub-heading` = heading) |>
  dplyr::mutate(heading = "Effective Communication")

ges <- aok |>
dplyr::bind_rows(aod) |>
  dplyr::bind_rows(ec) |>
  dplyr::mutate(profession = "Government Economic Service") |>
  dplyr::select(profession, index, heading, `sub-heading`, level, content)


write.csv(ges, "data-raw/ges-technical-framework.csv", row.names = FALSE)
