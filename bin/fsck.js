#!/usr/bin/env node

require('shelljs/global');

// Run external tool synchronously
if (exec("git fsck --lost-found 2&>/dev/null | while read i; do; git show `echo $i | cut -d ' ' -f 3` | head -n 6; done").code !== 0) {
  echo('Error: fsck commit failed');
  exit(1);
}