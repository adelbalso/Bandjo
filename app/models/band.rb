class Band < ActiveRecord::Base
  attr_accessible :name, :track, :hometown, :biography, :band_id
  make_voteable
end
