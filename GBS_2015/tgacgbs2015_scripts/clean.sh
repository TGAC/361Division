#!/bin/bash

src=$HOME/working/clean

process_radtags -i gzfastq -p $src/lane1/ -o $src/samples -e sbfI -b $src/clean_lane1_barcodes -c -q -r
mv $src/samples/sample_AAACGG.fq.gz  $src/samples/indv_01.fq.gz
mv $src/samples/sample_AACGTT.fq.gz  $src/samples/indv_02.fq.gz
mv $src/samples/sample_AACTGA.fq.gz  $src/samples/indv_03.fq.gz
mv $src/samples/sample_AAGACG.fq.gz  $src/samples/indv_04.fq.gz
mv $src/samples/sample_AAGCTA.fq.gz  $src/samples/indv_05.fq.gz
mv $src/samples/sample_AATATC.fq.gz  $src/samples/indv_06.fq.gz
mv $src/samples/sample_AATGAG.fq.gz  $src/samples/indv_07.fq.gz
mv $src/samples/sample_ACAAGA.fq.gz  $src/samples/indv_08.fq.gz
mv $src/samples/sample_ACAGCG.fq.gz  $src/samples/indv_09.fq.gz
mv $src/samples/sample_ACATAC.fq.gz  $src/samples/indv_10.fq.gz
mv $src/samples/sample_ACCATG.fq.gz  $src/samples/indv_11.fq.gz
mv $src/samples/sample_ACCCCC.fq.gz  $src/samples/indv_12.fq.gz
mv $src/samples/sample_ACTCTT.fq.gz  $src/samples/indv_13.fq.gz
mv $src/samples/sample_ACTGGC.fq.gz  $src/samples/indv_14.fq.gz
mv $src/samples/sample_AGCCAT.fq.gz  $src/samples/indv_15.fq.gz
mv $src/samples/sample_AGCGCA.fq.gz  $src/samples/indv_16.fq.gz
mv $src/samples/sample_AGGGTC.fq.gz  $src/samples/indv_17.fq.gz
mv $src/samples/sample_AGGTGT.fq.gz  $src/samples/indv_18.fq.gz
mv $src/samples/sample_AGTAGG.fq.gz  $src/samples/indv_19.fq.gz
mv $src/samples/sample_AGTTAA.fq.gz  $src/samples/indv_20.fq.gz
mv $src/samples/sample_ATAGTA.fq.gz  $src/samples/indv_21.fq.gz
mv $src/samples/sample_ATCAAA.fq.gz  $src/samples/indv_22.fq.gz
mv $src/samples/sample_ATGCAC.fq.gz  $src/samples/indv_23.fq.gz
mv $src/samples/sample_ATGTTG.fq.gz  $src/samples/indv_24.fq.gz
mv $src/samples/sample_ATTCCG.fq.gz  $src/samples/indv_25.fq.gz
mv $src/samples/sample_CAAAAA.fq.gz  $src/samples/indv_26.fq.gz
mv $src/samples/sample_CAATCG.fq.gz  $src/samples/indv_27.fq.gz
mv $src/samples/sample_CACCTC.fq.gz  $src/samples/indv_28.fq.gz
mv $src/samples/sample_CAGGCA.fq.gz  $src/samples/indv_29.fq.gz
mv $src/samples/sample_CATACT.fq.gz  $src/samples/indv_30.fq.gz
mv $src/samples/sample_CCATTT.fq.gz  $src/samples/indv_31.fq.gz
mv $src/samples/sample_CCCGGT.fq.gz  $src/samples/indv_32.fq.gz
mv $src/samples/sample_CCCTAA.fq.gz  $src/samples/indv_33.fq.gz
mv $src/samples/sample_CCGAGG.fq.gz  $src/samples/indv_34.fq.gz
mv $src/samples/sample_CCGCAT.fq.gz  $src/samples/indv_35.fq.gz
mv $src/samples/sample_CCTAAC.fq.gz  $src/samples/indv_36.fq.gz
mv $src/samples/sample_CGAGGC.fq.gz  $src/samples/indv_37.fq.gz
mv $src/samples/sample_CGCAGA.fq.gz  $src/samples/indv_38.fq.gz
mv $src/samples/sample_CGCGTG.fq.gz  $src/samples/indv_39.fq.gz
mv $src/samples/sample_CGGTCC.fq.gz  $src/samples/indv_40.fq.gz
mv $src/samples/sample_CGTCTA.fq.gz  $src/samples/indv_41.fq.gz
mv $src/samples/sample_CGTGAT.fq.gz  $src/samples/indv_42.fq.gz
mv $src/samples/sample_CTACAG.fq.gz  $src/samples/indv_43.fq.gz
mv $src/samples/sample_CTCGCC.fq.gz  $src/samples/indv_44.fq.gz
mv $src/samples/sample_CTGCGA.fq.gz  $src/samples/indv_45.fq.gz
mv $src/samples/sample_CTGGTT.fq.gz  $src/samples/indv_46.fq.gz
mv $src/samples/sample_CTTATG.fq.gz  $src/samples/indv_47.fq.gz
mv $src/samples/sample_CTTTGC.fq.gz  $src/samples/indv_48.fq.gz
mv $src/samples/sample_GAAATG.fq.gz  $src/samples/indv_49.fq.gz
mv $src/samples/sample_GAACCA.fq.gz  $src/samples/indv_50.fq.gz
mv $src/samples/sample_GACGAC.fq.gz  $src/samples/indv_51.fq.gz
mv $src/samples/sample_GACTCT.fq.gz  $src/samples/indv_52.fq.gz
mv $src/samples/sample_GAGAGA.fq.gz  $src/samples/indv_53.fq.gz
mv $src/samples/sample_GATCGT.fq.gz  $src/samples/indv_54.fq.gz
mv $src/samples/sample_GCAGAT.fq.gz  $src/samples/indv_55.fq.gz
mv $src/samples/sample_GCATGG.fq.gz  $src/samples/indv_56.fq.gz
mv $src/samples/sample_GCCGTA.fq.gz  $src/samples/indv_57.fq.gz
mv $src/samples/sample_GCGACC.fq.gz  $src/samples/indv_58.fq.gz
mv $src/samples/sample_GCGCTG.fq.gz  $src/samples/indv_59.fq.gz
mv $src/samples/sample_GCTCAA.fq.gz  $src/samples/indv_60.fq.gz
mv $src/samples/sample_GGACTT.fq.gz  $src/samples/indv_61.fq.gz
mv $src/samples/sample_GGCAAG.fq.gz  $src/samples/indv_62.fq.gz
mv $src/samples/sample_GGGCGC.fq.gz  $src/samples/indv_63.fq.gz
mv $src/samples/sample_GGGGCG.fq.gz  $src/samples/indv_64.fq.gz
mv $src/samples/sample_GGTACA.fq.gz  $src/samples/indv_65.fq.gz
mv $src/samples/sample_GGTTTG.fq.gz  $src/samples/indv_66.fq.gz
mv $src/samples/sample_GTAAGT.fq.gz  $src/samples/indv_67.fq.gz
mv $src/samples/sample_GTATCC.fq.gz  $src/samples/indv_68.fq.gz
mv $src/samples/sample_GTCATC.fq.gz  $src/samples/indv_69.fq.gz
mv $src/samples/sample_GTGCCT.fq.gz  $src/samples/indv_70.fq.gz
mv $src/samples/sample_GTGTAA.fq.gz  $src/samples/indv_71.fq.gz
mv $src/samples/sample_GTTGGA.fq.gz  $src/samples/indv_72.fq.gz
mv $src/samples/sample_TAAGCT.fq.gz  $src/samples/indv_73.fq.gz
mv $src/samples/sample_TAATTC.fq.gz  $src/samples/indv_74.fq.gz
mv $src/samples/sample_TACACA.fq.gz  $src/samples/indv_75.fq.gz
mv $src/samples/sample_TACGGG.fq.gz  $src/samples/indv_76.fq.gz
mv $src/samples/sample_TAGTAT.fq.gz  $src/samples/indv_77.fq.gz
mv $src/samples/sample_TATCAC.fq.gz  $src/samples/indv_78.fq.gz
mv $src/samples/sample_TCAAAG.fq.gz  $src/samples/indv_79.fq.gz
mv $src/samples/sample_TCCTGC.fq.gz  $src/samples/indv_80.fq.gz
mv $src/samples/sample_TCGATT.fq.gz  $src/samples/indv_81.fq.gz
mv $src/samples/sample_TCGCCA.fq.gz  $src/samples/indv_82.fq.gz
mv $src/samples/sample_TCGGAC.fq.gz  $src/samples/indv_83.fq.gz
mv $src/samples/sample_TCTCGG.fq.gz  $src/samples/indv_84.fq.gz
mv $src/samples/sample_TCTTCT.fq.gz  $src/samples/indv_85.fq.gz
mv $src/samples/sample_TGAACC.fq.gz  $src/samples/indv_86.fq.gz
mv $src/samples/sample_TGACAA.fq.gz  $src/samples/indv_87.fq.gz
mv $src/samples/sample_TGCCCG.fq.gz  $src/samples/indv_88.fq.gz
mv $src/samples/sample_TGCTTA.fq.gz  $src/samples/indv_89.fq.gz
mv $src/samples/sample_TGGGGA.fq.gz  $src/samples/indv_90.fq.gz
mv $src/samples/sample_TTATGA.fq.gz  $src/samples/indv_91.fq.gz
mv $src/samples/sample_TTCCGT.fq.gz  $src/samples/indv_92.fq.gz
mv $src/samples/sample_TTCTAG.fq.gz  $src/samples/indv_93.fq.gz
mv $src/samples/sample_TTGAGC.fq.gz  $src/samples/indv_94.fq.gz
mv $src/samples/sample_TTTAAT.fq.gz  $src/samples/indv_95.fq.gz
mv $src/samples/sample_TTTGTC.fq.gz  $src/samples/indv_96.fq.gz

process_radtags -P -p $src/lane2 \
                -b $src/clean_lane2_barcodes \
                -o $src/ddsamples/ \
                -c -q -r --inline_index --renz_1 nlaIII --renz_2 mluCI -i gzfastq

barcodes="AACCA-ATCACG
AAGGA-CGATGT
AATTA-ATCACG
ACACA-CGATGT
ACGGT-ATCACG
ACTGG-CGATGT
ACTTC-ATCACG
AGCTA-CGATGT
ATACG-ATCACG
ATGAG-CGATGT
ATTAC-ATCACG
CAACC-CGATGT
CATAT-ATCACG
CGAAT-CGATGT
CGATC-ATCACG
CGGCT-CGATGT
CGGTA-ATCACG
CGTAC-CGATGT
CGTCG-ATCACG
CTGAT-CGATGT
CTGCG-ATCACG
CTGTC-CGATGT
CTTGG-ATCACG
GACAC-CGATGT
GAGAT-ATCACG
GAGTC-CGATGT
GCATG-ATCACG
GCCGT-CGATGT
GCTGA-ATCACG
GGATA-CGATGT
GGCCA-ATCACG
GGCTC-CGATGT
GGTTG-ATCACG
GTAGT-CGATGT
GTCCG-ATCACG
GTCGA-CGATGT
TACCG-ATCACG
TACGT-CGATGT
TAGTA-ATCACG
TATAC-CGATGT
TCACG-ATCACG
TCAGT-CGATGT
TCCGG-ATCACG
TCGAT-CGATGT
TCTGC-ATCACG
TGCAT-CGATGT
TGGAA-ATCACG
TTACC-CGATGT"

i=1
for barcode in $barcodes
do
   mv  $src/ddsamples/sample_${barcode}.1.fq.gz        $src/ddsamples/indv_${i}.fq.gz
   cat $src/ddsamples/sample_${barcode}.rem.1.fq.gz >> $src/ddsamples/indv_${i}.fq.gz
   rm  $src/ddsamples/sample_${barcode}.rem.1.fq.gz
   cat $src/ddsamples/sample_${barcode}.2.fq.gz     >> $src/ddsamples/indv_${i}.fq.gz
   rm  $src/ddsamples/sample_${barcode}.2.fq.gz
   cat $src/ddsamples/sample_${barcode}.rem.2.fq.gz >> $src/ddsamples/indv_${i}.fq.gz
   rm  $src/ddsamples/sample_${barcode}.rem.2.fq.gz
   let "i+=1"
done
