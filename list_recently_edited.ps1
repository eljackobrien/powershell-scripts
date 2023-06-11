# Script to list files in current directory and subdirectories edited within the specified time period
$time_period = 24
$date_format = (get-date).AddHours(-$time_period).Date

ls -recurse -file -include *.py -erroraction silentlycontinue |	# Look for Python files
where-object { $_.LastWriteTime -ge $date_format } |			# Filter by last edit time
sort-object LastWriteTime -Descending |							# Sort by most recently edited
format-table -Wrap												# Format into table
