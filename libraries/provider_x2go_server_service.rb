# Encoding: UTF-8
#
# Cookbook Name:: x2go-server
# Library:: provider_x2go_server_service
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

require 'chef/provider/lwrp_base'
require_relative 'resource_x2go_server_service'

class Chef
  class Provider
    # A Chef provider for the X2go server service. This is needed to get the
    # proper provider mapping for Chef's normal service resource--having our
    # service resource subclass Chef::Resource::Service doesn't bring any
    # provider mappings along with it.
    #
    # @author Jonathan Hartman <jonathan.hartman@socrata.com>
    class X2goServerService < LWRPBase
      use_inline_resources

      provides :x2go_server_service if defined?(provides)

      #
      # WhyRun is supported by this provider
      #
      # (see Chef::Provider#whyrun_supported?)
      #
      def whyrun_supported?
        true
      end

      #
      # Iterate over each service action and pass it on to a normal service
      # resource. This has to be done with a temporary service resource because
      # the `allowed_actions` class method didn't exist yet in the version of
      # Chef 11 we need to maintain support for.
      #
      Resource::X2goServerService.new('_', nil).allowed_actions.each do |a|
        define_method("action_#{a}") do
          service(new_resource.service_name) do
            status_command 'ps h -C x2gocleansessions'
            action a
          end
        end
      end
    end
  end
end
