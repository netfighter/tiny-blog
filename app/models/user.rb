class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  devise :database_authenticatable, :confirmable, :recoverable,
         :rememberable, :trackable, :validatable, :registerable

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :confirmed_at, :guest, :admin
  validates_presence_of :first_name

  before_create :set_default_role

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def admin
    role? :admin
  end

  def name
    "#{first_name || 'Anonymous'} #{last_name}"
  end

  def first_name
    self[:first_name] || "Anonymous"
  end

  def to_s
    name
  end

  def add_role(role)
    unless role? role
      self.roles << Role.find_or_create_by_name(role.to_s)
    end
  end

  private

  def set_default_role
    unless role? 'user'
      self.roles << Role.find_or_create_by_name('user')
    end
  end

end
