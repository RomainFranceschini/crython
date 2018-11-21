module Crython
  # Initialize a Python interpreter.
  def self.init
    unless Crython.initialized?
      LibPython.init
    end
  end

  # Whether the Python interpreter has been initialized.
  def self.initialized? : Bool
    LibPython.initialized? != 0
  end

  # Finalize embedded Python interpreter.
  def self.finalize
    if Crython.initialized?
      LibPython.finalize
    end
  end

  def self.embed_python
    LibPython.init
    yield
    LibPython.finalize
  end

  def self.python_version : String
    String.new(LibPython.version)
  end

  def self.python_build_info : String
    String.new(LibPython.build_info)
  end

  def self.python_compiler : String
    String.new(LibPython.compiler)
  end
end
