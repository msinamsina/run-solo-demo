# run-solo-demo
This repository consists of some bash scripts and checkpoints of different train experiments

I use [AdelaiDet](https://github.com/aim-uofa/AdelaiDet) repo and its user gide for running [SOLOv2](https://github.com/aim-uofa/AdelaiDet/blob/master/configs/SOLOv2/README.md)

## Quick Start

for run solo on an image run:
```
git clone https://github.com/msinamsina/run-solo-demo.git
cd run-solo-demo
sh demo.sh
```

## details: 
for setup your envirenment run: 
```
python -m pip install detectron2 -f  https://dl.fbaipublicfiles.com/detectron2/wheels/cu111/torch1.8/index.html
python -m pip install torch==1.8.2 torchvision==0.9.2 torchaudio==0.8.2 --extra-index-url https://download.pytorch.org/whl/lts/1.8/cu111
git clone https://github.com/aim-uofa/AdelaiDet.git
cd AdelaiDet
python setup.py build develop
```

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
<td align="left"><details><summary> Run </summary><pre><code>wget https://tryolabs.com/assets/blog/2018-03-01-introduction-to-visual-question-answering/visual-question-answering-aa6ecaa14a.jpg -O input1.jpg \
python demo/demo.py --config-file configs/SOLOv2/R50_3x.yaml \
--input input1.jpg --output output1.jpg \
--opts MODEL.WEIGHTS SOLOv2_R50_3x.pth</code></pre> </details> 
</tr>   </tbody></table>
