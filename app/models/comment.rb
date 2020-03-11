# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :house
  belongs_to :user
end
