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
        command git | sed -e 's/clone   /клонирай/g' -e 's/init  /създай/g' -e 's/add   /добави/g' -e \
            's/mv      /премести/g' -e 's/rm    /изтрий/g' -e 's/diff   /разлики/g' -e 's/log/лог/g' -e \
            's/show  /покажи/g' -e 's/status/статус/g' -e 's/branch/клон  /g' -e 's/commit/подай /g' -e \
            's/merge  /сливане/g' -e 's/switch /премини/g' -e 's/tag/таг/g' -e 's/fetch  /изтегли/g' -e \
            's/pull   /достави/g' -e 's/push   /изпрати/g' -e 's/help/помощ/g' -e 's/git/гит/g'
    end
end
