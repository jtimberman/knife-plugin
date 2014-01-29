# Knife::Plugin

Welcome to the knife plugin... plugin. This is a plugin for Chef's
`knife` utility that is intended to aid in working with knife plugins.

## Requirements

This plugin should work in any Ruby environment where Chef itself
works. If it does not, please file an issue.

Reasonable effort is made to ensure compatibility with Ruby 1.8.7, but
as that version is EOL, so I can't make any guarantees.

It is against the design goals of this plugin to have external Ruby
dependencies beyond the Ruby Standard Library.

## Installation

Install this plugin in the same Ruby environment as Chef and Knife.
That is, use the `gem` binary that was used to install Chef. This may
be different than the "system" `gem` binary. For example, on OS X with
the Chef omnibus package:

    $ /opt/chef/embedded/bin/gem install knife-plugin

Ironically, this plugin includes an `install` sub-command for doing
just that.

## Usage

This plugin provides sub-commands starting with `knife plugin`.

### create

The `create` sub-command generates a plugin scaffolding in
`$HOME/.chef/plugins/knife`. It is intended to be very simple to get
the minimal amount of scaffolding created for a new plugin. It is not
in the scope of this sub-command to create a full Ruby project that
could be distributed as a RubyGem. My assumption is someone who needs
that functionality will know about `bundle gem` or similar generators.

To create a new plugin:

    knife plugin create wheels

This will create `$HOME/.chef/plugins/knife/wheels.rb`.

### install

The `install` plugin will install another knife plugin packaged as a
RubyGem, and available from the configured source(s) (usually
rubygems.org) into the same Ruby environment where `knife` itself is.

    knife plugin install knife-config
    knife plugin install knife-ec2

Depending on the configuration of the local machine, administrative
privileges may be required, e.g. `sudo`.

## Contributing

For ideas on contributions, see the __Bugs__ list below, or check the
issue tracker on this repository.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

I'd prefer to keep the scope of this plugin fairly narrow, so it is
small and uncomplicated. New features (additional commands) will be
considered but I may encourage new, separate pugins be created
instead.

## Bugs

There are no tests.

The directory `create` plugin generates new plugins in is hardcoded.
It should be configurable, or autodetect.

The `create` plugin may benefit from better methods to make snake case
or camelcase strings as long as they do not introduce additional
dependencies outside of Ruby stdlib. See
[#Requirements](#Requirements).

The `install` plugin takes only the first argument to the plugin (the
name of the RubyGem to install) and discards the rest. Since this is
passed into the `gem` command, it shouldn't silently drop additional
arguments.

The `create` plugin uses a heredoc for the scaffolding. This should
probably be an erb template instead.

## License and Author

- Author: Joshua Timberman (<joshua@getchef.com>)
- Copyright (c) 2014, Chef Software, Inc. (<legal@getchef.com>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
