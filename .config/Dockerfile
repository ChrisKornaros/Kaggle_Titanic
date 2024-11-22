FROM python:slim

# Set the local directory as an environment variable
ARG CURRENT_DIR

# Set working directory to /home
WORKDIR /home

# Create the subdirectories
RUN mkdir /home/files
RUN mkdir /home/model

# Copy requirements.txt from .config in the local directory
COPY .config/requirements.txt /home/files

# Copy model folder from local to /home/model
COPY /files /home/files
COPY /model /home/model

# Install dependencies
#RUN pip install -r /home/files/requirements.txt
RUN pip install pandas
RUN pip install duckdb
RUN pip install jupyterlab
RUN pip install scikit-learn

# Install Jupyter kernel
RUN python -m ipykernel install --user --name=$CURRENT_DIR

# Generate Jupyter config file
RUN jupyter server --generate-config

# Modify Jupyter config file to disable the token
RUN echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py

# Mount current directory to /home
VOLUME $(pwd):/home

# Expose the container so my local environment can use the kernel
# Don't forget to include the -p 8888:8888 flag in the docker run command to map the local port to the image's
# Not doing so (even in the EC2 server) prevents the local VS Code IDE from connecting to AWS
EXPOSE 8888

# Set default command to start a bash shell
CMD ["jupyter", "server", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.disable_check_xsrf=True"]
