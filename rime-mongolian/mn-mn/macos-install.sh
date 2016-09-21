#!/bin/bash

sudo cp -R Squirrel.app /Library/Input\ Methods/
/Library/Input\ Methods/Squirrel.app/Contents/Resources/postflight

mkdir -p ~/Library/Rime/
cp -R default.yaml ~/Library/Rime/
cp mongolian-mn.dict.yaml ~/Library/Rime/
cp mongolian-mn.schema.yaml ~/Library/Rime/
