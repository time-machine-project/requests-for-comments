FROM pandoc/latex:2.9.2.1

RUN apk update && apk upgrade && apk add --no-cache \
    bash \
    dos2unix \
    git \
    python \
    py-pip \ 
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont

COPY ./convert_to_pdf.sh /opt/script/

RUN dos2unix /opt/script/convert_to_pdf.sh

RUN chmod +x /opt/script/convert_to_pdf.sh

ENTRYPOINT ["/opt/script/convert_to_pdf.sh"]
