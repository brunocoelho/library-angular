require 'spec_helper.rb'

describe Book do
  it { should belong_to(:user) }

  it { should validate_presence_of(:isbn) }
  it { should validate_presence_of(:title) }
  it { should validate_numericality_of(:user_id) }

  it { should allow_mass_assignment_of(:isbn) }
  it { should allow_mass_assignment_of(:lending_date) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:user_id) }
end
