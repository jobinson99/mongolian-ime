#!/bin/bash

sudo ibus-table-createdb -n /usr/share/ibus-table/tables/mongolian-cyrillic.db -s mongolian-cyrillic.txt
sudo cp mongolian-cyrillic.svg /usr/share/ibus-table/icons/
ibus-daemon -rdx