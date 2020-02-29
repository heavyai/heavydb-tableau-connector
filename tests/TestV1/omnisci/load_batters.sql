DROP TABLE IF EXISTS Batters;

CREATE TABLE Batters
(
    Player TEXT ENCODING DICT(32),
    Team TEXT ENCODING DICT(32),
    League TEXT ENCODING DICT(8),
    "Year" SMALLINT,
    Games DOUBLE,
    AB DOUBLE,
    R DOUBLE,
    H DOUBLE,
    Doubles DOUBLE,
    Triples DOUBLE,
    HR DOUBLE,
    RBI DOUBLE,
    SB DOUBLE,
    CS DOUBLE,
    BB DOUBLE,
    SO DOUBLE,
    IBB DOUBLE,
    HBP DOUBLE,
    SH DOUBLE,
    SF DOUBLE, 
    GIDP DOUBLE
);

COPY Batters FROM '<root_directory>/omnisci-tableau-connector/tests/TestV1/Batters.csv' WITH (max_reject=1, nulls='NULL', quoted='false');