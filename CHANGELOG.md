## 0.3.3 (unreleased)


## 0.3.2 (August 15, 2012)

### Bug fixes

* Fix home_dir Pathname coersion to String in Ruby 1.9.x. ([@fnichol][])


## 0.3.0 (August 15, 2012)

### Breaking changes

* Rename data_bag attribute to data_bag_name. ([@fnichol][])

### Bug fixes

* homesick_castle LWRP now notifies when updated (FC017). ([@fnichol][])
* Fix permission error if Chef is run by root user. ([@fnichol][])

### New features

* Add user_array_node_attr attribute. ([@fnichol][])

### Improvements

* Add TravisCI to run Foodcritic linter. ([@fnichol][])
* Reorganize README with section links. ([@fnichol][])
* Remove resource duplication in castle provider (FC005). ([@fnichol][])


## 0.2.2 (September 25, 2011)

### Improvements

* Add installation instructions to README. ([@fnichol][])
* homesick gem is no longer installed during compile phase. ([@fnichol][])


## 0.2.0 (August 15, 2011)

The initial release.

[@fnichol]: https://github.com/fnichol
