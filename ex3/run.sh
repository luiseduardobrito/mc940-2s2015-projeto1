#!/usr/bin/env bash
chmod +x compare.m
./compare.m ../images/peppers.png ../images/baboon.png ./results/;
echo "Result images created at ./results";