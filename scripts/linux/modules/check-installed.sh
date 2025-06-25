is_gnu_make_installed() {
    command -v make &>/dev/null
}

is_pnpm_installed() {
    command -v pnpm &>/dev/null
}

is_nvm_installed() {
    type nvm &>/dev/null
}

is_node_installed() {
    command -v node &>/dev/null
}
