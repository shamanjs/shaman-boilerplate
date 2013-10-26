path = require 'path'

module.exports = (clone, src, dest, sandbox, next) ->

  {jslang} = sandbox

  if jslang is "coffee"
    
    src = path.join src, "coffee"
    clone src, dest, sandbox, next

  else
    console.log "js"