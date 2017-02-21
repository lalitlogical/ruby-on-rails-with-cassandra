class Comment
  include Cequel::Record

  belongs_to :post
  key :id, :uuid, auto: true
  column :first_name, :text
  column :last_name, :text
  column :email, :text
  column :body, :text
  timestamps

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
