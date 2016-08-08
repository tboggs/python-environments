REQUIREMENTS_DIR=~/python-environments
SRC_DIR=~/src
BUILDS_DIR=${SRC_DIR}/third-party-builds

pip install Cython

# Install custom-compiled multithreaded versions of numpyfirst so requirements
# will already be met when given in subsequent pip requirements files.
pip install file://${BUILDS_DIR}/python2/numpy#egg=numpy
pip install scipy

# Make sure that the necessary GDAL system binaries & headers are present:
#   $ sudo apt-get install libgdal1h libgdal1-dev libgdal20 libgdal-dev
export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal
pip install gdal

# wxPython is not installable via pip so it is a pain to easily get it working
# in a virtualenv in an automated way. So I am simply linking the appropriate
# packages from the system python2.7 directories into the virtualenv. I know
# this is a bad thing to do but I'll accept the risk for the sake of being
# able to easily, automatically build this environment, as needed. 
ln -s /usr/lib/python2.7/dist-packages/wx* \
      ${VIRTUAL_ENV}/lib/python2.7/site-packages/

# Link Qt5 to the system-level package
ln -s /usr/lib/python2.7/dist-packages/sip* \
      ${VIRTUAL_ENV}/lib/python2.7/site-packages/
ln -s /usr/lib/python2.7/dist-packages/PyQt4 \
      ${VIRTUAL_ENV}/lib/python2.7/site-packages/

# Install matplotlib after linking qt & wx so backends can be discovered
pip install -I matplotlib

# Install requirements for SPy and for building the documentation
cd $REQUIREMENTS_DIR
pip install -r spectral-web-deps.txt
pip install -r spectral-deps.txt
pip install -r working.txt
pip install -r dissertation.txt

# Install SPy in editable mode from the local git repository
pip install -e ${SRC_DIR}/spectral

python -c "import numpy, matplotlib, scipy, gdal, h5py, sklearn, pywt, sklearn, spectral"
python -c "import wx, PyQt4"
