python -m pip install detectron2 -f  https://dl.fbaipublicfiles.com/detectron2/wheels/cu111/torch1.8/index.html
python -m pip install torch==1.8.2 torchvision==0.9.2 torchaudio==0.8.2 --extra-index-url https://download.pytorch.org/whl/lts/1.8/cu111
git clone https://github.com/msinamsina/AdelaiDet.git
cd AdelaiDet
python setup.py build develop

wget http://images.cocodataset.org/zips/train2017.zip
wget http://images.cocodataset.org/zips/val2017.zip
wget http://images.cocodataset.org/annotations/annotations_trainval2017.zip

mkdir datasets
mkdir datasets/coco

unzip train2017.zip -d datasets/coco/
unzip val2017.zip -d datasets/coco/
unzip annotations_trainval2017.zip -d datasets/coco/




OMP_NUM_THREADS=1 python tools/train_net.py --config-file configs/SOLOv2/R50_3x.yaml --num-gpus 1   OUTPUT_DIR training_dir/SOLOv2_R50_3x
