# OmniSci Tableau Connector

### Prerequisites

Install the OmniSci JDBC driver in Tableau. The JDBC driver is packaged with the OmniSci binaries in the `bin` directory of the OmniSci package. See [Installing JDBC Drivers in Tableau](https://help.tableau.com/current/pro/desktop/en-us/examples_otherdatabases_jdbc.htm) for full instructions.

On MacOS:

Copy the `.jar` file to `~/Library/Tableau/Drivers`:

```
cp omnisci-jdbc-5.2.0-SNAPSHOT.jar ~/Library/Tableau/Drivers
```
(from the `bin` directory of your OmniSci package)

### Running in the Development Environment

The OmniSci Tableau Connector can be run in a development environment by pointing the local Tableau installation directly to the top-level directory of this repository. On MacOS:

```
/Applications/Tableau\ Desktop\ 2020.1.app/Contents/MacOS/Tableau -DConnectPluginsPath=/Users/alexb/Projects/omnisci-tableau-connector/
```
(assuming you cloned this repo into a `Projects` directory in your home folder)