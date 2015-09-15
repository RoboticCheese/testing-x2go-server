# Encoding: UTF-8
#
# Cookbook Name:: x2go-server
# Library:: provider_x2go_server_app
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
require_relative 'provider_x2go_server_app_ubuntu'

class Chef
  class Provider
    # A Chef provider for the OS-independent pieces of X2go server packages.
    #
    # @author Jonathan Hartman <jonathan.hartman@socrata.com>
    class X2goServerApp < LWRPBase
      use_inline_resources

      #
      # WhyRun is supported by this provider
      #
      # (see Chef::Provider#whyrun_supported?)
      #
      def whyrun_supported?
        true
      end

      #
      # Install the X2go server app.
      #
      action :install do
        install!
      end

      #
      # Uninstall the X2go server app.
      #
      action :remove do
        remove!
      end

      private

      #
      # Do the actual app installation, tailored to the specific platform.
      #
      # @raise [NotImplementedError] if not defined for this provider
      #
      def install!
        fail(NotImplementedError,
             "`install!` method must be implemented for #{self.class} provider")
      end

      #
      # Do the actual app removal, tailored to the specific platform.
      #
      # @raise [NotImplementedError] if not defined for this provider
      #
      def remove!
        fail(NotImplementedError,
             "`remove!` method must be implemented for #{self.class} provider")
      end
    end
  end
end
