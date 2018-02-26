
module Mail
  class Message
    def conversation( val = nil )
      default :conversation, val
    end
    def conversation=( val )
      header[:conversation] = val
    end
  end
end

