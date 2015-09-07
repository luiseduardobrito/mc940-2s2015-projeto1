#!/usr/bin/env bash
chmod +x combine.m
./combine.m ../images/baboon256x256.png ../images/monalisa256x256.png ./result.pgm &> /dev/null;
echo "Result image created as result.pgm";