#!/usr/bin/env -S just -f

_:
	@just --list

new-package:
	#!/usr/bin/env fish
	set -l dir "./pkgbuilds"
	set -l output (zenity --title 'New package' --text 'Options' --forms --add-entry 'Name' --add-combo 'PKGBUILD' --combo-values (find "$dir/.proto" -type f -exec basename {} \; | string join '|'))
	if test $status -ne 0
		exit 0
	end
	printf "%s" "$output" | read -d "|" name pkgbuild
	set -l name (string trim "$name")
	if test -d "$dir/$name"; or test -z "$name"
		zenity --error --text "$name already exists!"
	else
		mkdir -p "$dir/$name"
		cp "$dir/.proto/$pkgbuild" "$dir/$name/PKGBUILD"
	end

# sync_dconf:

packages-check:
	@for fl in ./pkgbuilds/*; do [ -f "$fl"/.SRCINFO ] || echo "No .SRCINFO for '$(basename $fl)'"; done

sync-file sd td file:
	@if test -f "{{ td }}/{{ file }}" && ! test -f "./{{ sd }}/{{ file }}.diff"; then \
		DIFF=$(diff --unified "{{ sd }}/{{ file }}" "{{ td }}/{{ file }}"); \
		if [ "$DIFF" != "" ]; then printf "%s" "$DIFF" > "./{{ sd }}/{{ file }}.diff"; fi; \
	fi

sync-files:
	@cd etc && find -type f ! -name "*.diff" $(printf "! -wholename %s " $(cat ../other/skip_sync.txt | grep -v '^$')) -exec just sync-file etc /etc "{}" \;
	@cd home && find -type f ! -name "*.diff" $(printf "! -wholename %s " $(cat ../other/skip_sync.txt | grep -v '^$')) -exec just sync-file home "$HOME" "{}" \;
