local BankAccount = {}
BankAccount.__index = BankAccount

function BankAccount.new()
  local self = setmetatable({}, BankAccount)
  self.b = 0
  self.closed = false

  return self
end

function BankAccount:balance()
  return self.b
end

function BankAccount:deposit(amount)
  if (amount <= 0) then
    error("Amount has to be positive")
  end
  if (self.closed) then
    error("Deposits not possible for closed accounts")
  end
  self.b = self.b + amount
end

function BankAccount:withdraw(amount)
  if (amount <= 0) then
    error("Amount has to be positive")
  end
  if (amount > self.b) then
    error("Cannot overdraw")
  end
  if (self.closed) then
    error("Withdrawls not possible for closed accounts")
  end
  self.b = self.b - amount
end

function BankAccount:close()
  self.closed = true
end

return BankAccount
