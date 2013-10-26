module.exports = (clone, src, dest, sandbox) ->

  {jslang} = sandbox

  if jslang is "coffee"
    console.log "coffee"
    console.log clone, src, dest, sandbox
    #clone coffeedir, dest, sandbox
  else
    console.log "js"