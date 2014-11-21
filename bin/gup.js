#!/usr/bin/env node

require('shelljs/global');

var cmd = "sh " + __dirname + "/gup.sh"
	
// Run external tool synchronously
if (exec(cmd).code !== 0) {
  echo('Error: Gup commit failed');
  exit(1);
}