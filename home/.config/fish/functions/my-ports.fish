function my-ports --description 'Show all listening ports'
    netstat -tunlp
    ss -tunlp
end
