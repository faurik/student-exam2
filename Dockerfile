FROM python:3.8-alpine3.11

ENV FLASK_APP=js_example

COPY ./ /opt/app

WORKDIR /opt/app

RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install -e . && \
    echo '#!/bin/sh' > run.sh && \
    echo 'source venv/bin/activate' >> run.sh && \
    echo 'flask run' >> run.sh && \
    chmod 755 run.sh

EXPOSE 5000

ENTRYPOINT ["./run.sh"]