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
    if @sender.valid?
      if @status == "pending"
        @receiver.deposit(@amount)
        @sender.balance -= @amount
        @status = "complete"
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end
