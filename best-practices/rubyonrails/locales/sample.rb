# app/models/finance/admin.rb
class Finance::Admin < ActiveRecord::Base
  validates :name, presence: true
  validates :full_name, presence: true
end

# Files in config/locales
# |-defaults
# |---pt-br.yml
# |---en.yml
# |-devise
# |---pt-br.yml
# |---en.yml
# |-models
# |---finance
# |------admin
# |--------pt-br.yml
# |--------en.yml

# config/locales/models/finance/admin.yml
en:
  activerecord:
    models:
      finance:
        admin: Administrator
    attributes:
      finance:
        admin:
          name: Name
          full_name: "Full Name"
