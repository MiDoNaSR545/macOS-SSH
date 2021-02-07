brew uninstall -f --cask adoptopenjdk11 adoptopenjdk8 chromedriver firefox google-chrome julia microsoft-auto-update microsoft-edge session-manager-plugin
brew uninstall -f --formula aliyun-cli ant aspell aws-sam-cli azure-cli bazelisk carthage composer fontconfig freetds freetype gcc@8 gd geckodriver gh gradle helm hub jpeg libpq libtiff llvm maven mongodb-community mongodb-database-tools node@14 openjdk php pipx postgresql python@3.8 rustup-init selenium-server-standalone subversion tidy-html5 unixodbc webp
brew cleanup -s && rm -rf $(brew --cache)
sudo hdiutil create -type SPARSE -fs 'Case-sensitive Journaled HFS+' -size 220g ~/android.dmg.sparseimage
sudo hdiutil attach ~/android.dmg.sparseimage -mountpoint /Volumes/android
rm -f /Applications/Xcode.app 2>/dev/null
sudo xcode-select -s /Applications/Xcode_12.3.app/Contents/Developer
ln -s /Applications/Xcode_12.3.app /Applications/Xcode.app
cd /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs
for i in 10 11 12 13 14 15; do
  printf "Fetching MacOSX10.%s SDK...\n" "$i"
  aria2c -x16 -s16 --console-log-level=warn --summary-interval=0 --check-certificate=false https://github.com/phracker/MacOSX-SDKs/releases/download/10.15/MacOSX10.$i.sdk.tar.xz
  tar xJf MacOSX10.$i.sdk.tar.xz
  rm -f MacOSX10.$i.sdk.tar.xz
done
brew update &>/dev/null
brew install -f watch wget wdiff gdb autoconf coreutils binutils diffutils ed findutils gawk gnu-indent gnu-sed gnu-tar gnu-which grep gzip screen bash emacs gpatch less m4 make nano bison flex libressl file-formula git openssh perl python rsync unzip vim
curl -sL https://github.com/fabiomaia/linuxify/raw/master/.linuxify > ~/.linuxify
echo ". ~/.linuxify" >> ~/.bashrc && echo ". ~/.linuxify" >> ~/.zshrc
brew cleanup -s && rm -rf $(brew --cache)
brew install openjdk@8
sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export JAVA_OPTS=" -Xmx12G "
cd /Volumes/android
mkdir -p ~/bin 2>/dev/null
export PATH="~/bin:/usr/local/bin:$PATH"
curl -sL https://gerrit.googlesource.com/git-repo/+/refs/heads/stable/repo?format=TEXT | base64 --decode > ~/bin/repo
chmod a+x ~/bin/repo
