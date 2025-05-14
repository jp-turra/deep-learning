set -e

project_dir=$(dirname $(dirname $(readlink -f $BASH_SOURCE)))
venv_path=$project_dir/.venv

# Function that starts the jupyter kernel on port 8888
start_jupyter_kernel() {
    if [ -d $venv_path ]; then
        . $venv_path/bin/activate && jupyter notebook --port=8888
    fi
}

# Function to setup kaggle credentials
setup_kaggle_credentials() {
    . $project_dir/tools/setup_kaggle_keys_from_json.sh
}

setup_kaggle_credentials
start_jupyter_kernel