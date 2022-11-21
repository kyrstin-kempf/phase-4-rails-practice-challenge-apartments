class ApartmentsController < ApplicationController

    def index 
        apartments = Apartment.all 
        render json: apartments 
    end

    def show 
        apartment = Apartment.find_by(id: params[:id])
        render json: apartment 
    end

    def create 
        apartment = Apartment.create(params.permit(:number))
        render json: apartment, status: :created
    end

    def destroy 
        apartment = Apartment.find_by(id: params[:id])
        if apartment 
            apartment.destroy 
            head :no_content 
        else
            render json: { error: 'Apartment not found' }, status: :not_found 
        end
    end

end
