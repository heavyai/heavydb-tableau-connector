# HeavyDB Tableau Connector
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/heavyai/heavydb-tableau-connector/blob/master/LICENSE.txt)
[![Security](https://img.shields.io/badge/Security-Report%20a%20Vulnerability-red.svg)](https://github.com/heavyai/heavydb-tableau-connector/blob/master/SECURITY.md)
[![GitHub Discussions](https://img.shields.io/badge/GitHub-Discussions-blue?logo=github)](https://github.com/orgs/heavyai/discussions)



### Prerequisites

Install the HeavyAI JDBC driver in Tableau. The JDBC driver is packaged with the HeavyAI binaries in the `bin` directory of the HeavyAI package. See [Installing JDBC Drivers in Tableau](https://help.tableau.com/current/pro/desktop/en-us/examples_otherdatabases_jdbc.htm) for full instructions.

(Below needs updating for new HeavyAI naming scheme)

On MacOS:

Copy the `.jar` file to `~/Library/Tableau/Drivers`:

```
cp heavyai-jdbc-6.0.0-SNAPSHOT.jar ~/Library/Tableau/Drivers
```

(from the `bin` directory of your HeavyAI package)

### Running in the Development Environment

The HeavyDB Tableau Connector can be run in a development environment by pointing the local Tableau installation directly to the top-level directory of this repository. On MacOS:

```
/Applications/Tableau\ Desktop\ 2020.1.app/Contents/MacOS/Tableau -DConnectPluginsPath=/Users/alexb/Projects/heavydb-tableau-connector/
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

Generate and sign the taco (Note: below needs updating to HeavyAI name and key)

```
cd connector_packager
python -m connector_packager.package /path/to/heavydb-tableau-connector/omnisci_jdbc -a 'omnisci, inc.’s sectigo limited id' -ks ~/.keystore
```

By default the taco will be placed at `packaged-connector/omnisci_jdbc.taco`

Re-sign the taco, but with timestamping enabled (this won't be necessary once https://github.com/tableau/connector-plugin-sdk/issues/396 is resolved). Timestamping allows the taco to be used past our certificate expiration date.

```
jarsigner -keystore ~/.keystore -tsa http://timestamp.comodoca.com packaged-connector/omnisci_jdbc.taco 'omnisci, inc.’s sectigo limited id'
```

### Using the signed package

Install Tableau.

Install a Java distribution, current recommended by Tableau is Java 8 from https://adoptopenjdk.net/ .

Acquire `heavyai-jdbc-x.y.z.jar` from the `bin` directory of a HeavyAI distribution and place it in the Tableau Drivers dir. On macOS this is under `~/Library/Tableau/Drivers`, on Windows it is `c:\Program Files\Tableau\Drivers`.

Copy the generated `omnisci_jdbc.taco` to the Tableau Repository Connectors dir. On macOS this is under `~/Documents/My Tableau Repository/Connectors`, on Windows it is `%HOMEPATH%\Documents\My Tableau Repository\Connectors`.


## Security
> [!WARNING]
> **Do not report security vulnerabilities through public GitHub issues!**

NVIDIA takes security seriously. If you discover a vulnerability in heavydb-tableau-connector, **DO NOT open a public issue**. Use one of the private reporting channels described in [SECURITY.md](https://github.com/heavyai/heavydb-tableau-connector/blob/master/SECURITY.md).

## Support
Join the [HeavyAI GitHub Discussions](https://github.com/orgs/heavyai/discussions) to ask questions, share feedback, and report issues. HeavyAI maintainers review issues, discussions, and pull requests on a best effort basis without guaranteed response timelines.
  
## License
Apache 2.0. See [LICENSE](https://github.com/heavyai/heavydb-tableau-connector/blob/master/LICENSE.txt).
