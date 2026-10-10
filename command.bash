run() {
    local src="$1"

    g++ -Wall -Wextra -Wshadow -DLOCAL "$src.cpp" -o main.out || return 1

    if [ -z "$2" ]; then
        ./main.out                 # no test number: type input, nothing saved
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
