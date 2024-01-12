import os

folder_path = 'assets/pics/Cities'
manifest_file = 'assets/pics/Cities/cities_manifest.txt'

with open(manifest_file, 'w') as file:
    for filename in os.listdir(folder_path):
        if filename.endswith('.jpg'):
            file.write(filename + '\n')