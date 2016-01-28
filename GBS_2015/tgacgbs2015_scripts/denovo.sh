#!/bin/bash

mycnf=/usr/local/share/stacks/sql/mysql.cnf
src=$HOME/working/denovo

#
# Create the Stacks database
#
db=orphy_radtags
mysql --defaults-file=$mycnf -e "create database $db"
mysql --defaults-file=$mycnf $db < /usr/local/share/stacks/sql/stacks.sql

batch_id=1
desc="Oregon Stickleback RAD-Tag Samples"

denovo_map.pl -T 8 -m 3 -M 5 -n 3 -B $db -b $batch_id -D "$desc" -O $src/denovo_popmap \
  -o $src/stacks \
  -s $src/samples/ms_2067.01.fa.gz \
  -s $src/samples/ms_2067.02.fa.gz \
  -s $src/samples/ms_2067.03.fa.gz \
  -s $src/samples/ms_2067.04.fa.gz \
  -s $src/samples/ms_2067.05.fa.gz \
  -s $src/samples/ms_2067.06.fa.gz \
  -s $src/samples/ms_2067.08.fa.gz \
  -s $src/samples/ms_2067.09.fa.gz \
  -s $src/samples/ms_2067.10.fa.gz \
  -s $src/samples/ms_2067.11.fa.gz \
  -s $src/samples/pcr_1193.00.fa.gz \
  -s $src/samples/pcr_1193.01.fa.gz \
  -s $src/samples/pcr_1193.08.fa.gz \
  -s $src/samples/pcr_1193.11.fa.gz \
  -s $src/samples/pcr_1210.05.fa.gz \
  -s $src/samples/pcr_1211.01.fa.gz \
  -s $src/samples/pcr_1211.02.fa.gz \
  -s $src/samples/pcr_1211.04.fa.gz \
  -s $src/samples/pcr_1211.05.fa.gz \
  -s $src/samples/pcr_1211.06.fa.gz \
  -s $src/samples/rb_2217.001.fa.gz \
  -s $src/samples/rb_2217.003.fa.gz \
  -s $src/samples/rb_2217.005.fa.gz \
  -s $src/samples/rb_2217.006.fa.gz \
  -s $src/samples/rb_2217.007.fa.gz \
  -s $src/samples/rb_2217.010.fa.gz \
  -s $src/samples/rb_2217.011.fa.gz \
  -s $src/samples/rb_2217.014.fa.gz \
  -s $src/samples/rb_2217.016.fa.gz \
  -s $src/samples/rb_2217.018.fa.gz

populations -b 1 -P $src/stacks -r 0.8 -p 3 -t 8 --structure --write_single_snp
cat $src/stacks/batch_1.sumstats.tsv | grep -v "^#" | cut -f 2 | sort -n | uniq | shuf | head -n 1000 > $src/wl

# Add population map, remove filters
populations -b 1 -P $src/stacks -t 8 --structure --write_single_snp -W $src/wl -M $src/denovo_popmap

# Remove comment line from structure file

# copy structure file into newly made structure directory

# structure > $src/structure/batch_1.structure.console
