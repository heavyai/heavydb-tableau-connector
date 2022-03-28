# HEAVY.AI Tableau Connector

### Prerequisites

Install the HEAVY.AI JDBC driver in Tableau. The JDBC driver is packaged with the HEAVY.AI binaries in the `bin` directory of the HEAVY.AI package. See [Installing JDBC Drivers in Tableau](https://help.tableau.com/current/pro/desktop/en-us/examples_otherdatabases_jdbc.htm) for full instructions.

On MacOS:

Copy the `.jar` file to `~/Library/Tableau/Drivers`:

```
cp heavyai-jdbc-5.2.0-SNAPSHOT.jar ~/Library/Tableau/Drivers
```

(from the `bin` directory of your HEAVY.AI package)

### Running in the Development Environment

The HEAVY.AI Tableau Connector can be run in a development environment by pointing the local Tableau installation directly to the top-level directory of this repository. On MacOS:

```
/Applications/Tableau\ Desktop\ 2020.1.app/Contents/MacOS/Tableau -DConnectPluginsPath=/Users/alexb/Projects/heavyai-tableau-connector/
```

(assuming you cloned this repo into a `Projects` directory in your home folder)

### Packaging and Signing

Acquire the keystore with the company codesigning cert from @andrewseidl .

Clone and setup https://github.com/tableau/connector-plugin-sdk

```
git clone https://github.com/tableau/connector-plugin-sdk
cd connector-plugin-sdk/connector-packager
python -m venv venv
source venv/bin/activate
python setup.py install
```

Generate and sign the taco

```
cd connector_packager
python -m connector_packager.package /path/to/heavyai-tableau-connector/heavyai_jdbc -a 'omnisci, inc.’s sectigo limited id' -ks ~/.keystore
```

By default the taco will be placed at `packaged-connector/heavyai_jdbc.taco`

Re-sign the taco, but with timestamping enabled (this won't be necessary once https://github.com/tableau/connector-plugin-sdk/issues/396 is resolved). Timestamping allows the taco to be used past our certificate expiration date.

```
jarsigner -keystore ~/.keystore -tsa http://timestamp.comodoca.com packaged-connector/heavyai_jdbc.taco 'omnisci, inc.’s sectigo limited id'
```

### Using the signed package

Install Tableau.

Install a Java distribution, current recommended by Tableau is Java 8 from https://adoptopenjdk.net/ .

Acquire `heavyai-jdbc-x.y.z.jar` from the `bin` directory of an HEAVY.AI distribution and place it in the Tableau Drivers dir. On macOS this is under `~/Library/Tableau/Drivers`, on Windows it is `c:\Program Files\Tableau\Drivers`.

Copy the generated `heavyai.taco` to the Tableau Repository Connectors dir. On macOS this is under `~/Documents/My Tableau Repository/Connectors`, on Windows it is `%HOMEPATH%\Documents\My Tableau Repository\Connectors`.
