import shutil, random, os

dirpath = 'datasets/celeba/'

subsets = [500, 1000, 2000, 4000]

for subset in subsets:
    destDirectory = f'datasets/{subset}-celeba/'

    filenames = random.sample(os.listdir(dirpath), subset)
    for fname in filenames:
        srcpath = os.path.join(dirpath, fname)
        shutil.copy(srcpath, destDirectory)

