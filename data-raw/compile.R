ges <- readr::read_csv("data-raw/ges-technical-framework.csv")
gsr <- readr::read_csv("data-raw/gsr-technical-framework.csv")
gors <- readr::read_csv("data-raw/gors-technical-framework.csv")


ges <- ges |>
  dplyr::left_join(
    ges |> dplyr::distinct(level) |>
      dplyr::mutate(grade = c("EO", "HEO", "SEO", "Grade 7", "Grade 6", "Grade 5")),
    by = "level") |>
  dplyr::mutate(row = 1:dplyr::n()) |>
  dplyr::select(row, profession, heading, `sub-heading`, level, grade, content)


gsr <- gsr |>
  dplyr::select(row, profession, heading, `sub-heading`, level, grade, content)

gors <- gors |>
  dplyr::select(row, profession, heading, level, grade, content)

framework <- dplyr::bind_rows(ges, gsr, gors)
write.csv(framework, "data/analytical-professions-competency-data.csv", row.names = FALSE)
