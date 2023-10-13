# LOG_FILE = total.log
# SYSTEM = Linux ubuntu 6.2.0-dirty #2 SMP PREEMPT_DYNAMIC Fri Oct 13 06:42:10 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
# DISK_SIZE = 10G
# DURATION = 10s
# DIRECTIO = bufferedio,directio
# MEDIA_TYPES = ssd,hdd,nvme,mem
# FS_TYPES = PayGo,PayGo+group(s=16),PayGo+group(s=8),PayGo+group(s=4),PayGo+group(s=2)
# BENCH_TYPES = DWAL,DWOL,DWOM,DWSL,MWRL,MWRM,MWCL,MWCM,MWUM,MWUL,DWTL,filebench_varmail,filebench_oltp,filebench_fileserver,dbench_client,MRPL,MRPM,MRPH,MRDM,MRDL,DRBH,DRBM,DRBL
# NCORES = 1,2,4,9,18,27,36
# CORE_SEQ = 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35
# MODEL_NAME = Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz
# PHYSICAL_CHIPS = 2
# CORE_PER_CHIP = 18
# SMT_LEVEL = 1
# NUM_TEST_CONF = 7

set term pdfcairo size 2.3in,2.3in font ',10'
set_out='set output "`if test -z $OUT; then echo sc.pdf; else echo $OUT; fi`"'
eval set_out
set multiplot layout 1,1

set title 'mem:DRBH:bufferedio'
set xlabel '# cores'
set ylabel 'M ops/sec'
plot [0:][0:] 'mem:PayGo:DRBH:bufferedio.dat' using 1:2 title 'PayGo' with lp ps 0.5, 'mem:PayGo+group(s=16):DRBH:bufferedio.dat' using 1:2 title 'PayGo+group(s=16)' with lp ps 0.5, 'mem:PayGo+group(s=2):DRBH:bufferedio.dat' using 1:2 title 'PayGo+group(s=2)' with lp ps 0.5, 'mem:PayGo+group(s=4):DRBH:bufferedio.dat' using 1:2 title 'PayGo+group(s=4)' with lp ps 0.5, 'mem:PayGo+group(s=8):DRBH:bufferedio.dat' using 1:2 title 'PayGo+group(s=8)' with lp ps 0.5

unset multiplot
set output
