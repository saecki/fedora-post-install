#!/bin/sh

YELLOW="\033[0;33m"
BLUE="\033[0;34m"
NC="\033[0m"

heading1() {
    echo -e "\n${YELLOW}## ${@} ##${NC}\n"
}

heading2() {
    echo -e "\n${YELLOW}# ${@} #${NC}"
}

heading3() {
    echo -e "\n${BLUE}${@}${NC}"
}
