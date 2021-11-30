class DashboardsController < ApplicationController
  def show
    @expense = Expense.new
    @categories = current_user.unique_category
    @accounts = current_user.accounts
    params[:scope].present? ? @time = params[:scope].to_i : @time = "all"
    @expenses_chart = Expense.populate_chart(@time)
    @total_expenses = user_total_expenses(@time)
    @total_emmissions = user_total_emmissions(@time)
    @emmissions = current_user.emmissions.date_filtered_emmissions(@time, current_user)
    @emmission_chart = Emmission.populate_chart(@time)
    respond_to do |format|
      format.html
      format.text { render partial: 'description.html' }
    @dash_selected = true
    end
  end

  def user_total_expenses(time)
    case time
    when "all"
      current_user.user_total_expenses
    else
      current_user.expenses.date_filter(time).collect(&:amount).sum(&:to_f)
    end
  end

  def user_total_emmissions(time)
    total = 0
    case time
    when "all"
      return (current_user.user_total_emmissions.to_f * current_user.user_total_expenses.to_f) / 1000
    else
      current_user.expenses.date_filter(time).each do |expense|
        total += expense.emmission.co2_grams unless expense.emmission.co2_grams.nil?
      end
    end
    return total
  end
end
