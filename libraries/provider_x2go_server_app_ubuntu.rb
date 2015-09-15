# Encoding: UTF-8
#
# Cookbook Name:: x2go-server
# Library:: provider_x2go_server_app_ubuntu
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

require 'chef/dsl/include_recipe'
require 'chef/provider/lwrp_base'
require_relative 'provider_x2go_server_app'

class Chef
  class Provider
    class X2goServerApp < LWRPBase
      # A Chef provider for the X2go server packages for Ubuntu.
      #
      # @author Jonathan Hartman <jonathan.hartman@socrata.com>
      class Ubuntu < X2goServerApp
        include Chef::DSL::IncludeRecipe

        provides :x2go_server_app, platform: 'ubuntu' if defined?(provides)

        private

        #
        # Set up the X2go APT repo and install the server packages.
        #
        # (see Chef::Provider::X2goServerApp#install!)
        #
        def install!
          include_recipe 'apt'
          repository(:add) unless new_resource.source
          package(new_resource.source || 'x2goserver')
        end

        #
        # Uninstall the X2go server packages and remove the APT repo.
        #
        # (see Chef::Provider::X2goServerApp#remove!)
        #
        def remove!
          package('x2goserver') { action :remove }
          repository(:remove)
        end

        #
        # Perform an action against the apt_repository resource for X2go.
        #
        # @param do_action [Symbol] the action to perform
        #
        def repository(do_action)
          apt_repository 'x2go' do
            uri 'ppa:x2go/stable'
            distribution node['lsb']['codename']
            action do_action
          end
        end
      end
    end
  end
end
