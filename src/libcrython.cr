# :nodoc:
@[Link(ldflags: "#{__DIR__}/ext/libcrython.a")]
lib LibCrython
  alias PyObject = Void*

  fun incref = py_incref(o : PyObject)
  fun decref = py_decref(o : PyObject)
  fun xincref = py_xincref(o : PyObject)
  fun xdecref = py_xdecref(o : PyObject)
  fun clear = py_clear(o : PyObject)
  fun none? = is_py_none(o : PyObject) : LibC::Int
  fun none = py_none : PyObject
end
