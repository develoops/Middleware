
import Database.HDBC
import Database.HDBC.ODBC

main = do
    conn <- connectODBC connectionStr
    vals <- quickQuery conn "SELECT id FROM TodoItem WHERE text='test4';" [];
    print vals



connectionStr = "\
    \Driver=ODBC Driver 13 for SQL Server;\
    \SERVER=servertest.database.windows.net;\
    \Port=1433;\
    \Database=neoSqlDB;\
    \UID=mobi;\
    \PWD=Huea0199;"