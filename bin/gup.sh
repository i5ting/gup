local br
br=`git branch 2> /dev/null|\\grep '^*'|sed -e 's/..//;s/\\n//'`
tainted=`git status --porcelain | \\grep -v '^\\?\\?'`
if [[ $br == master ]]; then
  if [[ $tainted == '' ]]; then
    echo git stash
    git stash
  fi
  echo git fetch
  git fetch
  echo git rebase FETCH_HEAD $br
  git rebase FETCH_HEAD $br
else
  if [[ -n $br ]]; then
    if [[ $tainted == '' ]]; then
      echo git stash
      git stash
    fi
    echo git pull --rebase origin $br
    git pull --rebase origin $br
  else
    echo seems not in any branch
  fi
fi