project_dir=$(dirname $(dirname $(readlink -f $BASH_SOURCE)))
venv_path=$project_dir/.venv

check_if_python_venv_is_installed() {
    if (! command -v apt show python3-venv &> /dev/null); then
        echo "python3-venv is not installed. Installing..."
        sleep 1

        sudo apt install python3-venv
    fi
}

check_if_python_venv_is_setted() {
    if [ ! -d $venv_path ]; then
        echo "python3-venv is not setted. Setting..."
        sleep 1

        python3 -m venv $venv_path --system-site-packages
    else
        echo "python3-venv is setted. Please remove $venv_path to set it again if you want."
    fi
}

install_pip_requirements() {
    if [ -d $venv_path ]; then
        . $venv_path/bin/activate && pip install -r $project_dir/requirements.txt
    fi
}

echo "Setting up environment for project '$project_dir'"

check_if_python_venv_is_installed
check_if_python_venv_is_setted

install_pip_requirements