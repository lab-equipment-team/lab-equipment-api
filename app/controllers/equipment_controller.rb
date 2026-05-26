class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :update, :destroy]

  # GET /equipment
  # Returns all equipment with optional filtering by category_id and/or status
  def index
    @equipment = Equipment.all

    # Filter by category_id if provided
    @equipment = @equipment.where(category_id: params[:category_id]) if params[:category_id].present?

    # Filter by status if provided
    @equipment = @equipment.where(status: params[:status]) if params[:status].present?

    render json: @equipment
  end

  # GET /equipment/:id
  # Returns a specific equipment by ID
  def show
    render json: @equipment
  end

  # POST /equipment
  # Creates a new equipment record
  def create
    @equipment = Equipment.new(equipment_params)

    if @equipment.save
      render json: @equipment, status: :created, location: @equipment
    else
      render json: { errors: @equipment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equipment/:id
  # Updates an equipment record
  def update
    if @equipment.update(equipment_params)
      render json: @equipment
    else
      render json: { errors: @equipment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /equipment/:id
  # Deletes an equipment record
  def destroy
    @equipment.destroy
    render json: { message: 'Equipment deleted successfully' }, status: :ok
  end

  private

  # Find equipment by ID
  def set_equipment
    @equipment = Equipment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Equipment not found' }, status: :not_found
  end

  # Whitelist equipment parameters
  def equipment_params
    params.require(:equipment).permit(:name, :serial_number, :purchased_on, :status, :category_id)
  end
end
