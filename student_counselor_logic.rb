#
#User

bob = {
  id: 1,
  counselor: true
}

john = {
  id: 2,
  counselor: false,
  counselor_ref: 1
}

# bob
def students
  if self.counselor
    User.where(counselor_ref: bob.id)
  else
    nil
  end
end

bob.students

new_student = User.new(counselor_ref: current_user.id)

# john
def counselor
  if self.counselor
    nil
  else
    User.where(id: john.counselor_ref).first
  end
end
john.counselor

if current_user.counselor
  # do somehting that a counselor can do
else
  # kick him out
end
