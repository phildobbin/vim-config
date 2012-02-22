" Use <leader>m to cycle through your marks in alphabetic order, and use
" <leader>M to cycle through your marks in reverse alphabetic order.
"
" Bindings can be changed here:
nmap <silent> <leader>m :python next_mark(forward=True)<CR>
nmap <silent> <leader>M :python next_mark(forward=False)<CR>

python << EOF
import string
import vim

# cycles through all alphabetic marks
marks = string.lowercase + string.uppercase
next_index = -1
found_any = False


def next_mark(forward=True, call_count=0):
    if forward:
        advance_index(1)
    else:
        advance_index(-1)
    global found_any
    mark_loc = vim.current.buffer.mark(marks[next_index])
    if call_count == len(marks) and not found_any and not mark_loc:
        print "No marks set"
        return
    elif call_count == len(marks):
        found_any = False

    if mark_loc is None:
        next_mark(forward=forward, call_count=call_count+1)
    else:
        found_any = True
        print "Mark:", marks[next_index]
        vim.current.window.cursor = mark_loc

def advance_index(step):
    global next_index
    if 0 <= next_index + step < len(marks):
        next_index += step
    elif next_index + step < 0:
        next_index = len(marks) - 1
    else:
        next_index = -1
EOF

