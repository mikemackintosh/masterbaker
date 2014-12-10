# Masterbaker

Masterbaker spawned from the [Soloist](https://github.com/mkocher/soloist) project, and lets you quickly and easily converge [Chef](http://opscode.com/chef) recipes using [chef-solo](http://wiki.opscode.com/display/chef/Chef+Solo).  It does not require a Chef server, but can exploit [community cookbooks](http://community.opscode.com/cookbooks), github-hosted cookbooks and locally-sourced cookbooks through [Librarian](https://github.com/applicationsonline/librarian).

Masterbaker was designed with users in mind, allowing a global runlist as well as user-specific.

Lazy Installation
-------------
    
    curl https://raw.githubusercontent.com/mikemackintosh/masterbaker/master/kthx.sh | sh

Using Masterbaker
-------------

1. First, agree to XCode License:

        $sudo xcodebuild -license

2. You'll need to have Masterbaker installed:

        $ gem install masterbaker

3. You'll need a `Cheffile` in your home directory that points Librarian to all the cookbooks you've included:

        $ cat ~/.bakery/Cheffile // or ~/.masterbaker/masterbakerrc
        site "http://community.opscode.com/api/v1"
        cookbook "pivotal_workstation",
                 :git => "https://github.com/pivotal/pivotal_workstation"

4. You'll need to create a `~/.bakery/bakeryrc` or `~/.masterbaker/masterbakerrc` file in your home directory to tell Chef which recipes to converge:

        $ cat /Users/pivotal/.bakery/bakeryrc
        recipes:
          - pivotal_workstation::default
          - pivotal_workstation::sublime_text

5. It's always a good idea to see what is found and will be installed on next run using `config`:

        $ bake config


6. You'll need to run `masterbaker` for anything to happen:

        $ bake


Examples
--------

##### Running a set of recipes

Here's an example of a `~/.bakery/bakeryrc` or `~/.masterbaker/masterbakerrc`:

    cookbook_paths:
      - /opt/beans
    recipes:
      - beans::chili
      - beans::food_fight
      - napkins

This tells Masterbaker to search in both `/opt/beans` and `./cookbooks` (relative to the `~/.bakery` or `~/.masterbaker` directories) for cookbooks to run.  Then, it attempts to converge the `beans::chili`, `beans::food_fight` and `napkins` recipes.


##### Setting node attributes

Masterbaker lets you override node attributes.  Let's say we've got a `bash::prompt` recipe for which  we want to set `node['bash']['prompt']['color']='p!nk'`.  No problem!

    recipes:
      - bash::prompt
    node_attributes:
      bash:
        prompt:
          color: p!nk


##### Conditionally modifying Masterbaker

Masterbaker allows conditionally switching on environment variables.  Let's say we only want to include the `embarrassment::parental` recipe when the `MEGA_PRODUCTION` environment variable is set to `juggalos`.  Here's the `~/.bakery/bakeryrc` or `~/.masterbaker/masterbakerrc`:

    cookbook_paths:f
      - /fresno
    recipes:
      - disaster
    env_variable_switches:
      MEGA_PRODUCTION:
        juggalos:
          recipes:
            - embarrassment::parental

So now, this is the result of our Masterbaker run:

    $ MEGA_PRODUCTION=juggalos bake
    Installing disaster (1.0.0)
    Installing embarrassment (1.0.0)
    … chef output …
    INFO: Run List expands to [disaster, embarrassment::parental, faygo]
    … chef output …

If we set `MEGA_PRODUCTION=godspeed`, the `embarrassment::parental` recipe is not converged.


##### Running one-off recipes

Masterbaker can also run one-off recipes:

    $ bake run_recipe lice::box
    Installing lice (1.0.0)
    … chef output …
    INFO: Run List expands to [lice::box]
    … chef output …

This just runs the `lice::box` recipe from your current set of cookbooks.  It still uses all the `node_attributes` and `env_variable_switches` logic.


##### Chef logging

Masterbaker runs `chef-solo` at log level `info` by default, which is helpful when you need to see what your Chef run is doing.  If you need more information, you can set the `LOG_LEVEL` environment variable:

    $ LOG_LEVEL=debug bake
    
The default log level is `FATAL` to prevent undesireable output.


License
=======

See LICENSE for details.
