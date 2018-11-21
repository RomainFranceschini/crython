module Crython
  struct PyList
    include ObjectProtocol
    include Indexable(Crython::PyObject)

    def initialize(size : Int32 = 0)
      @raw = LibPython.list_new(size)
    end

    def initialize(@raw : LibPython::PyObject)
    end

    def size : Int32
      LibPython.list_size(@raw)
    end

    def unsafe_fetch(index : Int)
      PyObject.new(LibPython.list_get(@raw, index))
    end

    def []=(index : Int32, value : T) forall T
      {% if T < ObjectProtocol %}
        # Support python objects
      {% elsif T.union? && T.union_types.all? { |t| t < ObjectProtocol } %}
        # Support unions of python objects
      {% else %}
        {{ raise "Can only support Python wrappers types" }}
      {% end %}

      LibPython.list_set(@raw, index, value)
    end
  end
end
