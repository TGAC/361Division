#!/bin/bash

mycnf=/usr/local/share/stacks/sql/mysql.cnf
src=$HOME/working/scan
gsnap_db=/data/gsnap_db/gac_gen_broads1_e77

types="nomapping
unpaired_circular
unpaired_mult
unpaired_transloc"

#
# Align with Gsnap, convert to BAM
#
files="s13_fw_01
s13_fw_02
s13_fw_03
s13_fw_04
s13_fw_05
s13_fw_06
s13_fw_07
s13_fw_08"

for file in $files
do 
   echo $file
   gsnap -t 8 --terminal-threshold=150 -A sam --gunzip -m 5 -i 3 -d gac_gen_broads1_e77 \
         -D $gsnap_db --split-output=$src/aligned/${file} $src/samples/${file}.fa.gz 2>> $src/aligned/gsnap.log 
done

for file in $files
do
    for type in $types
    do
	rm $src/aligned/${file}.${type}
    done
done

#
# Align with Gsnap, convert to BAM
#
files="s13_an_01
s13_an_02
s13_an_03
s13_an_04
s13_an_05
s13_an_06
s13_an_07
s13_an_08"

for file in $files
do 
    echo $file
    gsnap -t 8 --terminal-threshold=150 -A sam --gunzip -m 5 -i 3 -d gac_gen_broads1_e77 \
          -D $gsnap_db --split-output=$src/aligned/$file $src/samples/${file}.fa.gz 2>> $src/aligned/gsnap.log 
done

for file in $files
do
    for type in $types
    do
	rm $src/aligned/${file}.${type}
    done
done


#
# Compress alignments into BAM; sort unique alignements.
# 
echo "Compressing and sorting samples."
ls -1 $src/aligned/*.unpaired_uniq | parallel -P 5 \
"samtools view -b -S -o {.}.unpaired_uniq.bam {.}.unpaired_uniq; \
rm {.}.unpaired_uniq; \
samtools sort {.}.unpaired_uniq.bam {.}.unpaired_uniq.sorted; \
rm {.}.unpaired_uniq.bam; \
mv {.}.unpaired_uniq.sorted.bam {.}.bam"

#
# Create the Stacks database
#
db=middleton_radtags
mysql --defaults-file=$mycnf -e "drop database if exists $db"
mysql --defaults-file=$mycnf -e "create database $db"
mysql --defaults-file=$mycnf $db < /usr/local/share/stacks/sql/stacks.sql

batch_id=1
desc="Sample 450, Middleton Island Site 13 Freshwater (fw) and Anadromous (an) phenotypes"
ref_map.pl -m 3 -T 8 -B $db -b $batch_id -D "$desc" -O $src/scan_popmap -X "populations:--fstats" \
 -o $src/stacks \
 -s $src/aligned/s13_fw_01.bam \
 -s $src/aligned/s13_fw_02.bam \
 -s $src/aligned/s13_fw_03.bam \
 -s $src/aligned/s13_fw_04.bam \
 -s $src/aligned/s13_fw_05.bam \
 -s $src/aligned/s13_fw_06.bam \
 -s $src/aligned/s13_fw_07.bam \
 -s $src/aligned/s13_fw_08.bam \
 -s $src/aligned/s13_an_01.bam \
 -s $src/aligned/s13_an_02.bam \
 -s $src/aligned/s13_an_03.bam \
 -s $src/aligned/s13_an_04.bam \
 -s $src/aligned/s13_an_05.bam \
 -s $src/aligned/s13_an_06.bam \
 -s $src/aligned/s13_an_07.bam \
 -s $src/aligned/s13_an_08.bam

#
# Run populations again, turn on kernal smoothing and locus filters.
#
populations -b 1 -P $src/stacks -t 16 -M $src/scan_popmap -k -p 2 -f p_value -r 0.75

#
# Pull out groupIV
#
grep "groupIV\b" $src/stacks/batch_1.fst_oc-fw.tsv > $src/stacks/batch_1.fst_oc-fw_groupIV.tsv

#
# Plot
#
gnuplot < $src/fst_groupIV.gnuplot
