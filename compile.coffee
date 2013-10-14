#!/usr/bin/env coffee
fs = require 'fs'
eco = require 'eco'
code_runner = require './code_runner'

templates_dir = 'templates'
base_template = 'template.html'
compiled_lectures_dir = 'lectures'

presentations = fs.readdirSync templates_dir
template = fs.readFileSync(base_template).toString()

clear_comments = (text)->
  text.replace /<span data-notes>.+<\/span>/mg, ''

unless fs.existsSync "#{compiled_lectures_dir}/"
  fs.mkdirSync compiled_lectures_dir
  fs.symlinkSync '../reveal.js', "#{compiled_lectures_dir}/reveal.js"

for presentation in presentations
  template_markup = clear_comments fs.readFileSync("#{templates_dir}/#{presentation}").toString()

  rendered_template = eco.render template_markup,
    code_output: code_runner.run_code

  fs.writeFileSync("#{compiled_lectures_dir}/#{presentation}",
                    template.replace("<%= presentation %>", rendered_template))
