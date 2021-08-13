class SearchController < ApplicationController
  def index
    filter_type = params[:filter]
    text = params[:text]
    vehicles = if text.present?
                 vehicles(filter_type, text)
               else
                 []
               end


    render json: vehicles, status: 200
  end

  private

  def vehicles(filter_type, text)
    case filter_type
    when 'model_name'
      Vehicle.by_model_name(text)
    when 'brand_name'
      Vehicle.by_brand_name(text)
    when 'year'
      Vehicle.greater_than_year(text)
    when 'mileage'
      Vehicle.lower_than_mileage(text)
    when 'price'
      Vehicle.lower_than_price(text)
    else
      []
    end
  end
end
