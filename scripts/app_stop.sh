isExistApp=$(pgrep apache2)

if [[ -n $isExistApp ]]; then
    sudo systemctl stop apache2
fi
