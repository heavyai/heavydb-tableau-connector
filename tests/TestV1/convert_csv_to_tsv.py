# SPDX-FileCopyrightText: Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

import csv
import sys

input_file = sys.argv[1]
output_file = sys.argv[2]

csv.writer(open(output_file, 'w'), dialect='excel-tab').writerows(csv.reader(open(input_file, 'r')))
