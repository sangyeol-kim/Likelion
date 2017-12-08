class Home < ApplicationRecord
    paginates_per 5
    
    belongs_to :post
    belongs_to :bulletin, optional: true
end
