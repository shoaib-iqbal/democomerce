class Admin::StoreSettingsController < AdminController

	def edit
		@store  = Store.first
	end

	def update
		 @store = Store.find(params[:id])
		 # byebug
		 @store.update(store_params)
		 respond_to do |format|
		 	format.js {}
		 	format.html{ redirect_to admin_store_settings_path, :notice => "saved "}
		 end
	end
	private 
	def store_params
      params.require(:store).permit(:currency,:facebook_link,:twitter_link, :pintrest_link, :google_link, :youtube_link, :contact_email, :contact_address)
    end
end
