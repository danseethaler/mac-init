# MacOS Setup

This is a collection of applications, scripts, and configuration I use when setting up a new Mac.

### Advantages of setting up from scratch

- not pulling over programs or other information that you don’t need
- avoiding any issues on the sync over from time machine
- remember why you do things a certain way
- keeps and open mind to adopting new technology and ways of doing things

#### Applications

- VS Code
- Sorted3
- DayOne
- Bear
- Chrome
- Framer X
- Adobe CC
- Sourcetree
- Postman
- Insomnia

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
- Change the terminal text http://stackoverflow.com/a/26232411/4280755
- Install Command Lines Tools for IDE (VSCode)
- `open /Users/danseethaler/Library/Application\ Support/Code/User`
- Add git by running `git --version` in terminal
  - https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- Setup git auto-completion
  - https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
  - Seems like the `source ~/git-completion.bash` code may need to go in the `~/.bash_profile` instead of the `.bashrc` file.

#### Tweak Apps

- BetterTouchTool
- https://pilotmoon.com/scrollreverser/
- https://gist.github.com/tonysneed/f9f09bfa28bcf98e8d8306f9b21f99e2#gistcomment-2311154

### Custom git scripts

The `.gitconfig` file in this project can be used directly by the OS by adding the folowing configuration to `~/.gitconfig`:

```
[include]
    path = ~/Developer/mac-init/.gitconfig
```

To enable `git-recent` command simply:

- copy the `git-recent` file in this local repo it to your `/usr/local/bin` dir with `sudo cp git-recent /usr/local/bin/git-recent`
- make the file executable with `sudo chmod 755 /usr/local/bin/git-recent`

Install `git-checkout-interactive` globally with `npm i -g git-checkout-interactive`

Change permission for `.git_actions.js` with `chmod 755 .git_actions.js`

Add to post-checkout to auto-pull certain branches:

```
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "${BRANCH}" == "develop" || "${BRANCH}" == "master" ]]; then
  git pull -p
fi
```
