#!/usr/bin/bash

ls *.$1 | cut -d"." -f 1 | xargs -I {} mv {}.$1 {}.$2

