class AddressesController < ApplicationController
  def index
    @new_address = Address.new
    @addresses = Address.all
    @map_addresses = @addresses.collect do |address|
      {entry: address.entry, color: address.color, cords: {lat: address.latitude.to_f, lng: address.longitude.to_f}}
    end.to_json
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to(root_path, notice: 'Address added')
    else
      redirect_to(root_path, alert: 'Address could not be added')
    end
  end

  private

  def address_params
    params.require(:address).permit(:entry)
  end
end
