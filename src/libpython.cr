@[Link(ldflags: "-L/usr/local/opt/python@2/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config -lpython2.7 -ldl -framework CoreFoundation")]
lib LibPython
  alias PyObject = Void*

  fun init = Py_Initialize
  fun init_ex = Py_InitializeEx(initsigs : LibC::Int)
  fun initialized? = Py_IsInitialized : LibC::Int
  fun finalize = Py_Finalize
  fun finalize_ex = Py_FinalizeEx : LibC::Int

  fun version = Py_GetVersion : LibC::Char*
  fun compiler = Py_GetCompiler : LibC::Char*
  fun build_info = Py_GetBuildInfo : LibC::Char*

  fun error_clear = PyErr_Clear
  fun error_occurred = PyErr_Occurred : PyObject
  fun error_print = PyErr_print

  fun import_module = PyImport_ImportModule(LibC::Char*) : PyObject

  fun has_attr_string = PyObject_HasAttrString(o : PyObject, attr : PyObject) : LibC::Int
  fun get_attr_string = PyObject_GetAttrString(o : PyObject, attr : LibC::Char*) : PyObject
  fun call_function = PyObject_CallFunctionObjArgs(callable : PyObject, params : PyObject, ...)

  fun callable? = PyCallable_Check(o : PyObject) : LibC::Int

  fun build_value = Py_BuildValue(format : LibC::Char*, ...) : PyObject

  fun string_size = PyString_Size(o : PyObject) : LibC::Int
  fun string_as_cstring = PyString_AsString(str : PyObject) : LibC::Char*
  fun string_from_cstring = PyString_FromStringAndSize(str : LibC::Char*, size : LibC::Int)

  fun list_new = PyList_New(size : LibC::Int) : PyObject
  fun list_size = PyList_Size(list : PyObject) : LibC::Int
  fun list_get = PyList_GetItem(list : PyObject, i : LibC::Int) : PyObject
  fun list_set = PyList_SetItem(list : PyObject, i : LibC::Int, val : PyObject)

  fun tuple_get = PyTuple_GetItem(t : PyObject, i : LibC::Int) : PyObject

  fun int_as_long = PyInt_AsLong(i : PyObject) : LibC::Long
end
