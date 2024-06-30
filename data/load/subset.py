import random
import sys
import os

def select_random_lines(input_file, num_lines):
    # Read all lines from the input file.
    with open(input_file, 'r') as infile:
        lines = infile.readlines()

    # Ensure the first line (header) is always included.
    header = lines[0]
    data_lines = lines[1:]

    # Check if num_lines is greater than the total number of data lines.
    if num_lines > len(data_lines):
        raise ValueError("Number of lines to select is greater than the total number of lines in the file.")

    # Randomly select line indices from the data lines.
    selected_indices = sorted(random.sample(range(len(data_lines)), num_lines))

    # Construct the new file name.
    base, ext = os.path.splitext(input_file)
    renamed_file = base + "-full" + ext

    # Rename the original file.
    os.rename(input_file, renamed_file)

    # Write the header and selected lines to a new file with the original input file name.
    with open(input_file, 'w') as outfile:
        outfile.write(header)

        for index in selected_indices:
            outfile.write(data_lines[index])

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_file> <num_lines>")
        sys.exit(1)

    input_file = sys.argv[1]
    num_lines = int(sys.argv[2])
    select_random_lines(input_file, num_lines)
