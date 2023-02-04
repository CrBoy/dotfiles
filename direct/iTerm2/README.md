iTerm2 has a preference plist file at `~/Library/Preferences/com.googlecode.iterm2.plist`. However, it is binary plist format, which is not good for version control.
Fortunately, its "Preference" feature loads and stores (could be automatic!) preference in xml plist format. So don't use link (via GNU Stow), use direct file instead.
