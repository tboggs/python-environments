REQUIREMENTS_DIR=~/python-environments
SRC_DIR=~/src
BUILDS_DIR=${SRC_DIR}/third-party-builds

# Install custom-compiled multithreaded versions of numpy & scipy first so that
# the requirements will already be met when given in subsequent pip requirements
# files.
pip install file://${BUILDS_DIR}/numpy#egg=numpy
pip install file://${BUILDS_DIR}/scipy#egg=scipy

# Install requirements for SPy and for building the documentation
cd $REQUIREMENTS_DIR
pip install -r spectral-web-deps.txt
pip install -r spectral-deps.txt
pip install -r working.txt

# wxPython is not installable via pip so it is a pain to easily get it working
# in a virtualenv in an automated way. So I am simply linking the appropriate
# packages from the system python2.7 directories into the virtualenv. I know
# this is a bad thing to do but I'll accept the risk for the sake of being
# able to easily, automatically build this environment, as needed. 
ln -s /usr/lib/python2.7/dist-packages/wx* \
      ${VIRTUAL_ENV}/lib/python2.7/site-packages/

# Install SPy in editable mode from the local git repository
pip install -e ${SRC_DIR}/spectral

