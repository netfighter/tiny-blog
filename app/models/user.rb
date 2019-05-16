# frozen_string_literal: true

class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  devise :database_authenticatable, :confirmable, :recoverable,
         :rememberable, :trackable, :validatable, :registerable

  validates_presence_of :first_name

  before_create :set_default_role

  def role?(role)
    !!roles.find_by_name(role.to_s)
  end

  def admin
    role? :admin
  end

  def name
    "#{first_name || 'Anonymous'} #{last_name}"
  end

  def first_name
    self[:first_name] || 'Anonymous'
  end

  def to_s
    name
  end

  def add_role(role)
    roles << Role.where(name: role.to_s).first_or_create unless role? role
  end

  private

  def set_default_role
    roles << Role.where(name: 'user').first_or_create unless role? 'user'
  end
end
