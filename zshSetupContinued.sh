# make a backup of the default .zshrc and link our own
echo ""
echo "Making a backup of the default .zshrc and using our custom one instead..."
mv -v ~/.zshrc ~/.zshrc_backup
cp zsh/.zshrc ~/.zsh
ln -s -T ~/.zsh/.zshrc ~/.zshrc

# source .zshrc and run p10k installer
echo ""
echo "We're about to source .zshrc and run the p10k installer"
echo "If you set your font correctly, you should be able to complete it without a hitch"
echo "Choose whatever options appeal to you in the installer"
echo "For the instant prompt option, I recommend the 'quiet' option"
echo "When asked if you want p10k to automatically edit your .zshrc, select 'Yes (recommended).'"
echo ""
echo "Due to shell script limitations, you will have to source your .zshrc yourself"
echo "When you source it, it will start the p10k installer mentioned above"
echo "When this script exits, type 'source ~/.zshrc' from anywhere to finish the setup process"
echo "This script will now exit"
