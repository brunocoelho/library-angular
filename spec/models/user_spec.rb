require 'spec_helper'

describe User do
  it { should have_many(:books) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }

  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:is_admin) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }
end
