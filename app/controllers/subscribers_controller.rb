class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      SendWelcomeSmsJob.perform_later(phone_number: @subscriber.phone_number)

      respond_to do |format|
        format.html { redirect_to action: :index, notice: "Subscriber created!" }
        format.turbo_stream { flash.now[:notice] = "Subscriber created!" }
      end
    else
      respond_to do |format|
        format.html { render action: :new, status: :unprocessable_entity }
        format.turbo_stream { flash.now[:error] = "Could not create subscriber." }
      end
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:phone_number)
  end
end
