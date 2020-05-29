class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :update, :destroy]

  # GET /vendors
  def index
    @vendors = Vendor.all

    options = {}
    options[:include] = [:blocks, :items]


    render json: VendorSerializer.new(@vendors, options).serialized_json
  end

  # GET /vendors/1
  def show

    options = {}
    options[:include] = [:blocks, :items]

    render json: VendorSerializer.new(@vendor, options).serialized_json
  end

  # POST /vendors
  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save

      options = {}
      options[:include] = [:blocks, :items]
      
      render json: VendorSerializer.new(@vendor, options).serialized_json, status: :created, location: @vendor
    else
      render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vendors/1
  def update
    if @vendor.update(vendor_params)
      render json: @vendor
    else
      render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vendors/1
  def destroy
    @vendor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vendor_params
      params.require(:vendor).permit(:name, :website)
    end
end
