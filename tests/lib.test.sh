#!/usr/bin/env bash
set -euo pipefail

. "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

dotfiles_test_tmproot fixture dotfiles-lib
[ -d "$fixture" ] || fail "temporary root was deleted before use"
[ "${#DOTFILES_TEST_CLEANUP_DIRS[@]}" -eq 1 ] || fail "cleanup was not registered in the caller"
printf 'fixture content\n' >"$fixture/probe"

dotfiles_test_tmproot second dotfiles-lib
[ "$fixture" != "$second" ] || fail "temporary roots were reused"
dotfiles_test_cleanup
[ ! -e "$fixture" ] && [ ! -e "$second" ] || fail "explicit cleanup left temporary roots behind"
pass "temporary roots survive allocation and explicit cleanup removes all registrations"

child_root=$(bash -euo pipefail -c '
  . "$1"
  dotfiles_test_tmproot child dotfiles-lib-exit
  test -d "$child"
  printf "%s\n" "$child"
' bash "$ROOT/tests/lib.sh")
[ ! -e "$child_root" ] || fail "EXIT cleanup left the child temporary root behind"
pass "EXIT cleanup removes temporary roots when the caller exits"
