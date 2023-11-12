function гит
    if test -n "$argv[1]"
        switch $argv[1]
            case клонирай
                command git clone $argv[2..-1]
            case създай
                command git init $argv[2..-1]
            case добави
                command git add $argv[2..-1]
            case премести
                command git mv $argv[2..-1]
            case възстанови
                command git restore $argv[2..-1]
            case изтрий
                command git rm $argv[2..-1]
            case разлики
                command git diff $argv[2..-1]
            case лог
                command git log $argv[2..-1]
            case покажи
                command git show $argv[2..-1]
            case статус
                command git status $argv[2..-1]
            case клон
                command git branch $argv[2..-1]
            case подай
                command git commit $argv[2..-1]
            case сливане
                command git merge $argv[2..-1]
            case премини
                command git switch $argv[2..-1]
            case таг
                command git tag $argv[2..-1]
            case изтегли
                command git fetch $argv[2..-1]
            case достави
                command git pull $argv[2..-1]
            case изпрати
                command git push $argv[2..-1]
            case помощ
                command git help $argv[2..-1]
            case '*'
                command git $argv[1..-1]
        end
    else
        command git
    end
end
