#!/bin/bash

kaggle_dir=$HOME/.config/kaggle
kaggle_dir_depecrated=$HOME/.kaggle

check_jq_installation() {
    apt_list_result=$(apt list jq)
    
    if [[ "${apt_list_result}" =~ "installed" ]]; then
        echo "jq is already installed."
    else
        echo "jq is not installed. Installing..."
        sleep 1
        sudo apt install jq
    fi
}

select_kaggle_dir() {
    if [ -d $kaggle_dir ]; then
        echo "Using kaggle dir: $kaggle_dir"
    else
        echo "Using kaggle dir: $kaggle_dir_depecrated"
        kaggle_dir=$kaggle_dir_depecrated
    fi
}

set_kaggle_credentials_from_json() {
    username=$(jq -r '.username' $kaggle_dir/kaggle.json)
    key=$(jq -r '.key' $kaggle_dir/kaggle.json)

    echo "Using kaggle credentials: $username"

    export KAGGLE_USERNAME=$username
    export KAGGLE_KEY=$key
}

check_jq_installation
select_kaggle_dir
set_kaggle_credentials_from_json