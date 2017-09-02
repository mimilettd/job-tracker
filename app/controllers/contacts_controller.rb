class ContactsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.create(contact_params)
    redirect_to company_path(@company)
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :position, :email, :company_id)
  end
end
