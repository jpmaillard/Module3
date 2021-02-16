

rmarkdown::render("steak_article_params.rmd",
                  params = list(region = "Mountain"))

render_report <-function(regionvar){
  template <-"steak_article_params.rmd"
  outfile <-sprintf("steakArticle_%s.html",regionvar)
  parameters <-list(region = regionvar)
  rmarkdown::render(template,
                    output_file=outfile,
                    params=parameters)
  invisible(TRUE)
}

render_report("Pacific")



library(purrr)
params_list <- list(list("East North Central",
                         "East South Central", "Middle Atlantic",
                         "Mountain", "New England", "Pacific",
                         "South Atlantic", "West North Central",
                         "West South Central"))
purrr::pmap(params_list,render_report)
