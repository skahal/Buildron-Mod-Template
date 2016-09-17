if [ "$1" == "linux" ]
then
  BUILD_TARGET="StandaloneLinux"
elif [ "$1" == "mac" ]
then
  BUILD_TARGET="StandaloneOSXIntel"
elif [ "$1" == "win" ]
then
  BUILD_TARGET="StandaloneWindows"
else
  echo "ERROR: invalid platform. Valid are: linux, mac or win."
  exit
fi

echo ================[ Building JumpStartTemplate for $1
echo ================[ Compiling JumpStartTemplate C# class library...
xbuild ../src/Code/JumpStartTemplate.sln /verbosity:quiet /t:rebuild /p:Configuration=$1 >/dev/null

echo ================[ Starting JumpStartTemplate asset building...
/Applications/Unity/Unity.app/Contents/MacOS/Unity -projectPath $PWD/../src/Unity/JumpStartTemplate -quit -batchmode -executeMethod ModBuilder.BuildFromCommandLine $PWD/../build $BUILD_TARGET

#echo 'Logs from build'
#cat ~/Library/Logs/Unity/Editor.log

echo ================[  Build JumpStartTemplate done.
