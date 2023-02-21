FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
CMD [ "./tenkspoons" ]

ENV OS_CLOUD=podified_ironic
ENV PROMETHEUS_DISABLE_CREATED_SERIES=True
COPY ./clouds_podified_ironic.yaml /etc/openstack/clouds.yaml
