rm -r 0
cp -r 0.orig 0

blockMesh
surfaceFeatures

decomposePar
mpirun -np 4 snappyHexMesh -parallel -overwrite | tee log.shm
#reconstructParMesh -mergeTol 1e-06 -constant
reconstructParMesh -constant


createBaffles -overwrite
splitBaffles -overwrite
createPatch



renumberMesh -overwrite
setFields



