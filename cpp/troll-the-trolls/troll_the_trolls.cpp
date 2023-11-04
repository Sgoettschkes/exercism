namespace hellmath {

enum class AccountStatus {
    troll,
    guest,
    user,
    mod
};

enum class Action {
    read,
    write,
    remove
};

bool display_post(AccountStatus first, AccountStatus second) {
  return (first == AccountStatus::troll && second == AccountStatus::troll) || (first != AccountStatus::troll && second != AccountStatus::troll);
}

bool permission_check(Action action, AccountStatus acc) {
  switch (acc) {
    case AccountStatus::guest:
      return action == Action::read;
      break;
    case AccountStatus::troll:
    case AccountStatus::user:
      return action == Action::read || action == Action::write;
      break;
    case AccountStatus::mod:
      return true;
      break;
    default:
      return false;
      break;
  }
}

bool valid_player_combination(AccountStatus first, AccountStatus second) {
  if (first == AccountStatus::guest || second == AccountStatus::guest) {
    return false;
  }
  if (first == AccountStatus::troll && second == AccountStatus::troll) {
    return true;
  }

  return first != AccountStatus::troll && second != AccountStatus::troll;
}

// TODO: Task 5 - Implement the `has_priority` function that takes two
// `AccountStatus` arguments and returns `true`, if and only if the first
// account has a strictly higher priority than the second.
bool has_priority(AccountStatus first, AccountStatus second) {
  return first > second;
}


}  // namespace hellmath
