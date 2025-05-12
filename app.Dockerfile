FROM python:3.11-bookworm

RUN apt-get update && apt-get install -y curl git \
&& curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin \
&& chmod +x /usr/local/bin/just

WORKDIR /app

RUN git clone --branch hackathon --single-branch https://github.com/gideonaina/secad.git /tmp/secad/

# Install Python dependencies first before copying the rest of the code
RUN cp /tmp/secad/secad/pyproject.toml .
RUN pip install .

RUN cp -r /tmp/secad/secad/* .
RUN pip install -e .

RUN rm -rf /tmp/secad

EXPOSE 8501

ENV STREAMLIT_SERVER_HEADLESS=true
ENV STREAMLIT_SERVER_ENABLECORS=false
ENV PYTHONUNBUFFERED=1

ENTRYPOINT ["just", "start"]