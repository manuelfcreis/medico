module MedicationHelper
  def progress_helper(dose, count)
    if count <= dose.progress
      return "taken"
    else
      return ""
    end
  end
end
