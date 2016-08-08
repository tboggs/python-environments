REQUIREMENTS_DIR=~/python-environments
SRC_DIR=~/src
BUILDS_DIR=${SRC_DIR}/third-party-builds

pip install Cython

# Install custom-compiled multithreaded versions of numpyfirst so requirements
# will already be met when given in subsequent pip requirements files.
pip install file://${BUILDS_DIR}/python3/numpy#egg=numpy
pip install scipy

# Make sure that the necessary GDAL system binaries & headers are present:
#   $ sudo apt-get install libgdal1h libgdal1-dev libgdal20 libgdal-dev
export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal
pip install gdal

# Link Qt5 to the system-level package
ln -s /usr/lib/python3/dist-packages/sip* \
      ${VIRTUAL_ENV}/lib/python3.4/site-packages/
ln -s /usr/lib/python3/dist-packages/PyQt5 \
      ${VIRTUAL_ENV}/lib/python3.4/site-packages/

# Install matplotlib after linking qt so backends can be discovered
pip install -I matplotlib


# Install requirements for SPy and for building the documentation
cd $REQUIREMENTS_DIR
pip install -r spectral-web-deps.txt
pip install -r spectral-deps.txt
pip install -r working.txt
pip install -r dissertation.txt

# Install SPy in editable mode from the local git repository
pip install -e ${SRC_DIR}/spectral

python3 -c "import numpy, matplotlib, scipy, gdal, h5py, sklearn, pywt, sklearn, spectral"
python3 -c "import PyQt5"
