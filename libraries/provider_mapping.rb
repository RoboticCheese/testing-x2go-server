# Encoding: UTF-8
#
# Cookbook Name:: x2go-server
# Library:: provider_mapping
#
# Copyright 2014-2015 Jonathan Hartman
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

require 'chef/version'
require 'chef/platform/provider_mapping'
require_relative 'provider_x2go_server'
require_relative 'provider_x2go_server_app_ubuntu'
require_relative 'provider_x2go_server_service'

if Gem::Version.new(Chef::VERSION) < Gem::Version.new('12')
  Chef::Platform.set(resource: :x2go_server,
                     provider: Chef::Provider::X2goServer)
  Chef::Platform.set(resource: :x2go_server_app,
                     platform: :ubuntu,
                     provider: Chef::Provider::X2goServerApp::Ubuntu)
  Chef::Platform.set(resource: :x2go_server_service,
                     provider: Chef::Provider::X2goServerService)
end
