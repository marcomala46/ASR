#!/bin/bash --login

#!/bin/bash
#SBATCH -p low-wn
#SBATCH -c 20
#SBATCH --mem 30G
#SBATCH -t 0-15:00:00

port=7777

#Go to the folder you wanna run jupyter in
cd $HOME

#Pick a random or predefined port
#port=$(shuf -i 6000-9999 -n 1)
#Forward the picked port to the prince on the same port. Here log-x is set to be the prince login node.
/usr/bin/ssh -N -f -R $port:localhost:$port login01


#Start the notebook
jupyter-lab --no-browser --ServerApp.allow_origin='https://colab.research.google.com' --port $port

wait
