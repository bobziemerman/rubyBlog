class EntriesController < ApplicationController
	def index
		@entries = Entry.order(id: :desc)
	end

	def show
		@entry = Entry.find(params[:id])
	end

	def new
	end

	def login
		session[:admin] = true
		redirect_to entries_path
	end

	def logout
		session[:admin] = false
		redirect_to entries_path
	end

	def create
#render plain: params[:entry].inspect
		Entry.create(params.require(:entry).permit(:title, :text))
		redirect_to entries_path
	end
end
