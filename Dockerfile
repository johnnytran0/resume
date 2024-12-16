# syntax=docker/dockerfile:1
FROM pandoc/latex:3.6

RUN addgroup -g 10001 user; adduser -u 10000 --ingroup user --shell /bin/bash --home /home/user --disabled-password user

RUN tlmgr update --self && \
  tlmgr install \
    catchfile \
    collection-fontsextra \
    lipsum \
    moderncv \
    sourcecodepro \
    sourcesanspro \
    texlive-scripts \
    xkeyval \
    xstring

USER user:user

HEALTHCHECK CMD latexmk -v || exit 1

ENTRYPOINT ["latexmk"]
