# Issue Suppress Jruby Error input plugin for Embulk

TODO: Write short description here and embulk-input-issue_suppress_jruby_error.gemspec file.

## Overview

* **Plugin type**: input
* **Resume supported**: yes
* **Cleanup supported**: yes
* **Guess supported**: no

## Configuration

- **option1**: description (integer, required)
- **option2**: description (string, default: `"myvalue"`)
- **option3**: description (string, default: `null`)

## Example

```yaml
in:
  type: issue_suppress_jruby_error
  option1: example1
  option2: example2
```


## Build

```
$ rake
```
