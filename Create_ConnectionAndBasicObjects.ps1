#### powershell sql server connection 

$loginName = "test" #sql login name
$pwd="Test123*"     #sql login password

$connectionString="Server=.;Database=master;User ID=$loginName;Password=$pwd;TrustServerCertificate=False;"

$connection = new-object System.Data.SqlClient.SqlConnection
$connection.ConnectionString=$connectionString

$connection.Open()

$command=$connection.CreateCommand()
$command.CommandText="select host_name()"

$reader = $command.ExecuteReader();
$reader.HasRows       # if result set has got rows it returns true.
$command.Dispose()

$connection.Close()




#############################################################Create Database Objects ########################################################

#### create database 

$loginName = "test" #sql login name
$pwd="Test123*"     #sql login password

$connectionString="Server=.;Database=master;User ID=$loginName;Password=$pwd;TrustServerCertificate=False;"

$connection = new-object System.Data.SqlClient.SqlConnection
$connection.ConnectionString=$connectionString

$connection.Open()

$command=$connection.CreateCommand();
$command.CommandText="create database test4"  # create script is here.

$reader = $command.ExecuteReader();
$reader.HasRows       # if result set has got rows it returns true.
$command.Dispose()

$connection.Close()




#### create table sample

$loginName = "test" #sql login name
$pwd="Test123*"     #sql login password

$connectionString="Server=.;Database=test4;User ID=$loginName;Password=$pwd;TrustServerCertificate=False;"

$connection = new-object System.Data.SqlClient.SqlConnection
$connection.ConnectionString=$connectionString

$connection.Open()

$command=$connection.CreateCommand()
$command.CommandText="create table t1(id int identity(1,1), 
name nvarchar(20),
surname nvarchar(50))"                     # create script is here.

$result = $command.ExecuteNonQuery()      # execute query
                                           
$command.Dispose()
$connection.Close()




#### create view sample

$loginName = "test" #sql login name
$pwd="Test123*"     #sql login password

$connectionString="Server=.;Database=test4;User ID=$loginName;Password=$pwd;TrustServerCertificate=False;"

$connection = new-object System.Data.SqlClient.SqlConnection
$connection.ConnectionString=$connectionString

$connection.Open()

$command=$connection.CreateCommand()
$command.CommandText="create view v as
select * from t1"                           # create view script is here

$result = $command.ExecuteNonQuery()      # execute query
                                           
$command.Dispose()
$connection.Close()




#### create stored proc

$loginName = "test" #sql login name
$pwd="Test123*"     #sql login password


$connectionString="Server=.;Database=test4;User ID=$loginName;Password=$pwd;TrustServerCertificate=False;"

$connection = new-object System.Data.SqlClient.SqlConnection
$connection.ConnectionString=$connectionString

$connection.Open()

$command=$connection.CreateCommand()
$command.CommandText="create procedure sp_test(@id integer) as
begin
select * from t1 where id = @id
end"                                           # create sp script is here

$result = $command.ExecuteNonQuery()        # execute query
                                           
$command.Dispose()
$connection.Close()