class LeasesController < ApplicationController

    def index 
        leases = Lease.all 
        render json: leases 
    end
    
    def create 
        apartment = Apartment.create(params.permit(:rent, :apartment_id, :tenant_id))
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
