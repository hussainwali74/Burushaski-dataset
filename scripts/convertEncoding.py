# created 12:19pm 15/02/2022
# to fix, ascii file with no line terminator warning
import os
import sys

# get the directory of your script
directory = os.path.dirname(os.path.realpath(sys.argv[0]))
for subdir, dirs, files in os.walk(directory):
    for filename in files:
        # get the path to your subdirectory
        subdirectory_path = os.path.relpath(subdir, directory)

        # get the path to you file
        file_path = os.path.join(subdir, filename)
        if(subdirectory_path and '.txt' in file_path):
            # f = open(file_path,'a+')
            text_file = open(file_path, "a+")
            file_content = text_file.read()
            text_file.write("%s\n" % file_content)
            text_file.close()
