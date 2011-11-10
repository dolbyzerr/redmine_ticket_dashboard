class DashboardController < ApplicationController
  unloadable

  def index
    #user_ids = [20, 98, 79, 124, 111, 120, 11, 6, 8, 119, 130]
    dashboard_group_id = 146

    @dashboard_group = Group.find(:all, :conditions=>["id IN (?)", dashboard_group_id]).first
    
    user_ids = @dashboard_group.users.map{|user| user.id}
    
    date_start = (DateTime.now - 14).to_date.to_s
    date_end = (DateTime.now + 14).to_date.to_s
    @issues = Issue.find(:all, :conditions => ["project_id = 14 and due_date >= '"+date_start+"' and due_date <= '"+date_end+"' and assigned_to_id IN (?)", user_ids])
    
    @users = @dashboard_group.users
    @groups = @users.map{|user| user.groups}.flatten.uniq - [@dashboard_group]
    

    # flash[:notice] = date_start
    # @cat = IssueCustomField.find(:all, :conditions => ["id=7"])[0].possible_values
    # @cat = @cat - ["День влюбленных"]
    # issues = Issue.roots.find(:all, :conditions => ['project_id = 17'])
    # @data = []
    # issues.map do |i| 
    #   cf = i.custom_field_values.detect{|j| j.custom_field_id == 12}
    #   if cf != nil && cf.value != "" && cf.value.to_date()
    #     @data.push([i, cf.value.to_date(), Issue.find(:all, :conditions=>["parent_id="+i.id.to_s])]);
    #   end
    # end
    @day_names = ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"]
    @month_names = ["янв", "февр", "март", "апр", "май", "июнь", "июль", "авг", "сент", "окт", "нояб", "дек"]
      
  end
end
