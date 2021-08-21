# ETL

## Tool chain

### Docker

Docker hosts the MS SQL database in which the data is being loaded and cleaned.

Many thanks to "DBA From the Cold" whose docker compose scripts saved me a ton of work.
https://github.com/dbafromthecold/SqlServerAndContainersGuide

### KNIME Analytics

KNIME Analytics has been used as the workflow and primary bulk load tool.

### DBeaver

DBeaver is the GUI being used for database management and querying.

### VSCode

VSCode is being used as the primary coding tool.

## Issues and Analysis

The ATO data has come in an excel document. KNIME is extracting the large values and writing them in scientific notation to the database. The values fail CASTing to DECIMAL, so FLOAT has been used.

Some fields of the ```ts19individual14occupationsextaxableincomerange.xlsx.14B``` contain the text "na" which fails conversion to a number. Since this is my first time using KNIME I am unfamiliar with the data cleansing components and have chosen to clean the data within the stored procedure. 

The ```Australian Skills Classification 12-03-2021.xlsx.Common tech tools``` spreadsheet contains the text "Several technology tools are so universal in 2021 that they are likely to be used by most or all occupations, and these are listed here. These tools are:" as the first row. This is obviously not a data value.

```ts19individual14occupationsextaxableincomerange.xlsx``` also contains superscript annotations and carriage returns within field names, and a page title on each spreadsheet. 
