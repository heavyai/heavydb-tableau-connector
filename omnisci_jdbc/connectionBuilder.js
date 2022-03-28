(function dsbuilder(attr) {
    var urlBuilder = "jdbc:heavyai:" + attr[connectionHelper.attributeServer] + ":" + attr[connectionHelper.attributePort] + ":" + attr[connectionHelper.attributeDatabase];

    return [urlBuilder];
})
