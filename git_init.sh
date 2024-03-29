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
**/.env.development
**/.env.production
**/.env
**/node_modules
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
*.DS_Store

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
**/environments/environment.prod.ts
**/environments/environment.ts

**/credentials.*
**/*credentials*

**/package-lock.json
**/yarn.lock

**/composer.lock
**/composer.phar

**/npm-debug.log
**/yarn-debug.log
**/yarn-error.log


*.pem
*.key
*.p12
*.pfx
*.cer
*.crt
*.der
*.p7b
*.p7c
*.pem.*
*.asc
*.gpg
*.gnupg
*.sec
*.keychain
*.ppk
*.pub
*.priv


" > .gitignore


git add -A
git commit -m "Initial commit"
git branch -M main
git remote add origin $1
git push -u origin main
