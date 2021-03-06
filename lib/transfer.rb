class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

def valid? 
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending" && valid? == true
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      
      elsif @status == "complete" 
      puts "Transaction was already executed" 
      
    else valid? == false 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end 
