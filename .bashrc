. /opt/erlang/r15b02/activate

. /etc/bash_completion

. ~/.kerl/bash_completion

function prompt_cmd {

    EXIT_CODE=$?
    RED="\[\033[1;31m\]"
    YELLOW="\[\e[32;1m\]"
    WHITE="\[\e[37;1m\]"
    PURPLE="\[\e[34;1m\]"
    OFF="\[\e[0m\]"

    if [ $EXIT_CODE -eq 0 ]
    then
        EXIT_PT=""
    else
        EXIT_PT="${WHITE}--->${YELLOW}(${RED}${EXIT_CODE}${YELLOW})${OFF}"
    fi

    BIND="${YELLOW})-(${OFF}"
    USER_PT="${WHITE}\u"
    DATE_PT="${PURPLE}\@ \d"
    CWD_PT="${WHITE}\w"

    PS1="${EXIT_PT}\n${YELLOW}(${USER_PT}${BIND}${DATE_PT}${BIND}${CWD_PT}${YELLOW})${WHITE}:\n\$${OFF} "
}

PROMPT_COMMAND=prompt_cmd

HISTSIZE=1000
