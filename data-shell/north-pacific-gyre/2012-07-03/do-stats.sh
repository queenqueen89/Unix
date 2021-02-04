# Calculate stats for data files. 

for datafile in "$@"
do 
	echo $datafile
	bash goostats $datafile stats-$datafile
done
