# List files with a size bigger than that specified in GB, containing specified string
$folder = "C:/"
$size = 0.1  # GB (so 1e-3 for MB, 1e-6 for KB....)

ls $folder -recurse -erroraction silentlycontinue|
where {$_.length -gt 1073741824*$size} |
sort length |
ft fullname, length |
format-table -wrap
