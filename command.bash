run() {
    local src="$1"
    local test="${2:-1}"
    local input="${src}${test}.txt"

    g++ -Wall -Wextra -Wshadow "$src.cpp" -o main.out || return 1

    if [ -f "$input" ]; then
        ./main.out < "$input"
    else
        tee "$input" | ./main.out
    fi

    echo
}
