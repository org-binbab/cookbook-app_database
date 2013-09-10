#
# Cookbook Name:: app_database_test
# Recipe:: default
#

directory "/tmp/app_database_test" do
  action :create
  owner "root"
  group "root"
  mode 0755
end

include_recipe "app_database_test::mysql"
