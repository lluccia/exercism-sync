local BankAccount = { _balance = 0, _closed = false }
BankAccount.__index = BankAccount

function BankAccount:new()
    local instance = setmetatable({}, BankAccount)
    return instance
end

function BankAccount:balance()
    return self._balance
end

function BankAccount:close()
    self._closed = true
end

function BankAccount:deposit(amount)
    if self._closed then
        error("Account is closed")
    end
    if amount <= 0 then
        error("Deposits must Be positive numbers")
    end

    self._balance = self._balance + amount
end

function BankAccount:withdraw(amount)
    if self._closed then
        error("Account is closed")
    end
    if amount <= 0 then
        error("Withdrawals must be positive numbers")
    end
    if amount > self._balance then
        error("Insuficient balance for withdrawal")
    end

    self._balance = self._balance - amount
end

return BankAccount
