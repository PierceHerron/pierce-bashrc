# install font files
echo "Installing MesloLGS NF font files..."
sudo cp -r wsl-fonts /mnt/c/zshSetupTemp/

echo ""
echo "Four font files are about to open"
echo "Wait for all four to open, then click 'install' on each one"
echo "Once they are done installing, close all four and continue with the setup process"
read -p "Press ENTER to open the fonts"

powershell.exe Start C:\\zshSetupTemp\\MesloLGS_NF_Regular.ttf
powershell.exe Start C:\\zshSetupTemp\\MesloLGS_NF_Bold.ttf
powershell.exe Start C:\\zshSetupTemp\\MesloLGS_NF_Italic.ttf
powershell.exe Start C:\\zshSetupTemp\\MesloLGS_NF_Bold_Italic.ttf

read -p "When you are finished installing the fonts, press ENTER to continue..."

sudo rm -rf /mnt/c/zshSetupTemp

# set font for this distro
echo ""
echo "You need to activate the font for this distro in Windows Terminal"
echo "Press 'ctrl+,' to open the settings, then click on this distro in 'Profiles'"
echo "Scroll down and click on 'Appearance', then click the dropdown for 'Font face'"
echo "Select 'MesloLGS NF' from the list and click the 'Save' button to set the font"
read -p "When you have set the font, press ENTER to continue..."

# create dirs and necessary files, and pull repos
echo ""
echo "Creating ~/.zsh, ~/.zsh/plugins, ~/.zsh/themes, ~/.zsh/.zsh_history, and ~/workspace"
mkdir -vp ~/.zsh ~/.zsh/plugins ~/.zsh/themes ~/workspace
touch ~/.zsh/.zsh_history

echo ""
echo "Pulling repos for fast-syntax-highlighting, zsh-autosuggestions, zsh-completions, and powerlevel10k"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.zsh/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh/plugins/zsh-completions
git clone https://github.com/romkatv/powerlevel10k.git ~/.zsh/themes/powerlevel10k

# install dependencies
echo ""
echo "Updating Ubuntu"
sudo apt update

echo ""
echo "Installing trash-cli (use this instead of rm)"
sudo apt install trash-cli

# install zsh
echo ""
echo "Installing zsh"
sudo apt install zsh

# switch to zsh and run zshSetupCont.sh
echo ""
echo "You are about to switch to, after which you'll run './zshSetupContinued.sh' to setup zsh and the p10k theme"
echo "When you run 'zsh' for the first time, you will encounter the zsh installer"
echo "In the zsh installer, press '0' to continue with a boilerplate .zshrc (we will replace it later)"
read -p "When you're ready to setup zsh, press ENTER to continue..."
zsh
