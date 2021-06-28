FROM timsu27/general-jupyterlab:1.0.4-python3.8

ENV NODE_OPTIONS="--max-old-space-size=4096" \
    TENSORFLOW_VERSION="2.4.1"
USER root
# Install Tensorflow
RUN pip install --quiet --no-cache-dir "tensorflow==$TENSORFLOW_VERSION" && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
USER ${NB_USER}
