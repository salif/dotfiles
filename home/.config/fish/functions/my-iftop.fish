function my-iftop --wraps='iftop -i wlan0' --wraps='sudo iftop -i enp2s0f1' --description 'alias my-iftop=sudo iftop -i enp2s0f1'
  sudo iftop -i enp2s0f1     
end
