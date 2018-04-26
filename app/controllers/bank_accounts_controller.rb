class BankAccountsController < ApplicationController

  def new
    @baccount = BankAccount.new
  end

  def create
    binding.pry
    cust = Stripe::Customer.create(
      description: "Restaurant Owner On Foodle",
      source: "tok_visa",
      email: current_user.email
    )
    current_user.customer_id = cust.id
    current_user.save
    @baccount = BankAccount.new(bankaccount_params)
    customer = Stripe::Customer.retrieve("#{current_user.customer_id}")
    token = generate_bank_token(customer)
    customer.sources.create(source: token)
    admin = Stripe::Account.create(
        :type => 'standard',
        :country => 'US',
        :email => current_user.email
      )
    current_user.account_id = admin.id
    current_user.save
    redirect_to new_restaurant_path
  end

  def edit
  #   # Check for a valid account ID
  #   unless params[:id] && params[:id].eql?(current_user.stripe_account)
  #     flash[:error] = "No Stripe account specified"
  #     redirect_to dashboard_path and return
  #   end
  #
  #   # Retrieve the Stripe account to find fields needed
  #   @stripe_account = Stripe::Account.retrieve(params[:id])
  #
  #   # Retrieve the local account details
  #   @account = StripeAccount.find_by(acct_id: params[:id])
  #
  #   if @stripe_account.verification.fields_needed.empty?
  #     flash[:success] = "Your information is all up to date."
  #     redirect_to dashboard_path and return
  #   end
   end

  # Custom action for full account info collection

  def update
    # Check for an existing Stripe account
    # unless current_user.stripe_account
    #   redirect_to new_stripe_account_path and return
    # end
    #
    # begin
    #   # Retrieve the Stripe account
    #   @stripe_account = Stripe::Account.retrieve(current_user.stripe_account)
    #
    #   @account = StripeAccount.new(account_params)
    #
    #
    #   # Reject empty values
    #   account_params.each do |key, value|
    #     if value.empty?
    #       flash.now[:alert] = "Please complete all fields."
    #       render 'edit' and return
    #     end
      end

  private
    def bankaccount_params
      params.require(:bank_account).permit(:country, :currency, :account_holder_name, :account_holder_type,:route_no,:number)
    end
    def generate_bank_token(user)
     response = Stripe::Token.create(
     bank_account: {
       country: params[:bank_account][:country],
       currency: params[:bank_account][:currency],
       routing_number: params[:bank_account][:route_no],
       account_number: params[:bank_account][:number],
       account_holder_name: params[:bank_account][:account_holder_name],
       account_holder_type: params[:bank_account][:account_holder_type],
     },
   )
   return response
 end
end
