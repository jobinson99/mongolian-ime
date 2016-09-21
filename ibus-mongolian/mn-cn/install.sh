#!/bin/bash

sudo ibus-table-createdb -n /usr/share/ibus-table/tables/mongolian-unicode-cn.db -s mongolian-unicode-cn.txt
sudo cp mongolian-unicode-cn.svg /usr/share/ibus-table/icons/
ibus-daemon -rdx