class Admin::StoreSettingsController < AdminController

	def edit
		@store  = Store.first
	end
end
