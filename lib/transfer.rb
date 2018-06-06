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
    @sender.valid? && @status != "complete" ? @receiver.balance -= @amount && @sender.deposit(@amount) && @status = "complete" : 
    @status = "rejected" && "Transaction rejected. Please check your account balance."
  end
end
