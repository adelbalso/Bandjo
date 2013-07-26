class BandsController < ApplicationController
	def index
		@bands = Band.all
	end

	def new
		@band = Band.new
	end

	def create
		@band = Band.new(params[:band])

		if @band.save
			redirect_to action: "index"
		else
			render action: 'new'
		end
	end

	def edit
		@band = Band.find(params[:id])
	end

	def update
		@band = Band.find(params[:id])
		if @band.update_attributes(params[:band])
			redirect_to action: "index"
		else
			render action: 'new'
		end
	end

	def destroy
	end

	def upvote
		@band = Band.find(params[:id])
		current_user.up_vote(@band)
		flash[:message] = 'Thanks for Voting'
		redirect_to action: "index"
	rescue MakeVoteable::Exceptions::AlreadyVotedError
  		flash[:error] = 'Already voted!'
  		redirect_to action: "index"
	end

	def downvote
		@band = Band.find(params[:id])
		current_user.down_vote(@band)
		flash[:message] = 'Thanks for Voting'
		redirect_to action: "index"
	rescue MakeVoteable::Exceptions::AlreadyVotedError
  		flash[:error] = 'Already voted!'
  		redirect_to action: "index"
	end


end
