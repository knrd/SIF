DATADIR=../data
#WORDFILE=$DATADIR/glove.840B.300d.txt
WORDFILE=$DATADIR/glove.6B.50d.txt

# download word vector
if [ ! -e $WORDFILE ]; then
# wget http://nlp.stanford.edu/data/glove.840B.300d.zip
aria2c -x 16 http://nlp.stanford.edu/data/glove.6B.zip
# unzip glove.840B.300d.zip -d $DATADIR
unzip glove.6B.zip -d $DATADIR
# rm glove.840B.300d.zip
rm glove.6B.zip
fi

# demo for computing SIF embedding
python sif_embedding.py

# textual similarity tasks
python sim_sif.py 2>&1 | tee log/output_sim_sif.txt
python sim_tfidf.py 2>&1 | tee log/output_sim_tfidf.txt

# supervised tasks
./supervised_sif_proj.sh 2>&1 | tee log/output_supervised_sif_proj.txt
