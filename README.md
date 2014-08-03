Description
===========
Installs and configures the lighttpd webserver [`http://www.lighttpd.net`](http://www.lighttpd.net), a light, fast webserver.

Requirements
============
Currently only tested on Ubuntu.

Attributes
==========
None. Uses default lighttpd config by Ubuntu. Provide your own config if you want to.

Usage
=====
Include `recipe[lighttpd]` in your runlist to install lighttpd. To configure and enable virtual hosts, use the `lighttpd_vhost` and `lighttpd_site` definitions by including the recipe in your cookbook. The `lighttpd_vhost` definition will create and configure a virtual host configuration, and `lighttpd_site` will enable it. `lighttpd_vhost` uses a very sparse configuration by default, so you will want to extend it if you want more than an extremely simple virtual host. Just pass in whatever settings you want in the vhost config as params when you call the lighttpd_vhost definition. lighttpd_vhost was adapted from apache2's web_app definition, while lighttpd_site was adapted from apache_site. They work very similarly to those.

Usually, you will not need to call `lighttpd_site` directly - just pass in `enable` as a param when you call `lighttpd_vhost`, and that will call lighttpd_site for you. However, it's available if you need to call it directly.

You can istall other modules with the lighttpd_module resource.

CONTRIBUTING
============

Want to make a contribution to chef-lighttpd? Great. Issues can be submitted on 
the chef-lighttpd github issue tracker. If you have code to submit, fork the
repo, make your change, and submit a pull request. Contributions are welcome and
very appreciated.

LICENSE
=======

Original Author:: Jeremy Bingham (<jeremy@dailykos.com>)
Change:: Pieter de Bie <pieter@frim.nl>
Copyright:: 2011-2013, Kos Media, LLC & others

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
