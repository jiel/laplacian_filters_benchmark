from python import Python
from time import now

from Image import Image
from Matrix import Matrix


fn benchmark(func : fn(borrowed Matrix[DType.float32], borrowed Matrix[DType.float32]) -> Matrix[DType.float32], nbpics: Int, iterm2_display: Bool, print_stats: Bool = True) raises -> Float64 :
    Python.add_to_path(".")
    var utilities : PythonObject = Python.import_module("utilities")
    var picfiles = utilities.listdir("../pictures", ".pgm").split(" ")

    var idx : Int = 0
    var cpt : Int = 0
    var duration : Int = 0
    var kernel = Matrix[DType.float32](3, 3,
                    0, -1, 0, 
                   -1, 4, -1, 
                    0, -1, 0   
    )
    while True:
        var img = Image(picfiles[idx])

        var start = now()
        var res = func(img.data, kernel)
        duration += (now() - start)

        if iterm2_display:
            Image(res).cat()
        else:
            # uses the result to prevent optimizations from squishing the code path
            with open("/tmp/out.pgm", "w") as out:
                out.write(Image(res).__str__())
        
        cpt += 1
        if cpt >= nbpics:
            break
        idx += 1
        if idx >= int(picfiles.__len__()):
            idx = 0

    if print_stats:
        print("total duration for", nbpics, "pictures :" , int(duration/1_000_000), " ms")
        print("mean duration :", (duration/1_000_000) / nbpics, " ms / picture")

    return (duration/1_000_000) / nbpics
