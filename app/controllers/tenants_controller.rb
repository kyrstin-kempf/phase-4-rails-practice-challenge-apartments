class TenantsController < ApplicationController

    def index 
        tenants = Tenant.all 
        render json: tenants 
    end

    def show 
        tenant = Tenant.find_by(id: params[:id])
        render json: tenant 
    end

    def create 
        tenant = Tenant.create(name: params[:name], age: params[:age])
        if tenant.valid? 
            render json: tenant, status: :created
        else
            render json: { error: 'Tenant not old enough' }, status: :unprocessable_entity
        end
    end

    def destroy 
        tenant = Tenant.find_by(id: params[:id])
        if tenant 
            tenant.destroy 
            head :no_content 
        else
            render json: { error: 'Tenant not found' }, status: :not_found 
        end
    end

end
