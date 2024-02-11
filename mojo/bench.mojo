from python import Python
from time import now

from Image import Image
from Matrix import Matrix


fn benchmark(func : fn(borrowed Matrix[DType.float32], borrowed Matrix[DType.float32]) -> Matrix[DType.float32], nbpics: Int, iterm2_display: Bool) raises:
    Python.add_to_path(".")
    let utilities : PythonObject = Python.import_module("utilities")
    let picfiles = utilities.listdir("../pictures", ".pgm").split(" ")

    var idx : Int = 0
    var cpt : Int = 0
    var duration : Int = 0
    let kernel = Matrix[DType.float32](3, 3,
                    0, -1, 0, 
                   -1, 4, -1, 
                    0, -1, 0   
    )
    while True:
        let img = Image(picfiles[idx])

        let start = now()
        let res = func(img.data, kernel)
        duration += (now() - start)

        if iterm2_display:
            Image(res).cat()
        
        cpt += 1
        if cpt >= nbpics:
            break
        idx += 1
        if idx >= int(picfiles.__len__()):
            idx = 0

    print("total duration for", nbpics, "pictures :" , int(duration/1_000_000), " ms")
    print("mean duration :", (duration/1_000_000) / nbpics, " ms / picture")
