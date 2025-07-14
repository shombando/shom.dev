#usr/bin/env bash
set -eou pipefail
rsync --archive					`# recursively copy directories, copy symlinks without resolving, and preserve permissions, ownership and modification times` \
	    --partial					`# keep partially transferred files` \
			--progress				`#  show progress during transfer` \
			--human-readable	`#  output numbers in a human-readable format` \
			--delete-before		`#  receiver deletes before transfer, not during` \
			./public/* conmanBananerd:/home/conman/prod/caddy/site/shom.dev/
