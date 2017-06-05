#!/usr/bin/env python
# -*- coding: utf-8 -*- 
import pyodbc
from neo4j.v1 import GraphDatabase, basic_auth


driver = GraphDatabase.driver("bolt://13.81.200.18:7687/", auth=basic_auth("neo4j", "Mobicongress0199"))
session = driver.session()

result = session.run("MATCH (a:Person) WHERE a.name = {name} "
                       "RETURN a.name AS name",
                       {"name": "Lana Wachowski"})
for record in result:
      print("%s %s" % (record["title"], record["name"]))

# 



server = 'servertest.database.windows.net'
database = 'neoSqlDB'
username = 'mobi'
password = 'Huea0199'
cnxn = pyodbc.connect('DRIVER={ODBC Driver 13 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()


sql="""INSERT INTO TodoItem (text) VALUES (?)"""
cursor.execute(sql,record["title"])

	# print ('La hicimos perrex, vamos por más')

 
#    for row in rows:
#        print(row)

cnxn.commit()

session.close()

