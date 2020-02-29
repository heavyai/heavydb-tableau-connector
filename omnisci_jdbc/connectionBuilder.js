(function dsbuilder(attr) {
    var urlBuilder = "jdbc:omnisci:" + attr[connectionHelper.attributeServer] + ":" + attr[connectionHelper.attributePort] + ":" + attr[connectionHelper.attributeDatabase];

    return [urlBuilder];
})
