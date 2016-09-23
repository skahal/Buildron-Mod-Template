if [ "$1" == "mac" ]
then
  MODS_FOLDER="Buildron.app/Mods/"
  ZIP_FOLDER="../../../"
else
  MODS_FOLDER="Mods/"
  ZIP_FOLDER="../../"
fi

echo ================[ Packing mod for $1
./build.sh $1

echo ================[ Compressing mod
pushd $PWD/../build/$1/$MODS_FOLDER >/dev/null
zip -vrq $ZIP_FOLDER/JumpStartTemplate.$1.zip JumpStartTemplate -x "*.DS_Store" -x "*__instances__*" -x "*.pdb" -x "*.mdb"
popd >/dev/null

echo ================[ Mod package .zip available at build folder:
pushd ../build >/dev/null
ls *$1*.zip
popd >/dev/null

echo ================[ Mod pack done.
