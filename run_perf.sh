sudo perf record -F 99 -a -g -- sleep 60
# perf commands have to be issued as root to get kernel symbol names
sudo perf script | ./stackcollapse-perf.pl --kernel  > out.perf-folded
sudo chmod 777 perf.data
sudo chmod 777 perf.hist.0
sudo chmod 777 out.perf-folded
./flamegraph.pl --color=ovs out.perf-folded > perf-kernel.svg
