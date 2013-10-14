vm = require 'vm'

contexts = {}

run_code = (context_name, code) ->
    contexts[context_name] or= vm.createContext()
    context = contexts[context_name]
    evaluated = vm.runInContext code, context
    "#{code} #{if evaluated then "//#{JSON.stringify evaluated}" else ''}"

module.exports =
  run_code: run_code,
  contexts: contexts
