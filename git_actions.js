#!/usr/bin/env node

const exec = require("child_process").exec;
const args = process.argv.slice(2);

const commands = {
  // Review the changes made to a specific file since the last shared commit
  // of the current branch and the branch we're rebasing
  rebaseOnto: branch => {
    exec(
      `git rebase --onto=${branch} $(git merge-base ${branch} HEAD)`,
      (err, res) => {
        if (err) throw err;

        const matches = res.match(
          /You are currently rebasing branch '([^']*)'/
        );
        if (!matches) {
          process.stdout.write('echo "Not currently rebasing"');
          return;
        }

        const finalCommand = `git log -p $(git merge-base ${matches[1]} HEAD)..HEAD ${file}`;

        process.stdout.write(finalCommand);
      }
    );
  },

  // View all changes to the specified file since the current branch and the
  // rebasing branch have diverged
  reviewMergeFile: file => {
    exec("git status", (err, res) => {
      if (err) throw err;

      const matches = res.match(/You are currently rebasing branch '([^']*)'/);
      if (!matches) {
        process.stdout.write('echo "Not currently rebasing"');
        return;
      }

      const finalCommand = `git log -p $(git merge-base ${matches[1]} HEAD)..HEAD ${file}`;

      process.stdout.write(finalCommand);
    });
  },

  searchBlame: searchTerm => {
    exec(
      `git grep -n "${searchTerm}" | while IFS=: read i j k; do git blame -f -L $j,$j $i; done`,
      (err, res) => {
        if (err) throw err;
        const formattedResponse = `* ${res.split("\n").join(`\n* `)}`;
        return process.stdout.write(formattedResponse);
      }
    );
  }
};

if (typeof commands[args[0]] === "function") {
  const [functionName, ...rest] = args;
  commands[functionName](...rest);
}
