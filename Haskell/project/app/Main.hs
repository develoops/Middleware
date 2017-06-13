{-# LANGUAGE OverloadedStrings #-}
module Main where


import Database.Bolt
import Database.HDBC.ODBC
import Database.HDBC

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

main :: IO ()
main = do pipe <- connect myConfiguration
          title <- run pipe $ query "MATCH (n:Person) WHERE n.name CONTAINS \"Arthur\" RETURN n.title"
          close pipe

