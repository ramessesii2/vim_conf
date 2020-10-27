# vim_conf

#### GET STARTED

###### CLONE the repo. 

1. Put *.vimrc* file and *.vim/* folder into home directory.
1. open .vimrc and press : to go into command mode, type **PlugInstall**.
1. (OPTIONAL) Once installed, download *flake8* and *black* for better linting and syntax highlighting and move the *flake8* file in *~/.config*.

##### Here is a complete list of mappings(in progress)-

--My leader is mapped to space(see *.vimrc* file)--

#### leader = "space"

###### movement between splits
* leader + h = switch to tab to the left
* leader + j = switch to tab to the down
* leader + k = switch to tab to the up
* leader + l = switch to tab to the right

###### resizing splits
* leader + > = :vertical resize +5
* leader + < = :vertical resize -5
* leader + - = : resize -5
* leader + + = : resize +5
* leader + = = : resize

###### opening files in other editors
* leader + ov = open in vscode
* leader + od = open in document viewer

###### splitting tabs
* leader + pv = file explorer(nerdtree was useless)
* , + v = horizontal split
* , + s = vertical split
* , + r = rotate 
* , + x = close tab

###### running specific files from vim
* leader + rp = save and execute python file
* leader + arp = save and execute python file in shell mode
* leader + rs= execute shell script
* leader + rc= compile and run C file

###### easy switching between tabs
* leader + 1 = 1st tab
* leader + 2 = 2nd tab
* leader + 3 = 3rd tab
* leader + 4 = 4th tab
* leader + 5 = 5th tab
* leader + 6 = 6th tab
* leader + 9 = last tab
* leader + 0 = first tab
