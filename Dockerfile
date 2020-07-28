FROM bioconductor/bioconductor_docker:bioc2020.1

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

ENV R_REMOTES_NO_ERRORS_FROM_WARNINGS=true

RUN Rscript -e "BiocManager::install(update = TRUE, ask = FALSE, Ncpus=2)"
RUN Rscript -e "devtools::install('.', dependencies = TRUE, repos = BiocManager::repositories(), build_vignettes = TRUE, Ncpus=2)"
