set -e

project_dir=$(dirname $(dirname $(readlink -f $BASH_SOURCE)))
venv_path=$project_dir/.venv

# Function that starts the jupyter kernel on port 8888
start_jupyter_kernel() {
    if [ -d $venv_path ]; then
        . $venv_path/bin/activate && jupyter notebook --port=8888
    fi
}

start_jupyter_kernel