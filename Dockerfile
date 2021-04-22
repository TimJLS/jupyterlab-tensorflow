FROM jupyter/datascience-notebook
ENV NODE_OPTIONS="--max-old-space-size=4096"
RUN pip install --upgrade jupyterlab-git
RUN jupyter labextension install nbdime-jupyterlab --no-build && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build && \
    jupyter labextension install @jupyterlab/git --no-build && \
    jupyter lab build && \
        jupyter lab clean && \
        jlpm cache clean && \
        npm cache clean --force && \
        rm -rf $HOME/.node-gyp && \
        rm -rf $HOME/.local && \
    fix-permissions $CONDA_DIR $HOME
RUN jupyter server extension list
