@[Link("python")]
lib LibPython
  alias PyObject = Void*
  alias Int = LibC::Int
  alias Long = LibC::Long
  alias Char = LibC::Char

  fun init = Py_Initialize
  fun init_ex = Py_InitializeEx(initsigs : Int)
  fun initialized? = Py_IsInitialized : Int
  fun finalize = Py_Finalize
  fun finalize_ex = Py_FinalizeEx : Int

  fun version = Py_GetVersion : Char*
  fun compiler = Py_GetCompiler : Char*
  fun build_info = Py_GetBuildInfo : Char*

  fun error_clear = PyErr_Clear
  fun error_occurred = PyErr_Occurred : PyObject
  fun error_print = PyErr_print

  fun import_module = PyImport_ImportModule(Char*) : PyObject

  fun obj_has_attr_string = PyObject_HasAttrString(o : PyObject, attr : Char*) : Int
  fun obj_get_attr_string = PyObject_GetAttrString(o : PyObject, attr : Char*) : PyObject
  fun obj_set_attr_string = PyObject_SetAttrString(o : PyObject, attr : Char*, val : PyObject) : Int
  fun obj_del_attr_string = PyObject_DelAttrString(o : PyObject, attr : Char*) : Int
  fun obj_call_function = PyObject_CallFunctionObjArgs(callable : PyObject, params : PyObject, ...)
  fun obj_print = PyObject_Print(o : PyObject, fd : Int, flags : Int) : Int
  fun obj_callable? = PyCallable_Check(o : PyObject) : Int
  fun obj_cmp = PyObject_Cmp(a : PyObject, b : PyObject, res : Int*) : Int

  fun build_value = Py_BuildValue(format : Char*, ...) : PyObject

  fun string_size = PyString_Size(o : PyObject) : Int
  fun string_as_cstring = PyString_AsString(str : PyObject) : Char*
  fun string_from_cstring = PyString_FromStringAndSize(str : Char*, size : Int)

  fun list_new = PyList_New(size : Int) : PyObject
  fun list_size = PyList_Size(list : PyObject) : Int
  fun list_get = PyList_GetItem(list : PyObject, i : Int) : PyObject
  fun list_set = PyList_SetItem(list : PyObject, i : Int, val : PyObject)

  fun tuple_get = PyTuple_GetItem(t : PyObject, i : Int) : PyObject

  fun int_as_long = PyInt_AsLong(i : PyObject) : Long
end
