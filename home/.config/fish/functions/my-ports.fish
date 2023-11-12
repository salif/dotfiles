function my-ports --wraps='netstat -tunlp' --description 'alias my-ports=netstat -tunlp'
    netstat -tunlp
end
