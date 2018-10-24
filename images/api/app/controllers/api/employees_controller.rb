class Api::EmployeesController < ApplicationController
  before_action :find_record, only: [:edit, :show, :update, :destroy]

  def create
    @employee = Employee.new(employee_params)
    @employee.save!
    render json: @employee
  end

  def show
    render json: @employee
  end

  def index
    @employees = Employee.all
    render json: @employees
  end

  private

  def find_record
    begin
      @employee = Employee.find params[:id]
    rescue ActiveRecord::RecordNotFound
      json = {error: true, message: 'not found' }
      render json: json, status: 404
    end
  end

  def employee_params
    params.require(:employee).permit(
      :id, :first_name, :last_name, :email
    )
  end
end
