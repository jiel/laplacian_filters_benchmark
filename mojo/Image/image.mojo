from imgcat import iterm2
from Matrix import Matrix

alias CHR_SPACE = 32
alias CHR_BACKN = 10

struct Image:
    var data: Matrix[DType.float32]

    fn __init__(inout self, path : String) raises:
        with open(path, "r") as f:
            var content = f.read()
            var lines : DynamicVector[String] = content.split('\n')
            var size : DynamicVector[String] = lines[1].split(' ')
            self.data = Matrix[DType.float32](atol(size[1]), atol(size[0]))
            
            for i in range(self.data.height):
                var str_values : DynamicVector[String] = lines[3+i].split(' ')
                for j in range(self.data.width):
                    self.data[i,j] = atol(str_values[j])
    
    fn __init__(inout self, data:Matrix[DType.float32]):
        self.data = data

    fn __str__(borrowed self) -> String:
        var header = "P2\n" + str(self.data.width) + " " + str(self.data.height) + "\n255\n"
        var size : Int = len(header)
        for i in range(self.data.height):
            for j in range(self.data.width):
                if int(self.data[i,j]) < 10 : 
                    size += 1
                elif int(self.data[i,j]) < 100 :
                    size += 2
                else:
                    size += 3
        size += self.data.height * (self.data.width + 1) # for spaces and \n

        var buf = DynamicVector[Int8](capacity=size)
        for i in range(len(header)):
            buf.push_back(ord(header[i]))
        
        for i in range(self.data.height):
            for j in range(self.data.width):
                var s = str(int(self.data[i,j]))
                for k in range(len(s)):
                    buf.push_back(ord(s[k]))
                buf.push_back(CHR_SPACE)
            buf.push_back(CHR_BACKN)
        buf.push_back(0)
        
        return String(buf)

    fn cat(borrowed self):
        iterm2.imgcat(self.__str__(),14)