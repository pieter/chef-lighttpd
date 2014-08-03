#
# Cookbook Name: lighttpd
# Definition: lighttpd_vhost
# Copyright 2011-2013, Kos Media LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Adapted from web_app in apache2 recipe

define :lighttpd_vhost, :template => "lighttpd_vhost.conf.erb", :enable => true, :dir_listing => false do
  name = params[:name]
	vhost_name = params[:server_name] || params[:name]
	Chef::Log.warn("Name: #{vhost_name}")
	enabled = params[:enable]
	include_recipe "lighttpd"

	template "#{node[:lighttpd][:dir]}/sites-available/#{name}.conf" do
		source params[:template]
		if params[:template] == "lighttpd_vhost.conf.erb"
		  cookbook 'lighttpd'
	  end

		owner "root"
		group "root"
		mode 0644
		if params[:cookbook]
			cookbook params[:cookbook]
		end
		variables(
			:vhost_name => vhost_name,
			:params => params
		)
		if File.exists?("#{node[:lighttpd][:dir]}/sites-enabled/#{name}.conf")
			notifies :restart, resources(:service => "lighttpd"), :delayed
		end
	end

	lighttpd_site "#{name}.conf" do
		server_name name
		enable enabled
	end

end
