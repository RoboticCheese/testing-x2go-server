# Encoding: UTF-8
#
# Cookbook Name:: x2go-server
# Library:: resource_x2go_server_service
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

require 'chef/resource/service'

class Chef
  class Resource
    # A Chef resource for the X2go server service.
    #
    # @author Jonathan Hartman <jonathan.hartman@socrata.com>
    class X2goServerService < Service
      #
      # Override the constructor to set the resource_name and default actions.
      # Normally, we'd use the `default_action` and `resource_name` class
      # methods for this, but they don't exist in the Chef::Resource class for
      # the version of Chef 11 we currently need to maintain support for.
      #
      # (see Chef::Resource::Service#initialize)
      #
      def initialize(_name, _run_context = nil)
        super
        @action = [:enable, :start]
        @resource_name = :x2go_server_service
      end

      #
      # Override service_name to always return 'x2goserver' regardless of the
      # name of this resource.
      #
      # (see Chef::Resource::Service#service_name)
      #
      def service_name(_arg = nil)
        'x2goserver'
      end
    end
  end
end
