from base64 import b64encode

alias OSC = "\033]"
alias ST = "\a"

fn imgcat(borrowed buf: String, borrowed height: Int):
    print_no_newline(OSC)
    print_no_newline("1337;File=inline=1;size=" + str(len(buf)) + ";height=" + str(height) + ":" )
    print_no_newline(b64encode(buf))
    print(ST)