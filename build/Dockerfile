FROM pandoc/latex:latest

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PATH="/data/node_modules/.bin:/usr/lib/chromium:${PATH}"
ENV MERMAID_BIN="/data/node_modules/.bin/mmdc"
ENV PUPPETEER_CFG="/data/puppeteer-config.json"
ENV SCALE=5

RUN apk update && apk upgrade && apk add --no-cache \
    bash \
    git \
    python \
    py-pip \ 
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    npm

RUN echo "{\"args\": [\"--no-sandbox\", \"--disable-setuid-sandbox\"], \"executablePath\": \"/usr/lib/chromium/chrome\"}" > puppeteer-config.json

RUN npm install mermaid @mermaid-js/mermaid-cli

RUN pip install git+https://github.com/time-machine-project/pandoc-mermaid-filter.git

COPY ./convert_to_pdf.sh /opt/script/

RUN chmod +x /opt/script/convert_to_pdf.sh

ENTRYPOINT ["/opt/script/convert_to_pdf.sh"]
