
{-# LANGUAGE OverloadedStrings #-}
module Main where


import Database.Bolt
import Database.HDBC.ODBC
import Database.HDBC
import Data.Text
myConfiguration :: BoltCfg
myConfiguration = def { magic         = 1616949271
                , version       = 1
                , userAgent     = "hasbolt/1.0"
                , maxChunkSize  = 65535
                , socketTimeout = 5
                , host          = "13.81.200.18"
                , port          = 7687
                , user          = "neo4j"
                , password      = "Mobicongress0199"
                }
connectionStr = "\
    \Driver=ODBC Driver 13 for SQL Server;\
    \SERVER=servertest.database.windows.net;\
    \Port=1433;\
    \Database=neoSqlDB;\
    \UID=mobi;\
    \PWD=Huea0199;"

main :: IO ()
main = do pipe <- connect myConfiguration
          title <- Database.Bolt.run pipe $ query "MATCH (n:Person) WHERE n.name CONTAINS \"Arthur\" RETURN n.title"
          print title
          conn <- connectODBC connectionStr
          vals <- quickQuery conn "INSERT INTO TodoItem(text) VALUES('ya')"[]
          commit conn
          close pipe