#ifdef __APPLE__
    #include <AvailabilityMacros.h>
    #if MAC_OS_X_VERSION_MAX_ALLOWED < 101300
        #include <Python/Python.h>
    #else
        #include <Python2.7/Python.h>
    #endif
#else
    #include <python2.7/Python.h>
#endif

/* Expose reference counting macros */

extern void py_incref(PyObject *o) {
  Py_INCREF(o);
}

extern void py_xincref(PyObject *o) {
  Py_XINCREF(o);
}

extern void py_decref(PyObject *o) {
  Py_DECREF(o);
}

extern void py_xdecref(PyObject *o) {
  Py_XDECREF(o);
}

extern void py_clear(PyObject *o) {
  Py_CLEAR(o);
}

/* End reference counting macros */

extern PyObject* py_none() {
  return Py_None;
}

extern PyObject *load_module(char *module_name) {
  PyObject *pName, *pModule;

  pName = PyString_FromString(module_name);
  /* Error checking of pName left out */

  pModule = PyImport_Import(pName);
  Py_DECREF(pName);

  return pModule;
}

extern size_t list_item_count(PyObject *list) {
  return PyList_Size(list);
}

extern PyObject *instantiate_python_class(PyObject *class) {
  return PyObject_CallFunctionObjArgs(class, NULL);
}

extern PyObject *get_name(PyObject *pObject) {
  PyObject *pFunc, *pValue = NULL;

  pFunc = PyObject_GetAttrString(pObject, "name");
  if (pFunc != NULL) {
    pValue = PyObject_CallFunctionObjArgs(pFunc, NULL);
    Py_DECREF(pFunc);
  }

  return pValue;
}

extern long key_hash(PyObject *key)
{
  return PyObject_Hash(key);
}

extern int key_eq(PyObject *key, PyObject* other)
{
  return PyObject_RichCompareBool(key, other, Py_EQ);
}

extern int py_bool_check(PyObject *b)
{
  return PyBool_Check(b);
}

extern int is_py_none(PyObject *o)
{
  return o == Py_None;
}

extern int py_list_check(PyObject *l)
{
  return PyList_Check(l);
}
