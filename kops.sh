#! /bin/bash
aws configure
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.33.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kops
echo "export PATH=$PATH:/usr/local/bin/" >> source .bashrc

# 1. State store (keep yours)
export KOPS_STATE_STORE=s3://h2h-1682-kopsstatestore.k8s.local

# 2. Create cluster (DO NOT set AMI manually)
kops create cluster \
  --name atul.k8s.local \
  --zones us-east-1a \
  --control-plane-count 1 \
  --node-count 2 \
  --node-size t3.large \
  --control-plane-size t3.large \
  --networking cilium

# 3.kops update cluster --name atul.k8s.local --yes

# 4.kops export kubecfg --name atul.k8s.local --admin

--------------------------------by Trainer--------------------------------------

export KOPS_STATE_STORE=s3://h2h-1682-kopsstatestore.k8s.local
kops create cluster --name atul.k8s.local --zones us-east-1a --control-plane-image ami-091138d0f0d41ff90  --control-plane-count=1 --control-plane-size t3.large --image ami-091138d0f0d41ff90  --node-count=2 --node-size t3.large
kops update cluster --name atul.k8s.local --yes --admin


