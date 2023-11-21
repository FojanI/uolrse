#!/usr/bin/bash

ls | cut -d"." -f 1 | xargs -I {} mv {}.$1 {}.$2

