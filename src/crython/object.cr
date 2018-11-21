module Crython
  private module ObjectProtocol
    def none?
      LibCrython.none?(@raw) != 0
    end

    def callable? : Bool
      LibPython.obj_callable?(@raw) != 0
    end

    def has_attr?(attr : String) : Bool
      LibPython.obj_has_attr_string(@raw, attr.to_unsafe) != 0
    end

    def get_attr(attr : String) : PyObject
      PyObject.new(LibPython.obj_get_attr_string(@raw, attr.to_unsafe))
    end

    def set_attr(attr : String, obj : ObjectMethods)
      if LibPython.obj_set_attr_string(@raw, attr.to_unsafe, obj.to_unsafe) == 0
        # TODO: handle exception
      end
    end

    def del_attr(attr : String) : Bool
      LibPython.obj_del_attr_string(@raw, attr.to_unsafe) != 0
    end

    def <=>(other : ObjectProtocol)
      if LibPython.obj_cmp(@raw, other.to_unsafe, out cmp) >= 0
        cmp
      else
        # TODO: handle exception
      end
    end

    def to_unsafe
      @raw
    end
  end

  struct PyObject
    include ObjectProtocol

    def initialize(@raw : LibPython::PyObject)
    end
  end
end
