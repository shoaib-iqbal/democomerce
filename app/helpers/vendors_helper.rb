module VendorsHelper

  def get_distance(vendor, params)
    distance = vendor.distance_to([params[:latitude], params[:longitude]], :km)
    distance.round(2) if distance.present?
  end
end
