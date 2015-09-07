#!/usr/bin/env bash
chmod +x filter.m
./filter.m ../images/peppers.png ./result.pgm;
echo "Result images created at result.pgm";