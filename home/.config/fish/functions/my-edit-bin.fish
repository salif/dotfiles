function my-edit-bin --wraps command --description 'Edit command file'
    micro (type -p $argv[1])
end
