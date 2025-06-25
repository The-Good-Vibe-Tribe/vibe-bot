# This function finds nvm in several possible installation methods, and sources it to be able to check if it exists or not.
source_nvm() {
    # --- START NVM SOURCING ---
    # This must be at the top of the script
    # Try standard NVM_DIR first, if set (likely by OMZ)
    if [ -n "$NVM_DIR" ] && [ -s "$NVM_DIR/nvm.sh" ]; then
      . "$NVM_DIR/nvm.sh"
    # Try Oh My Zsh plugin paths
    elif [ -s "$HOME/.oh-my-zsh/custom/plugins/nvm/nvm.plugin.zsh" ]; then
      # Source the plugin file directly, it should handle loading nvm.sh
      . "$HOME/.oh-my-zsh/custom/plugins/nvm/nvm.plugin.zsh"
    elif [ -s "$HOME/.oh-my-zsh/plugins/nvm/nvm.plugin.zsh" ]; then
      # Source the plugin file directly, it should handle loading nvm.sh
      . "$HOME/.oh-my-zsh/plugins/nvm/nvm.plugin.zsh"
    # Fallback to default user install location if OMZ isn't the method
    elif [ -s "$HOME/.nvm/nvm.sh" ]; then
      . "$HOME/.nvm/nvm.sh"
    # Other common system-wide locations
    elif [ -s "/usr/local/opt/nvm/nvm.sh" ]; then
      . "/usr/local/opt/nvm/nvm.sh"
    elif [ -s "/usr/share/nvm/nvm.sh" ]; then
      . "/usr/share/nvm/nvm.sh"
    fi
    # --- END NVM SOURCING ---
}
