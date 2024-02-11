from memory import memset_zero

struct Matrix[dtype: DType]:
    var height: Int
    var width: Int
    var _data: DTypePointer[dtype]

    fn __init__(inout self, height: Int, width: Int):
        self.height = height
        self.width = width
        self._data = DTypePointer[dtype].alloc(height * width)
        memset_zero(self._data, height * width)

    fn __init__(inout self, height: Int, width: Int, data: DTypePointer[dtype]):
        self.height = height
        self.width = width
        self._data = data

    fn __init__(inout self, height: Int, width: Int, *data: SIMD[dtype,1]):
        self = Self(height,width)
        for i in range(len(data)):
            self._data.store(i, data[i])

    fn __setitem__(self, x: Int, y: Int, value: SIMD[dtype,1]):
        self._data.simd_store[1](x * self.width + y, value)

    fn __getitem__(self, x: Int, y: Int) -> SIMD[dtype,1]:
        return self._data.simd_load[1](x * self.width + y)

    fn __copyinit__(inout self, other: Self):
        self._data = other._data
        self.height = other.height
        self.width = other.width