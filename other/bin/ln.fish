#!/usr/bin/fish

set _f $argv[1]

if test -f $_f
	set _nf (string replace "$HOME" (dirname (dirname (dirname -- (status --current-filename))))/home (path resolve -- $_f))
	set _ndf (dirname $_nf)
	if test ! -d $_ndf
		mkdir -p $_ndf
	end
	if test "$argv[2]" = "cp"
		echo "копиране"
		cp "$_f" "$_nf"
	else
		ln "$_f" "$_nf"
	end
else
	echo "$_f не съществува"
end
