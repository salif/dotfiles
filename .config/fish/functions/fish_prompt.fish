function fish_prompt
    echo -n (set_color $fish_color_cwd)(prompt_pwd)(set_color $fish_color_user) '$ '
end
