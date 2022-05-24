class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_payment
  has_many :gyms

  def total_payment
    payments = object.memberships.map {|m|m.charge}
    payments.sum
  end
end
