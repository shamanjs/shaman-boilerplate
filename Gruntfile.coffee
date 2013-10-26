grunt = require 'grunt'

explode = (cwd, files) ->
  files = [files] unless Array.isArray files
  return ("#{cwd}/#{f}" for f in files)

gruntConfig =
  pkg: grunt.file.readJSON('package.json')

## TODO:
# pass gruntConfig through build steps 
# and decorate 

## watch

#toWatch = ["coffee","jaded","copy"]

for cat in toWatch
  for set, files of gruntConfig[cat]
    continue if set is 'options'
    if files.cwd
      fls = explode files.cwd, files.src
    else
      fls = files.src
    gruntConfig.watch["#{set}-#{cat}"] =
      files: fls
      tasks: ["#{cat}:#{set}","reload"]

module.exports = (grunt) ->
  ## init config 
  grunt.initConfig gruntConfig

  # TODO:
  # loadNpmTasks that begin with grunt- from package
  # grunt.loadNpmTasks "grunt-contrib-copy"

  ## TODO: register all tasks in config
  ## default 
  grunt.registerTask "default", []

  ## start
  grunt.registerTask "start", "start app", ->
    grunt.log.writeln "Starting server..."
    server = require "./app/start"