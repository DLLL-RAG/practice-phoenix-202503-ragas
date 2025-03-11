FROM jupyter/datascience-notebook:ubuntu-20.04

USER root

# =========

# RUN conda install -c conda-forge nodejs
# RUN conda install -c conda-forge jupyterlab-drawio
# RUN npm install -g ijavascript
# RUN ijsinstallc

RUN apt update
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 需要把下面的內容重整為requirements.txt
RUN pip install arize-phoenix
RUN pip install openinference-instrumentation-openai openai
RUN pip install arize-phoenix-otel

RUN pip install -q "arize-phoenix>=4.29.0"
RUN pip install -q openai nest_asyncio 'httpx<0.28'

RUN pip install duckdb datasets
RUN pip install rouge tiktoken

# =========

USER jovyan