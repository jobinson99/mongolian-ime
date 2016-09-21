#!/bin/bash

sudo cp -R Squirrel.app /Library/Input\ Methods/
/Library/Input\ Methods/Squirrel.app/Contents/Resources/postflight

mkdir -p ~/Library/Rime/
cp -R default.yaml ~/Library/Rime/
cp -R mongolian-cn.dict.yaml ~/Library/Rime/
cp -R mongolian-cn.schema.yaml ~/Library/Rime/

