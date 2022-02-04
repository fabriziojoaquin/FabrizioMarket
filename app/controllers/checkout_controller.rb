class CheckoutController < ApplicationController
    def create
        content = Content.find_by!(slug: params[:slug])
        token = params[:stripeToken]

        begin
            charge = Stripe::Charge.create(
                card: token,
                description: current_user.email,
                amount: (content.price * 100).floor,
                currency: 'eur',
            )
         @sale = content.sales.create!(email_acquirente: current_user.email)
         redirect_to pickup_url(guide: @sale.guide)

            rescue Stripe::CardError => e 
                error = e
                redirect_to content_path(content), notice: @error
            end        
    end

    def pickup
        @sale = Sale.find_by!(guide: params[:guide])
        @content = @sale.content
    end
    
    
end