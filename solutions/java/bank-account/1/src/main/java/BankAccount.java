class BankAccount {

    private int balance;
    private boolean isClosed = true;

    void open() throws BankAccountActionInvalidException {
        if (!isClosed) throw new BankAccountActionInvalidException("Account already open");

        balance = 0;
        isClosed = false;
    }

    void close() throws BankAccountActionInvalidException {
        if (isClosed) throw new BankAccountActionInvalidException("Account not open");

        isClosed = true;
    }

    synchronized int getBalance() throws BankAccountActionInvalidException {
        checkIsOpen();

        return balance;
    }

    synchronized void deposit(int amount) throws BankAccountActionInvalidException {
        checkIsOpen();
        checkAmount(amount);

        balance += amount;
    }

    synchronized void withdraw(int amount) throws BankAccountActionInvalidException {
        checkIsOpen();
        checkAmount(amount);
        checkBalance(amount);

        balance -= amount;
    }

    private void checkIsOpen() throws BankAccountActionInvalidException {
        if (isClosed) throw new BankAccountActionInvalidException("Account closed");
    }

    private void checkAmount(int amount) throws BankAccountActionInvalidException {
        if (amount < 0) throw new BankAccountActionInvalidException("Cannot deposit or withdraw negative amount");
    }


    private void checkBalance(int amount) throws BankAccountActionInvalidException {
        if (balance < amount) throw new BankAccountActionInvalidException("Cannot withdraw more money than is currently in the account");
    }

}
