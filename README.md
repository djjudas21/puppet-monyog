# monyog

#### Table of Contents

1. [Overview](#overview)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module installs MONyog from a local package and gives it a base config to allow
it to start up. You will then need to configure it via the web GUI.

Download the [MONyog package](https://www.webyog.com/product/monyog) from their website
and place the package somewhere where it can be accessed - usually in a local package
repo. Specify the path in the `package` parameter.

A one-maybe-two sentence summary of what the module does/what problem it solves.
This is your 30 second elevator pitch for your module. Consider including
OS/Puppet version it works with.

## Usage

This class accepts several parameters, shown here with their default values.

```
class { 'monyog': {
  package  => 'http://repo.example.com/MONyog-6.5.4-0.x86_64.rpm',
  basedir  => '/usr/local/MONyog',
  inifile  => "${basedir}/MONyog.ini",
  port     => 5555,
  firewall => false,
}
```

### `package`

Path to the MONyog package. You must download this from MONyog yourself and place it in
a location where it can be accessed. Acceptable locations are
[documented](https://docs.puppet.com/puppet/latest/reference/type.html#package-attribute-source).

### `basedir`

Base install path of the RPM. Setting this parameter does **not** change where the RPM
is installed - it must be set to point where the RPM installs. By default this is
`/usr/local/MONyog` and you shouldn't need to set it unless you've rolled your own
RPM.

### `inifile`

Default location of `MONyog.ini`. By default this is in `/usr/local/MONyog` and
you shouldn't need to set it unless you've rolled your own RPM.

### `port`

TCP port that MONyog listens on. By default this is `5555` but you may prefer to set
it to the standard web port `80`.

### `firewall`

Whether to manage the firewall rule using `puppetlabs/firewall`. Defaults to `false`
so we don't accidentally clobber existing firewall config.


## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

The initial version of this module only supports systems which use the RPM package
manager - i.e. Red Hat and compatible systems. Debian support is on the roadmap.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
