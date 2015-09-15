X2go Server Cookbook
====================
[![Cookbook Version](https://img.shields.io/cookbook/v/x2go-server.svg)][cookbook]
[![Build Status](https://img.shields.io/travis/socrata-cookbooks/chef-x2go-server.svg)][travis]
[![Code Climate](https://img.shields.io/codeclimate/github/socrata-cookbooks/chef-x2go-server.svg)][codeclimate]
[![Coverage Status](https://img.shields.io/coveralls/socrata-cookbooks/chef-x2go-server.svg)][coveralls]

[cookbook]: https://supermarket.chef.io/cookbooks/x2go-server
[travis]: https://travis-ci.org/socrata-cookbooks/chef-x2go-server
[codeclimate]: https://codeclimate.com/github/socrata-cookbooks/chef-x2go-server
[coveralls]: https://coveralls.io/r/socrata-cookbooks/chef-x2go-server

A Chef cookbook for the X2go remote desktop server.

Requirements
============

This cookbook currently supports Ubuntu Linux only. Support for additional
platforms is coming.

Usage
=====

Add the default recipe to your run_list or use one or more of the included
resources in a recipe of your own.

Recipes
=======

***default***

Do a simple attribute-based install of the X2go server.

Attributes
==========

***default***

    default['x2go_server']['app']['source']

An optional source URL or file path to install the x2go server package from.

Resources
=========

***x2go_server***

A parent resource for the X2go server components.

Syntax:

    x2go_server 'default' do
        source 'http://example.com/x2go.package'
        action :create
    end

Actions:

| Action    | Description                                      |
|-----------|--------------------------------------------------|
| `:create` | Install X2go server and enable/start the service |
| `:remove` | Stop/disable the X2go service and uninstall it   |

Attributes:

| Attribute | Default    | Description                         |
|-----------|------------|-------------------------------------|
| source    | `nil`      | An optional custom package PATH/URL |
| action    | `:create`  | Action(s) to perform                |

***x2go_server_app***

A resource for installation and removal of the X2go server app package.

Syntax:

    x2go_server_app 'default' do
        source 'http://example.com/x2go.package'
        action :install
    end

Actions:

| Action     | Description                       |
|------------|-----------------------------------|
| `:install` | Install the X2go server package   |
| `:remove`  | Uninstall the X2go server package |

Attributes:

| Attribute | Default    | Description                         |
|-----------|------------|-------------------------------------|
| source    | `nil`      | An optional custom package PATH/URL |
| action    | `:install` | Action(s) to perform                |

***x2go_server_service***

A resource for the X2go server service.

Syntax:

    x2go_server_service 'default' do
        action :restart
    end

Actions:

| Action     | Description         |
|------------|---------------------|
| `:enable`  | Enable the service  |
| `:disable` | Disable the service |
| `:start`   | Start the service   |
| `:stop`    | Stop the service    |
| `:restart` | Restart the service |

Attributes:

| Attribute | Default             | Description          |
|-----------|---------------------|----------------------|
| action    | `[:enable, :start]` | Action(s) to perform |

Providers
=========

***Chef::Provider::X2goServer***

Platform-agnostic provider that wraps each of the X2go server component
resources.

***Chef::Provider::X2goServerApp***

The parent for all platform-specific X2go server app package providers.

***Chef::Provider::X2goServerApp::Ubuntu***

The X2go server app package provider for Ubuntu platforms.

***Chef::Provider::X2goServerService***

The platform-agnostic provider for the X2go server service.

Contributing
============

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add tests for the new feature; ensure they pass (`rake`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

License & Authors
=================
- Author: Jonathan Hartman <jonathan.hartman@socrata.com>

Copyright 2015 Socrata, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
