class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  

  def initialize(sender, receiver, transfer)
    @receiver = receiver
    @sender = sender
    @status = "pending"
    @amount = transfer
  end

  def valid?
      
    if sender.valid? && receiver.valid? #why does this work if #valid? is an instance method of bank_account
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? && @sender.balance > @amount && @status == "pending"
    sender.balance -= @amount
    receiver.balance += @amount
    @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
    sender.balance += @amount
    receiver.balance -= @amount
    @status = "reversed"
    else
      nil
    end
  end
end
