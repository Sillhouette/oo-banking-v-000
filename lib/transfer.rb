class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender;
    @reciever = reciever;
    @amount = amount;
  end
end
