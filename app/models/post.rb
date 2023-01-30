class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :memo, length: { maximum: 500 }
  validate :start_end_check
  
    def start_end_check
      return unless enddate? && startdate?
      errors.add(:enddate, "は開始日より前の日付は登録できません。") if enddate.nil? || enddate < startdate
    end
end