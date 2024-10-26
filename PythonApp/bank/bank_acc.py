class BalanceException(Exception):
    pass
class BankAccount:
    def __init__(self,initialAmount,accName):
        self.balance = initialAmount
        self.name = accName
        print(f"\nAccount {self.name} created.\nBalance = ${self.balance:.2f}")
    def get_balance(self):
        print(f"\nAccount {self.name} || Balance = ${self.balance:.2f}")
    def deposit(self,amount):
        self.balance = self.balance + amount
        print(f"\nDeposit complete! ")
        self.get_balance()
    def viable_transaction(self,amount):
        if self.balance >= amount:
            return
        else:
            raise BalanceException(
                f"\nSorry, account {self.name} only has a balance of {self.balance:.2f}"
            )
    def withdrawn(self,amount):
        try:
            self.viable_transaction(amount)
            self.balance = self.balance - amount
            print("\nWithdrawn complete.")
            self.get_balance()
        except BalanceException as error:
            print(f"\nWithdrawn interrupted: {error}")
    def transfer(self,amount,account):
        try:
            print('\n*************\n\nBeggining Transfer...')
            self.viable_transaction(amount)
            self.withdrawn(amount)
            account.deposit(amount)
            print('\nTransfer complete!\n\n**********')
        except BalanceException as error:
            print(f"Transfer bad: {error}")

class InterestRewardsAcc(BankAccount):
    def deposit(self, amount):
        self.balance = self.balance + (amount * 1.05)
        print("\nDeposit Complete ")
        self.get_balance()

class SavingsAcc(InterestRewardsAcc):
    def __init__(self, initialAmount, accName):
        super().__init__(initialAmount, accName)
        self.fee = 5
    def withdrawn(self, amount):
        try:
            self.viable_transaction(amount +self.fee)
            self.balance = self.balance -  (amount + self.fee)
            print("\nWithdrawn completed")
            self.get_balance()
        except BalanceException as error:
            print(f"\nWithdraw interrupted: {error}")