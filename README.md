# New Computer Setup

I love to start from scratch when setting up a new computer or device. For most
people I think it makes sense to boot a new computer from a backup but as a
developer I love diving into all the specific things I do to make my computer
run just the way I like it.

### Advantages

- not pulling over programs or other information that you don’t need
- Avoiding any mishaps on the sync over from time machine
- Remember why you do things a certain way
- It also keeps you open to adopting new technology and ways of doing things

#### Terminal

- Terminal Theme - download from http://color.smyck.org/
  - Also consider the Dracula theme https://draculatheme.com/terminal/
- In Terminal.app, Preferences->Settings, select the Keyboard tab. Ensure "Use
  Option Key as Meta" is checked.
- Increase font size in Preferences to 18pt
- Add to ~/.bash_profile to make terminal prompt a yellow dollar sign
  - `export PS1="\[\033[33m\]$\[\033[m\]"`
- Install homebrew
- Install nodejs (possibly with nvm)
- Install Chrome
- Get Atom configurations from the `~/.atom` folder including startup scripts,
  keymaps, and css
- Change the terminal text http://stackoverflow.com/a/26232411/4280755
- Install Command Lines Tools for IDE (VSCode)
- `open /Users/danseethaler/Library/Application\ Support/Code/User`
- Setup git auto-completion
  - https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
  - Seems like the `source ~/git-completion.bash` code may need to go in the `~/.bash_profile` instead of the `.bashrc` file.

#### Tweak Apps

- BetterTouchTool
- https://pilotmoon.com/scrollreverser/
