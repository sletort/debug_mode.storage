#!/bin/bash

#Commands to execute, available environment variables
#GODOCKER_JID: Job identifier
#GODOCKER_PWD: Job directory, container will execute script in this directory
#GODOCKER_HOME: mount path for user home directory.
#GODOCKER_DATA: personal storage (read only)
#GODOCKER_TASK_ID: Job array task identifier
#GODOCKER_TASK_FIRST: First job array task identifier
#GODOCKER_TASK_LAST: Last job array task identifier
#GODOCKER_TASK_STEP: steps in job array identifiers


declare -r SNAP=/opt/snap/snap-aligner
declare -r GATB=/opt/gatb-minia-pipeline
declare -r DATA_PATH=/db-rapsodyn/DATA_reseq_backup_2014
declare -r OUTPATH=/omaha-beach/sletort/godocker_runs/Aviso_assembly.snap1

#declare -r F_reads=$DATA_PATH/130521_SN403_0986_BD1YPDACXX/s_6_1_sequence_NoIndex-without_phix-without_other.fq.gz
#declare -r R_reads=$DATA_PATH/130521_SN403_0986_BD1YPDACXX/s_6_2_sequence_NoIndex-without_phix-without_other.fq.gz

declare -r MAX_MEM_MB=30000

# -----------------------------------

mkdir -p $OUTPATH
cd $OUTPATH

#$PIPELINE_PATH/gatb -1 ${F_reads} -2 ${R_reads} -o Aviso --max-memory $MAX_MEM_MB --continue-scaffolding -c Aviso_k81.contigs.only_extr.fa

# time $SNAP index Aviso_k81.contigs.fa aviso_index -HHistogram
# time $SNAP paired aviso_index $F_reads $R_reads -o aviso.lib0.bam -so -pf profile.txt

$GATB/tools/memused python $GATB/BESST/runBESST -c Aviso_k81.contigs.fa -f aviso.lib0.bam -o Aviso_besst --orientation fr
