FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

ENV R_REMOTES_NO_ERRORS_FROM_WARNINGS=true

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install('waldronlab/enrichOmics', update = TRUE, ask = FALSE); BiocManager::install("remotes"); BiocManager::install("lgeistlinger/EnrichmentBrowser")"
