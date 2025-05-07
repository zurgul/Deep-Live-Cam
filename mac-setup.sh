#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "!!! This script will only work on MacOS Apple Silicon !!!"
echo 
echo "Installing Python 3.10, ffmpeg, git..."
brew install python@3.10 python-tk@3.10 ffmpeg git

echo "Creating Python virtual environment..."
python3.10 -m venv venv
source venv/bin/activate

echo "Installing Python dependencies..."
pip3.10 install --upgrade pip
pip3.10 install -r requirements.txt

echo "Creating models folder and downloading model files..."
mkdir -p models
cd models

# GFPGAN model
wget https://huggingface.co/hacksider/deep-live-cam/resolve/main/inswapper_128_fp16.onnx?download=true
# Face swap model
wget https://github.com/TencentARC/GFPGAN/releases/download/v1.3.4/GFPGANv1.4.pth

cd ..

echo "...READY TO RUN"

# pip3.10 install torch torchvision torchaudio
# pip3.10 install onnxruntime-silicon
# pip3.10 install tensorflow tensorflow-metal
# pip3.10 install customtkinter
# pip3.10 install opencv-python
# pip3.10 install cv2_enumerate_cameras
# pip3.10 install insightface


# ---- Step 7: Run the app using CoreML (Apple Silicon optimized) ----
echo "Starting Deep-Live-Cam with CoreML backend..."
python3.10 run.py --execution-provider coreml
