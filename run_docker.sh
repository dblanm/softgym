SOFTGYM_PATH=${PWD}
ANACONDA_PATH=$HOME/anaconda3/
PYFLEXROOT=/workspace/softgym/PyFlex
PYTHONPATH=${PYFLEXROOT}/bindings/build:$PYTHONPATH
LD_LIBRARY_PATH=${PYFLEXROOT}/external/SDL2-2.0.4/lib/x64:$LD_LIBRARY_PATH
PATH=${ANACONDA_PATH}/bin:${ANACONDA_PATH}/envs/ddm/bin/:$PATH
docker run -v ${SOFTGYM_PATH}:/workspace/softgym \
 -v $HOME/anaconda3/:$HOME/anaconda3/\
 -w /workspace/softgym \
 --gpus 0 -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
 -e QT_X11_NO_MITSHM=1 \
 -e PYFLEXROOT=$PYFLEXROOT \
 -e PYTHONPATH=$PYTHONPATH \
 -e LD_LIBRARY_PATH=$LD_LIBRARY_PATH \
 -e PATH=$PATH \
 -it flingbot:latest bash
