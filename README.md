# run-solo-demo
This repository consists of some bash scripts and checkpoints of different train experiments

I use [AdelaiDet](https://github.com/aim-uofa/AdelaiDet) repo and its user gide for running [SOLOv2](https://github.com/aim-uofa/AdelaiDet/blob/master/configs/SOLOv2/README.md)

## Quick Start

If you dont install cuda yet please see [how to install cuda-11-1 on ubuntu 20.04](https://gist.github.com/msinamsina/8bdefa052cce5bb76f17150dcd14494a)

for run solo on an image run:
```
git clone https://github.com/msinamsina/run-solo-demo.git
cd run-solo-demo
sh demo.sh
```
for train solo on COCO dataset run:
```
git clone https://github.com/msinamsina/run-solo-demo.git
cd run-solo-demo
sh train.sh
```

## details: 
for setup your envirenment run: 
```
python -m pip install detectron2 -f  https://dl.fbaipublicfiles.com/detectron2/wheels/cu111/torch1.8/index.html
python -m pip install torch==1.8.2 torchvision==0.9.2 torchaudio==0.8.2 --extra-index-url https://download.pytorch.org/whl/lts/1.8/cu111
git clone https://github.com/msinamsina/AdelaiDet-M.git
cd AdelaiDet-M
python setup.py build develop
pip install imantics

```

## Run on an image
At first download initial weghits useing folowing table


|  Model            | weight                                                                       |  log-dir      |   Discribtion  |  APr |
|:-----------------:|:-----------------------------------------------------------------------------|:-------------:|:---------------|------|
|   SOLOv2_R50_3x   | [download](https://cloudstor.aarnet.edu.au/plus/s/chF3VKQT4RDoEqC/download)  |  -            | Orginal        | 37.6 |
| CIHP_R50_3x       | [downlaod](https://drive.google.com/file/d/1H51aSHVyBf7jqdKK4JafN6HpFiFhyMbZ/view?usp=sharing)|[Open](https://drive.google.com/drive/folders/1A79XvOtMmnCg90CF0dG70KB4Cg0GtYFF?usp=sharing)| train SOLOv2 on CIHP dataset [link](https://github.com/msinamsina/run-solo-demo/blob/main/results/SOLOv2-CIHP.md)|33.469|
|  SOLOv2_R50_3x   | [downlaod](https://drive.google.com/file/d/1OcSzGdW6srstKFoO5d_JWO4F_NBT10bd/view?usp=sharing) | [Open](https://drive.google.com/drive/folders/1eyOdE4Zl8iX0oQj3jEZ4hG5zOmFqj6aE?usp=sharing)| solov2 trained on COCO with BATCH-SIZE 4 | 31.463|
|CIHP_R50_3x       | [downlaod](https://drive.google.com/file/d/1s3jT4mfFIPx_zMmrYjlnXOgZrdeDhJx_/view?usp=sharing)   | [Open](https://drive.google.com/drive/folders/1vP7EB92d1BtHUiVH47LmL5L5eJ59QEvk?usp=sharing) | version2 of implimentation of CIHP dataset in detectron2 framework |   33.2157 |


and run:
```
#download arbitrary image
wget https://tryolabs.com/assets/blog/2018-03-01-introduction-to-visual-question-answering/visual-question-answering-aa6ecaa14a.jpg -O input1.jpg;

```
```
python demo/demo.py --config-file /PATH/TO/CONFIG-FILE \
          --input input1.jpg --output output1.jpg \
          --opts MODEL.WEIGHTS /PATH/TO/WEGHIT
```

## Train on COCO

### download dataset

```
wget -c http://images.cocodataset.org/zips/train2017.zip
wget -c http://images.cocodataset.org/zips/val2017.zip
wget -c http://images.cocodataset.org/annotations/annotations_trainval2017.zip

mkdir datasets
mkdir datasets/coco

unzip train2017.zip -d datasets/coco/
unzip val2017.zip -d datasets/coco/
unzip annotations_trainval2017.zip -d datasets/coco/

```

for train run 

```
OMP_NUM_THREADS=1 python tools/train_net.py \
          --config-file configs/SOLOv2/R50_3x.yaml \
          --num-gpus 1 \
          --resume \
          OUTPUT_DIR training_dir/SOLOv2_R50_3x
```

## Train on CIHP

### download dataset

```
gdown 1HdqA8yWVxZ8od0hngKzZTziHx_ONzCWj
tar -xvf  instance-level_human_parsing.tar.gz
mv instance-level_human_parsing datasets/CIHP

```
for train run 
```
OMP_NUM_THREADS=1 python tools/train_net.py \
          --config-file configs/SOLOv2/CIHP_R50_3x.yaml \
          --num-gpus 1 \
          --resume \
          OUTPUT_DIR training_dir/SOLOv2_CIHP_R50_3x

```
if you want to change defult directory of datasets use this commmand:

```
export DETECTION2_DATASETS=/path/to/datasets
```
## evaluate
```
OMP_NUM_THREADS=1 python tools/train_net.py \
    --config-file configs/SOLOv2/R50_3x.yaml \
    --eval-only \
    --num-gpus 1 \
    OUTPUT_DIR training_dir/SOLOv2_R50_3x \
    MODEL.WEIGHTS training_dir/SOLOv2_R50_3x/model_final.pth
```


# ToDo:
- [x] Add CIHP to AdelaiDet 
- [x] Train Solo-v2 On CIHP
- [ ] Create Only Human Instance Dataset
- [ ] Train only Human Instances
- [ ] Create New repo for your frame work or use msadet
- [ ] Visualization of model output
- [x] Setup Upboard
- [ ] Setup tensorboard
