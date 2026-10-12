run() {
    local src="$1"

    g++ -Wall -Wextra -Wshadow -DLOCAL "$src.cpp" -o main.out || return 1

    if [ -z "$2" ]; then
        ./main.out
    else
        local input="${src}$2.txt"
        if [ -f "$input" ]; then
            ./main.out < "$input"
        else
            tee "$input" | ./main.out
        fi
    fi

    echo
}

new(){ cp _template.cpp "$1.cpp" && code -r "$1.cpp"; }

