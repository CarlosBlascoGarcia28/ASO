#!/bin/bash

bytes=$1

calculo() {
    echo "scale=2; $bytes / 1073741824" | bc
}

calculo