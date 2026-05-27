class MaintenanceRecordsController < ApplicationController
  before_action :set_maintenance_record, only: [:show, :update, :destroy]

  def index
    @records = MaintenanceRecord.all
    @records = @records.where(equipment_id: params[:equipment_id]) if params[:equipment_id]
    @records = @records.where(technician: params[:technician]) if params[:technician]
    render json: @records
  end

  def show
    render json: @maintenance_record
  end

  def create
    @maintenance_record = MaintenanceRecord.new(maintenance_record_params)
    if @maintenance_record.save
      render json: @maintenance_record, status: :created
    else
      render json: @maintenance_record.errors, status: :unprocessable_entity
    end
  end

  def update
    if @maintenance_record.update(maintenance_record_params)
      render json: @maintenance_record
    else
      render json: @maintenance_record.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @maintenance_record.destroy
    render json: { message: "Maintenance record deleted successfully" }
  end

  private

  def set_maintenance_record
    @maintenance_record = MaintenanceRecord.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Maintenance record not found" }, status: :not_found
  end

  def maintenance_record_params
    params.require(:maintenance_record).permit(:equipment_id, :performed_on, :description, :technician, :cost)
  end
end