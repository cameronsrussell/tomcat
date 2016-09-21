#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'java-1.7.0-openjdk-devel'
package 'httpd'
package 'wget'

group 'chef' do
	action :create
end

user 'chef' do
	action :create
	group 'chef'
end 

group 'tomcat' do
	action :create
end

user 'tomcat' do
	manage_home false
	shell '/bin/nologin'
	group 'tomcat'
	home '/opt/tomcat'
end

remote_file '/tmp/apache-tomcat-8.0.37.tar.gz' do
	source 'http://apache.spinellicreations.com/tomcat/tomcat-8/v8.0.37/bin/apache-tomcat-8.0.37.tar.gz'
end

directory '/opt/tomcat' do
	action :create 
	recursive true
end

execute 'extract_tomcat' do
	command 'tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'
	cwd '/tmp'
end



