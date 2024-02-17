from naive import naive
from vectorized import vectorized
from paravectorized import paravectorized
from bench import benchmark


fn main() raises:
    var mean_duration : Float64
    
    mean_duration= benchmark(func=naive, nbpics=100, iterm2_display=False, print_stats=False)
    print("MOJO🔥 : naive implementation          : mean duration on 100 pictures :", mean_duration, " ms / picture")

    mean_duration = benchmark(func=vectorized, nbpics=100, iterm2_display=False, print_stats=False)
    print("MOJO🔥 : vectorized implementation     : mean duration on 100 pictures :", mean_duration, " ms / picture")

    mean_duration = benchmark(func=paravectorized, nbpics=100, iterm2_display=False, print_stats=False)
    print("MOJO🔥 : parallelized (2 workers)      : mean duration on 100 pictures :", mean_duration, " ms / picture")
