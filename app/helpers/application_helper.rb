module ApplicationHelper
  def find_flat(flat_id)
    Flat.find(flat_id)
  end

  def find_user(user_id)
    User.find(user_id)
  end
end
