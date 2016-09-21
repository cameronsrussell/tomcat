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
