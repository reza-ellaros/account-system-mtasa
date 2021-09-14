

host = ""
db = ""
user = ""
pass = ""

port = 3306

function mysql ()
dbConnection = dbConnect("mysql","dbname="..db..";host="..host,user,pass)

if dbConnection then 
else
    end
end
addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),mysql)


function getmysql()

return dbConnection
end