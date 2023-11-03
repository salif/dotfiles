function go-build --wraps='go build -trimpath -ldflags "-s -w" -o' --description 'alias go-build=go build -trimpath -ldflags "-s -w" -o'
  go build -trimpath -ldflags "-s -w" -o $argv
end
