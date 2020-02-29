DROP TABLE IF EXISTS Calcs;

CREATE TABLE Calcs
(
    key TEXT ENCODING DICT(32),
    num0 DOUBLE,
    num1 DOUBLE,
    num2 DOUBLE,
    num3 DOUBLE,
    num4 DOUBLE,
    str0 TEXT ENCODING DICT(32),
    str1 TEXT ENCODING DICT(32),
    str2 TEXT ENCODING DICT(32),
    str3 TEXT ENCODING DICT(32),
    int0 INTEGER,
    int1 INTEGER,
    int2 INTEGER,
    int3 INTEGER,
    bool0 BOOLEAN,
    bool1 BOOLEAN,
    bool2 BOOLEAN,
    bool3 BOOLEAN,
    date0 DATE,
    date1 DATE,
    date2 DATE,
    date3 DATE,
    time0 TIMESTAMP,
    time1 TIME,
    datetime0 TIMESTAMP,
    datetime1 TEXT ENCODING DICT(32),
    zzz TEXT ENCODING DICT(32)
);

COPY Calcs FROM '<root_directory>/omnisci-tableau-connector/tests/TestV1/Calcs.csv' WITH (max_reject=1, quoted='false');