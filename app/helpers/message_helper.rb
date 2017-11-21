module MessageHelper
  def self_or_other(sender)
    if sender == current_class
      return "self"
    else
      return "other"
    end
  end
end
