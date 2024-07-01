import os
import sys

import pandas as pd
from sklearn.model_selection import StratifiedShuffleSplit


def select_random_lines(input_file, num_lines):
    # Load the data into a pandas DataFrame
    df = pd.read_csv(input_file)

    # Check if num_lines is greater than the total number of data lines.
    if num_lines > len(df):
        raise ValueError(
            "Number of lines to select is greater than the total number of lines in the file."
        )

    # Use StratifiedShuffleSplit to maintain the distribution of "ANO_DIAGN"
    split = StratifiedShuffleSplit(n_splits=1, test_size=num_lines, random_state=42)
    for _, test_index in split.split(df, df["ANO_DIAGN"]):
        strat_test_set = df.loc[test_index]

    # Construct the new file name.
    base, ext = os.path.splitext(input_file)
    renamed_file = base + "-full" + ext

    # Rename the original file.
    os.rename(input_file, renamed_file)

    # Write the stratified subset to a new file with the original input file name.
    strat_test_set.to_csv(input_file, index=False)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_file> <num_lines>")
        sys.exit(1)

    input_file = sys.argv[1]
    num_lines = int(sys.argv[2])
    select_random_lines(input_file, num_lines)
