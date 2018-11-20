require "../src/crython"

puts Crython.python_version

Crython.embed_python {
  puts Crython.initialized?
  puts LibCrython.none?(LibCrython.none)
}
