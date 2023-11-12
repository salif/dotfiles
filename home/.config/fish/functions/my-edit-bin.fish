function my-edit-bin --wraps='$EDITOR (type -p $argv[1])' --description 'alias my-edit-bin=$EDITOR (type -p $argv[1])'
    $EDITOR (type -p $argv[1])
end
