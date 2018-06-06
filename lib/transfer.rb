class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender;
    @receiver = receiver;
    @amount = amount;
    @status = "pending";
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance >= amount && @status == "pending";
      @receiver.deposit(@amount);
      @sender.balance -= @amount;
      @status = "complete";
    else
      @status = "rejected";
      "Transaction rejected. Please check your account balance.";
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount) && @receiver.balance -= @amount
    end
  end
end
