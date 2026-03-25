function гит --wraps git --description 'git wrapper'
    if test -n "$argv[1]"
        switch $argv[1]
            case клониране
                command git clone $argv[2..-1]
            case създаване
                command git init $argv[2..-1]
            case добавяне
                command git add $argv[2..-1]
            case преместване
                command git mv $argv[2..-1]
            case изтриване
                command git rm $argv[2..-1]
            case разлики
                command git diff $argv[2..-1]
            case журнал
                command git log $argv[2..-1]
            case показване
                command git show $argv[2..-1]
            case статус
                command git status $argv[2..-1]
            case клон
                command git branch $argv[2..-1]
            case подаване
                command git commit $argv[2..-1]
            case сливане
                command git merge $argv[2..-1]
            case преминаване
                command git switch $argv[2..-1]
            case маркер
                command git tag $argv[2..-1]
            case изтегляне
                command git fetch $argv[2..-1]
            case доставяне
                command git pull $argv[2..-1]
            case изтласкване
                command git push $argv[2..-1]
            case помощ
                command git help $argv[2..-1]
            case '*'
                command git $argv[1..-1]
        end
    else
        command git | sed -e 's/clone     /клониране   /g' -e 's/init      /създаване   /g' -e \
            's/add       /добавяне    /g' -e 's/mv        /преместване /g' -e 's/restore   /възстанови  /g' -e \
            's/rm        /изтриване   /g' -e 's/bisect    /bisect      /g' -e 's/diff      /разлики     /g' -e \
            's/grep      /grep        /g' -e 's/log       /журнал      /g' -e 's/show      /показване   /g' -e \
            's/status    /статус      /g' -e 's/branch    /клон        /g' -e 's/commit    /подаване    /g' -e \
            's/merge     /сливане     /g' -e 's/rebase    /rebase      /g' -e 's/reset     /reset       /g' -e \
            's/switch    /преминаване /g' -e 's/tag       /маркер      /g' -e 's/fetch     /изтегляне   /g' -e \
            's/pull      /доставяне   /g' -e 's/push      /изтласкване /g' -e 's/help      /помощ     /g' -e \
            's/git help/гит помощ/g' -e 's/: git/: гит/g'
    end
end
