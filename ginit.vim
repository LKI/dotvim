" NVim settings
if exists(':GuiFont')
  GuiFont! Fira Code:h12
endif

if exists(':GuiTabline')
  GuiTabline 0
endif

if exists(':GuiScrollBar')
  GuiScrollBar 0
endif

if exists(':GuiPopupmenu')
  GuiPopupmenu 0
endif

call TogableMap('<A-F12>', 'gitbash', 'C:/Users/lirian/scoop/apps/git/current/bin/bash.exe -l -i')
