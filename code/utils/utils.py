import os
import json
import kagglehub
from kagglehub import KaggleDatasetAdapter
from pandas import DataFrame

def get_kaggle_credentials_from_json():
    home_dir = os.getenv("HOME")
    kaggle_dir = os.path.join(home_dir, ".config", "kaggle")
    kaggle_file = os.path.join(kaggle_dir, "kaggle.json")

    if not os.path.exists(kaggle_dir):
        kaggle_dir = os.path.join(home_dir, ".kaggle")

    if not os.path.exists(kaggle_dir):
        raise Exception("Kaggle credentials not found")
    
    with open(kaggle_file, "r") as f:
        credentials = json.load(f)

    print(f"Using kaggle credentials: {credentials['username']}")

    return credentials

def import_dataset_from_kaggle(name: str, file_path: str="datasets") -> DataFrame:
    """
    Imports a dataset from kaggle and returns it as a pandas dataframe

    Parameters
    ----------
    name : str
        The name of the dataset to import
    file_path : str
        The path to the dataset on kaggle

    Returns
    -------
    DataFrame
    """

    df = kagglehub.load_dataset(
        adapter=KaggleDatasetAdapter.PANDAS,
        handle=name,
        path=file_path
    )

    return df
