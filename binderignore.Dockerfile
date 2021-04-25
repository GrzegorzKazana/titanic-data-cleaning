FROM python:3.8-buster

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# running jupyter as root is a bad idea
# creating non-root user here
RUN groupadd --gid 5000 nruser \
    && useradd --home-dir /home/nruser --create-home --uid 5000 \
    --gid 5000 --shell /bin/sh --skel /dev/null nruser

USER nruser

COPY . .

CMD ["jupyter", "lab", "--ip='*'", "--port=8888", "--no-browser"]
