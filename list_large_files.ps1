# List files with a size bigger than that specified in GB, containing specified string
$folder = "C:/Users/"
$size = 0.1  # GB (so 1e-3 for MB, 1e-6 for KB....)

ls $folder -recurse -file -erroraction silentlycontinue|
where {$_.length -gt 1073741824*$size} |
sort length -descending |  # Display length in MB rounded (down) to 2 decimal places
format-table -autosize -property @{label="Size (MB)"; expression={ 1e-2*[int](1e-4*$_.length) }}, fullname
