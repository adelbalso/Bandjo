class AddUpvotesDownvotesToBands < ActiveRecord::Migration
  def change
  	add_column :bands, :up_votes, :integer, :null => false, :default => 0
	add_column :bands, :down_votes, :integer, :null => false, :default => 0
  end
end
