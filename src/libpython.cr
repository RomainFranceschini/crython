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

  fun error_occurred = PyErr_Occurred : PyObject

  fun import_module = PyImport_ImportModule(LibC::Char*) : PyObject

  fun get_attr_string = PyObject_GetAttrString(o : PyObject, attr : LibC::Char*) : PyObject
  fun call_function = PyObject_CallFunctionObjArgs(callable : PyObject, params : PyObject, ...)

  fun callable? = PyCallable_Check(o : PyObject) : LibC::Int

  fun build_value = Py_BuildValue(format : LibC::Char*, ...) : PyObject
end
