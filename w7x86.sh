echo "Download windows files"
wget -O w7x86.img https://bit.ly/akuhnetw7x86
echo "Download ngrok"
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Ctrl + V Authtoken: " CRP
./ngrok authtoken $CRP
nohup ./ngrok tcp 3000 &>/dev/null &
echo Downloading File From akuh.net
apt-get install qemu
echo "Wait"
echo "Starting Windows"
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Ctrl+C To Copy"
echo "Wait 1-2 minute to finish bot"
echo "Dont Close This Tab"
echo "Please support akuh.net thank you"
qemu-system-x86_64 -vnc :0 -hda w7x86.img -m 8G -smp cores=2 -net user,hostfwd=tcp::3000-:4000 -net nic -nographic
sleep 43200
