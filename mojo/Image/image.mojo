from imgcat import iterm2
from Matrix import Matrix

alias CHR_SPACE = 32
alias CHR_BACKN = 10

struct Image:
    var _data: Matrix[DType.float32]

    fn __init__(inout self, path : String) raises:
        with open(path, "r") as f:
            let content = f.read()
            let lines : DynamicVector[String] = content.split('\n')
            let size : DynamicVector[String] = lines[1].split(' ')
            self._data = Matrix[DType.float32](atol(size[1]), atol(size[0]))
            
            for i in range(self._data.height):
                let str_values : DynamicVector[String] = lines[3+i].split(' ')
                for j in range(self._data.width):
                    self._data[i,j] = atol(str_values[j])
    
    fn __str__(borrowed self) -> String:
        let header = "P2\n" + str(self._data.width) + " " + str(self._data.height) + "\n255\n"
        var size : Int = len(header)
        for i in range(self._data.height):
            for j in range(self._data.width):
                if int(self._data[i,j]) < 10 : 
                    size += 1
                elif int(self._data[i,j]) < 100 :
                    size += 2
                else:
                    size += 3
        size += self._data.height * (self._data.width + 1) # for spaces and \n

        var buf = DynamicVector[Int8](size)
        for i in range(len(header)):
            buf.push_back(ord(header[i]))
        
        for i in range(self._data.height):
            for j in range(self._data.width):
                let s = str(int(self._data[i,j]))
                for k in range(len(s)):
                    buf.push_back(ord(s[k]))
                buf.push_back(CHR_SPACE)
            buf.push_back(CHR_BACKN)
        buf.push_back(0)
        
        return String(buf)

    fn cat(borrowed self):
        iterm2.imgcat(self.__str__(),14)