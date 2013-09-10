#
# Cookbook Name:: app_database_test
# Recipe:: mysql
#

db = app_database "mysql_test_partA" do
  action [ :configure, :migrate ]
  basepath "/tmp/app_database_test/mysql_test"
  owner "nobody"
  uri "mysql://localhost/test"
  username "root"
  password "vagrant"
end

db = app_database "mysql_test_partB" do
  action [ :migrate, :migrate, :backup ]
  basepath "/tmp/app_database_test/mysql_test"
  owner "nobody"
  uri "mysql://localhost/test"
  username "root"
  password "vagrant"
  schema_version '1.0'
end
