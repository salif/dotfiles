function ехо
    if test -n "$argv[1]"
        switch $argv[1]
            case -н
                command echo -n $argv[2..-1]
            case -е
                command echo -e $argv[2..-1]
            case -Е
                command echo -Е $argv[2..-1]
            case --помощ
                command echo --help $argv[2..-1]
            case --версия
                command echo --version $argv[2..-1]
            case '*'
                command echo $argv[1..-1]
        end
    else
        command echo
    end
end
