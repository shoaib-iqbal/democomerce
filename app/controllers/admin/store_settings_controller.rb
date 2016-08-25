class Admin::StoreSettingsController < AdminController

	def edit
		@store  = Store.first
	end

	def update
		 @store = Store.find(params[:id])
		 @store.update(:currency => params[:store][:currency])
		 respond_to do |format|
		 	format.js {}
		 	format.html{ redirect_to admin_store_settings_path, :notice => "saved "}
		 end
	end
end
