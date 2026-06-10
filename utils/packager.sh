#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0


if conda env list | grep tacosigner
then
    conda activate tacosigner
else
    conda create -y -n tacosigner python=3.10
    conda activate tacosigner
fi;

if ! [ -d connector-plugin-sdk ]; then
    git clone https://github.com/tableau/connector-plugin-sdk.git
fi

cd connector-plugin-sdk/connector-packager 
python setup.py install

python -m connector_packager.package ../../../heavyai_jdbc/