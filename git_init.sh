#! /bin/bash

# Param looks like git@github.com:user/test.git


if [ "$#" -ne 1 ]
then
	echo "Error: Takes git repository as parameter"
	exit
fi


# Check if the parameter is a git repo
repo=`echo "$1" | tr '.' '\n' | head -1`
suffix=`echo "$1" | tr '.' '\n' | tail -1`

if [ "$repo" != "git@github" ] || [ "$repo" != "git@gitlab" ] && [ "$suffix" != "git" ]
then
	echo "Error: Parameter must be a git repository"
	exit
fi




	#################### Repository is checked, start init ####################


git init
echo "
**/.gitignore
**/.env
**/node_modules
**/Dockerfile
**/.dockerignore
**/__pycache__/


**/vendor

## IDEs
.vscode/
*.pydevproject
.project
.metadata
*.swp
*~.nib
local.properties
.classpath
.loadpath
.externalToolBuilders/
.buildpath
*.launch
.settings/
.cproject
.buildpath

## OSes
[Tt]humbs.db
[Dd]esktop.ini
*.DS_store


## Misc
**/bin/
**/tmp/
*.tmp
*.bak
*.log
*.[Cc]ache
*.cpr
*.orig
*.php.in
.idea/
temp/
.Trashes
.svn
*.codekit
*.scssc
._*

## Distribute
**/dist/
**/bundle/

## Angular
**/environnment/**


**/download/**

" > .gitignore



git add -A
git commit -m "Initial commit"
git branch -M main
git remote add origin $1
git push -u origin main
