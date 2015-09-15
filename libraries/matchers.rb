# Encoding: UTF-8
#
# Cookbook Name:: x2go-server
# Library:: matchers
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

if defined?(ChefSpec)
  [:x2go_server, :x2go_server_app].each do |m|
    ChefSpec.define_matcher(m)
  end

  [:create, :remove].each do |a|
    define_method("#{a}_x2go_server") do |name|
      ChefSpec::Matchers::ResourceMatcher.new(:x2go_server, a, name)
    end
  end

  [:install, :remove].each do |a|
    define_method("#{a}_x2go_server_app") do |name|
      ChefSpec::Matchers::ResourceMatcher.new(:x2go_server_app, a, name)
    end
  end
end
