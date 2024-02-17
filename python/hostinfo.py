import subprocess
import platform
import multiprocessing

# This code has been stolen from https://github.com/manatlan/sudoku_resolver/ (Thanks ;-))

def get_info_host() -> str:
    s=f"PLATFORM : {platform.processor()}/{platform.platform()} with {multiprocessing.cpu_count()} cpus"
    try:
        cp=subprocess.run(["cat","/proc/cpuinfo"],text=True,capture_output=True)
        if cp.returncode==0:
            d=todict(cp.stdout)
            s+=f"""\nCPUINFO  : {d['vendor_id']} "{d['model name']}" ({d['bogomips']} bogomips)"""
        cp=subprocess.run(["cat","/proc/meminfo"],text=True,capture_output=True)
        if cp.returncode==0:
            d=todict(cp.stdout)
            s+=f"""\nMEMINFO  : {d['MemTotal']}"""
    except:
        s+="(can't get more info from host)"
    return s


if __name__ == "__main__":
    print(get_info_host())
