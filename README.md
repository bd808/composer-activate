Composer-Activate
=================

[Composer][] allows packages to provide command line scripts called "vendor
binaries" to pass along to a user who installs the package. By default these
scripts are available in the `vendor/bin` directory.

Composer-Activate provides a script that will add the `vendor/bin` directory
to your shell's `PATH` so that you can call other vendor binary scripts
without the awkward `vendor/bin/` prefix.

Installation
------------
Composer-Activate is available on Packagist ([bd808/composer-activate][]) and
is installable via [Composer][].

    {
      "require": {
        "bd808/composer-activate": "dev-master"
      }
    }


Usage
-----
After installing composer-activate, source `vendor/bin/composer_activate.bash`
in your shell:

    $ . vendor/bin/composer_activate.bash

To deactivate:

    $ composer_deactivate

---
[bd808/composer-activate]: https://packagist.org/packages/bd808/composer-activate
[Composer]: http://getcomposer.org
