#CREATE text file, single file with name
import os
import sys
#get the directory of your script
directory = os.path.dirname(os.path.realpath(sys.argv[0]))


f = open('text', 'w+')

for subdir, dirs, files in os.walk(directory):
    for filename in files:
        ##get the path to your subdirectory
        subdirectory_path = os.path.relpath(subdir, directory)

        #get the path to you file
        file_path = os.path.join(subdir, filename)
        print(file_path)
        filename_without_ext = filename.split('.')[0]
        if(subdirectory_path and '.txt' in file_path):
            f2 = open(file_path, 'r')
            file_content = f2.read()
            #folder_file_name filecontent
            line = subdirectory_path+'_'+filename_without_ext + ' ' + file_content + '\n'
            print(line)
            f.write(line)
            f2.close()

f.close()
