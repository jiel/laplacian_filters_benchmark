from python import Python
from Image import Image
from Matrix import Matrix

fn main() raises:
    Python.add_to_path(".")
    let utilities : PythonObject = Python.import_module("utilities")
    let picfiles = utilities.listdir("../pictures", ".pgm").split(" ")

    var idx : Int = 0
    while True:
        print(picfiles[idx])
        let img = Image(picfiles[idx])
        img.cat()
        print()
        idx += 1
        if idx >= 10:
            break
