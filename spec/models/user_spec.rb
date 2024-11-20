# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates a valid user" do
    user = create(:user)  # Esto usa FactoryBot para crear un usuario
    expect(user).to be_valid  # Asegura que el usuario es válido
  end

  it "ensures email presence" do
    user = build(:user, email: nil)  # Usamos build para no persistirlo en la base de datos
    expect(user).not_to be_valid  # El usuario no debería ser válido sin email
  end
end

