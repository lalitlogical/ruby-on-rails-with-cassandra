class Post
  include Cequel::Record

  has_many :comments
  key :id, :timeuuid, auto: true
  column :title, :text, allow_filtering: true
  column :body, :text, allow_filtering: true

  timestamps

  def self.search params
    if params[:search].present?
      records = Post.allow_filtering!.where(title: params[:search])
    else
      records = Post.limit(25)
    end
    records
  end
end
