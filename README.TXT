genDevTarget

DESCRIPTION
===========
Creates a single p2 repository that can be used as a 
development target. It also uses a directory called
extras/ and creates a single feature for all the plugins
in extras/plugins/ and adds that to the final repository.

USAGE
=====

sh genDevTarget.sh /path/to/an/eclipse/install

Note: 
 Any existing feature, plugin, content.jar or artifacts.jar will be delete
 Any existing extras/feature will be removed

