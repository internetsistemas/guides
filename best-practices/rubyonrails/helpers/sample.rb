# sample.html.erb
<% people_without_access_from(company).each do |person| %>
  <label class="checkbox">
    <%= add_person_to_project_check_box(person, company) %> <%= person.name %>
<% end %> %>

# application_helper.rb
module ApplicationHelper
  def add_person_to_project_check_box(person, company)
    check_box_tag("people_ids[]", person.id, false, { :class => "company_#{company.id}_person" })
  end
end

