sudo apt install snapd git
sudo apt update -y && sudo apt upgrade -y
echo "install IDE's ...."
sudo snap install code --classic
sudo snap install pycharm-community --classic
echo " installing miniconda ...."
wget "https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh"
bash *.sh


cat extensions.txt | while read extension || [[ -n $extension ]];
do
    code --install-extension $extension --force --no-sandbox --user-data-dir ~/
done

#code --install-extension ms-python.python ms-toolsai.jupyter ms-python.vscode-pylance
echo "creating a mini conda env....."
conda create -n test_gpu python=3.9 tensorflow-gpu
conda activate test_gpu
#conda install pytorch torchvision torchaudio pytorch-cuda=11.6 -c pytorch -c nvidia

echo "docker installation...."