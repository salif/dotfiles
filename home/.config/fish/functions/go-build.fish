function go-build --wraps 'go build' --description 'go build wrapper'
    go build -trimpath -ldflags "-s -w" -o $argv
end
