FROM jupyter/tensorflow-notebook
ENV NODE_OPTIONS="--max-old-space-size=4096"

FROM timsu27/general-jupyterlab:1.0.1-python3.8

# Install Tensorflow
RUN pip install --quiet --no-cache-dir \
    'tensorflow==2.4.1' && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/maker"
