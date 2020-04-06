FROM pandoc/latex:latest

RUN apk update && apk upgrade && apk add bash

COPY ./convert_to_pdf.sh /opt/script/

RUN chmod +x /opt/script/convert_to_pdf.sh

ENTRYPOINT ["/opt/script/convert_to_pdf.sh"]
