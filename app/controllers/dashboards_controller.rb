class DashboardsController < ApplicationController

  def show
    @accounts = current_user.accounts
    @emmissions = current_user.emmissions
    @expense = Expense.new
    @total_expenses = current_user.user_total_expenses
    @total_emmissions = (current_user.user_total_emmissions.to_f * current_user.user_total_expenses.to_f) / 1000
    if params[:month_query].present?
      @total_expenses = user_total_expenses_month
      @total_emmissions = total_emmissions_month
    elsif params[:half_year].present?
      @total_expenses = user_total_expenses_half_year
      @total_emmissions = total_emmissions_half_year
    elsif params[:three_months].present?
      @total_expenses = user_total_expenses_three_months
      @total_emmissions = total_emmissions_three_months
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'description.html' }
    end
  end

  def user_total_expenses_month
    current_user.expenses.last_thirty_days.collect(&:amount).sum(&:to_f)
  end

  def user_total_expenses_half_year
    current_user.expenses.last_six_months.collect(&:amount).sum(&:to_f)
  end

  def user_total_expenses_three_months
    current_user.expenses.last_three_months.collect(&:amount).sum(&:to_f)
  end

  def total_emmissions_month
    total = 0
    current_user.expenses.last_thirty_days.each do |expense|
      total += expense.emmission.co2_grams unless expense.emmission.co2_grams.nil?
    end
    return total
  end

  def total_emmissions_half_year
    total = 0
    current_user.expenses.last_six_months.each do |expense|
      total += expense.emmission.co2_grams unless expense.emmission.co2_grams.nil?
    end
    return total
  end

  def total_emmissions_three_months
    total = 0
    current_user.expenses.last_three_months.each do |expense|
      total += expense.emmission.co2_grams unless expense.emmission.co2_grams.nil?
    end
    return total
  end
end
