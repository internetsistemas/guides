class AccountStatus < EnumerateIt::Base
  associate_values inactive: 0, active: 1
end

class Account < ActiveRecord::Base
  has_enumeration_for :status, with: AccountStatus, required: true
  has_enumeration_for :dependent, with: AccountStatus, required: true
end
