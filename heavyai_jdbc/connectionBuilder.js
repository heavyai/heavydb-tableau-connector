// SPDX-FileCopyrightText: Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
// SPDX-License-Identifier: Apache-2.0

(function dsbuilder(attr) {
    var urlBuilder = "jdbc:heavyai:" + attr[connectionHelper.attributeServer] + ":" + attr[connectionHelper.attributePort] + ":" + attr[connectionHelper.attributeDatabase];

    return [urlBuilder];
})
