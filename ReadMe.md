# git vs mercurial (hg) versioning system directory size

git copies files as a whole into its object store.

mercurial compresses the files and stores them in a revlist, which also allows saving of diffs instead of complete files.

## Motivation
I am creating frequent database backups using plain SQL dumps.
Doing this in a 15min interval blew up the git-repositories I use to manage the backups.
Which means, I am shrinking them once a month by throwing out old versions.

Before the internet has decided that git is the only versioning system, I also used svn and later mercurial.

It does not bother me, that git saves the files uncompressed. However, I do not like the fact, that git never saves a diff. This has huge implications for huge files.

## Usage
Use `test.sh` to create 100 revisions of a file in git and mercurial. Only a single line will be added between revisions.

I searched the longest wikipedia article, and "List of snakes" came up (in German). So this is our fileset in target.html. I created it by using: `wget -O target.html https://de.wikipedia.org/wiki/Liste_der_Schlangenarten`


