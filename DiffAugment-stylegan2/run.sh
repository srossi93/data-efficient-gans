cp /content/drive/MyDrive/img_align_celeba.zip .
unzip img_align_celeba.zip 
mkdir datasets 
mv img_align_celeba datasets/celeba

pip3 uninstall -y tensorflow tensorflow-probability
pip3 install tensorflow-gpu==1.15.0 tensorflow-datasets==2.1.0

mkdir datasets/500-celeba
mkdir datasets/1000-celeba
mkdir datasets/2000-celeba
mkdir datasets/4000-celeba

python3 prepare_datasets.py

python3 run_low_shot.py --dataset="datasets/2000-celeba" --resolution=64 --total-kimg 15 --batch-size 128 --latent-size 64 --fmap-max 64 --fmap-base 2048 --mirror-augment False --num-repeats 4  --result-dir /content/drive/MyDrive/results

python3 run_low_shot.py --dataset="datasets/4000-celeba" --resolution=64 --total-kimg 15 --batch-size 128 --latent-size 64 --fmap-max 64 --fmap-base 2048 --mirror-augment False --num-repeats 4  --result-dir /content/drive/MyDrive/results

python3 run_low_shot.py --dataset="datasets/500-celeba" --resolution=64 --total-kimg 15 --batch-size 128 --latent-size 64 --fmap-max 64 --fmap-base 2048 --mirror-augment False --num-repeats 4  --result-dir /content/drive/MyDrive/results
