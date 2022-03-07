export class BankAccount {
  #balance;
  #open;

  constructor() {
    this.#open = false;
    this.#balance = null;
  }

  open() {
    if (this.#open) {
      throw new ValueError();
    }

    this.#open = true;
    this.#balance = 0;
  }

  close() {
    if (!this.#open) {
      throw new ValueError();
    }

    this.#open = false;
  }

  deposit(amount) {
    if (!this.#open) {
      throw new ValueError();
    }

    if (amount < 0) {
      throw new ValueError();
    }

    this.#balance += amount;
  }

  withdraw(amount) {
    if (!this.#open) {
      throw new ValueError();
    }

    if (amount < 0 || amount > this.#balance) {
      throw new ValueError();
    }

    this.#balance -= amount;
  }

  get balance() {
    if (!this.#open) {
      throw new ValueError();
    }
    
    return this.#balance;
  }
}

export class ValueError extends Error {
  constructor() {
    super('Bank account error');
  }
}
