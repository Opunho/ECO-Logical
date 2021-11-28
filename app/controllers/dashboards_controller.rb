class DashboardsController < ApplicationController
  def show
    @expense = Expense.new
    @categories = current_user.unique_category
    @accounts = current_user.accounts
    @expenses_chart = Expense.chart_legend
    params[:scope].present? ? @time = params[:scope] : @time = "all"
    # @emmission_chart = Emmission.pie_chart2
    @emmissions = current_user.emmissions
    @total_expenses = user_total_expenses(@time)
    @total_emmissions = user_total_emmissions(@time)
    @emmissions = current_user.emmissions.date_filtered_emmissions(@time, current_user)
    @emmission_chart = Emmission.populate_chart(@time)
    respond_to do |format|
      format.html
      format.text { render partial: 'description.html' }
    end
  end

  def user_total_expenses(time)
    case time
    when "all"
      current_user.user_total_expenses
    when "month"
      current_user.expenses.last_thirty_days.collect(&:amount).sum(&:to_f)
    when "six_months"
      current_user.expenses.last_six_months.collect(&:amount).sum(&:to_f)
    when "three_months"
      current_user.expenses.last_three_months.collect(&:amount).sum(&:to_f)
    end
  end

  def user_total_emmissions(time)
    total = 0
    case time
    when "all"
      (current_user.user_total_emmissions.to_f * current_user.user_total_expenses.to_f) / 1000
    when "month"
      current_user.expenses.last_thirty_days.each do |expense|
        total += expense.emmission.co2_grams unless expense.emmission.co2_grams.nil?
      end
    when "three_months"
      current_user.expenses.last_three_months.each do |expense|
        total += expense.emmission.co2_grams unless expense.emmission.co2_grams.nil?
      end
    when "six_months"
      current_user.expenses.last_six_months.each do |expense|
        total += expense.emmission.co2_grams unless expense.emmission.co2_grams.nil?
      end
    end
    return total
  end
end
