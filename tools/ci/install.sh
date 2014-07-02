# TODO: Is this better than 'pip install conda; conda create -p ... anaconda=2.0.0'?
sudo apt-get install -qq -y g++ gfortran csh
sudo apt-get install -qq -y g++-multilib gcc-multilib
wget http://repo.continuum.io/miniconda/Miniconda-3.0.5-Linux-x86_64.sh
bash Miniconda-3.0.5-Linux-x86_64.sh -b
PIP_ARGS="-U"

export PATH=$HOME/miniconda/bin:$PATH

conda update --yes conda
conda config --add channels http://conda.binstar.org/omnia
conda config --add channels http://conda.binstar.org/choderalab
conda create --yes -n ${python} python=${python} --file tools/ci/requirements-conda.txt
source activate $python

# Need to install nose-exclude
pip install nose-exclude
