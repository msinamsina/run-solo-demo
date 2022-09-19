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
```

## Run on an image
for download initial weghits use folowing table

<table class="docutils">
<tbody>
<th width="80"> Model </th>
<th valign="bottom" align="left" width="100">Weghits</th>
<th valign="bottom" align="left" width="100">Configs</th>
<th valign="bottom" align="left" width="100">Run</th>
<tr>
<td align="left">SOLOv2_R50_3x</td>
<td align="left"><details><summary> download </summary><pre><code>wget https://cloudstor.aarnet.edu.au/plus/s/chF3VKQT4RDoEqC/download -O SOLOv2_R50_3x.pth</code></pre> </details> </td>
<td align="left"><details><summary> show </summary><pre><code>configs/SOLOv2/R50_3x.yaml</code></pre> </details> </td> 
<td align="left"><details><summary> Run </summary><pre><code>wget https://tryolabs.com/assets/blog/2018-03-01-introduction-to-visual-question-answering/visual-question-answering-aa6ecaa14a.jpg -O input1.jpg; \
python demo/demo.py --config-file configs/SOLOv2/R50_3x.yaml \
--input input1.jpg --output output1.jpg \
--opts MODEL.WEIGHTS SOLOv2_R50_3x.pth</code></pre> </details> 
</tr>   </tbody></table>

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


# ToDo:
- [ ] Add CIHP to AdelaiDet 
- [ ] Train Solo-v2 On CIHP
- [ ] Create Only Human Instance Dataset
- [ ] Train only Human Instances
- [ ] Create New repo for your frame work or use msadet
- [ ] Visualization of model output
- [x] Setup Upboard
- [ ] Setup tensorboard
