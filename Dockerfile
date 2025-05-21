# Use PyTorch base image with CUDA 11.8 and cuDNN
FROM pytorch/pytorch:2.1.0-cuda11.8-cudnn8-runtime

# Set working directory inside the container
WORKDIR /app

# Copy your project files (adjust path if needed)
# COPY . /app

# Install essential system packages
RUN apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Install Python dependencies
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 \
    && pip install transformers scikit-learn tqdm jsonlines

# Optional: install other NLP libs if needed
# RUN pip install datasets spacy

# Default command
CMD ["bash"]
