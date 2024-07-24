# ASR
Automatic pipeline for Ancestral Sequence Reconstruction

Connect to the EOS cluster and open a tunnel for port forwarding
Choose whatever port you want from 7000 to 9000

```bash
port=7777
ssh -E /dev/null -L $port:localhost:$port user@eos.unipv.it
```

Get access to the nodes of EOS cluster UNIPV
```bash
ssh keygen
ssh-copy-id wn01
```
Repeat this step for all the nodes.

Create the conda envinroment with requirements
```bash
conda create -n ASR -y -c conda-forge -c bioconda -c anaconda\
              numpy\
              biopython\
              panel\
              bokeh\
              jupyterlab\
              biopandas\
              clustalo\
              clustalw\
              mafft\
              matplotlib\
              seaborn\
              plotly\
              beautifulsoup4\
              pymol-open-source\
              scipy\
              tqdm\
              ete3\
              raxml\
              raxml-ng\
              paml

conda activate ASR

pip install omadb
pip install pyMSAviz
```

Sbatch the ASR_nb.sh file to start notebook
Please modify the port inside the file to be sure that is the **SAME PORT** used in the port forwarding!!

```bash
cd ASR
sbatch ASR_nb.sh
```

Once the job began, get the url of your notebook, written in the slurm output file:
```
cat slurm-<JOBID>.out
```

Go to [ASR.ipynb](https://colab.research.google.com/drive/1JZu53IvHKUhsUX-PD2w__fjwEVdnlnGg?usp=sharing) notebook, click on the arrow near to `Connect` and choose `connect to local runtime`

Paste the jupyterlab url and you are ready to perform ASR!
