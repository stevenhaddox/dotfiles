mail() {
  if [[ $1 = "me" ]]; then
    rvm system exec vmail -c ~/.vmailrc-me
  elif [[ $1 = "work" ]]; then
    rvm system exec vmail -c ~/.vmailrc-work
  elif [[ $1 = "accts" ]]; then
    rvm system exec vmail -c ~/.vmailrc-accts
  elif [[ $1 = "slkd" ]]; then
    rvm system exec vmail -c ~/.vmailrc-slkd
  elif [[ $1 = "slkd-a" ]]; then
    rvm system exec vmail -c ~/.vmailrc-slkd-a
  else
    echo "Please specify an account."
  fi
}
