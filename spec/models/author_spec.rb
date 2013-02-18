require 'spec_helper'

describe Author do
  it { should belong_to(:book) }

  it { should validate_presence_of(:book_id) }
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:book_id) }

  it { should allow_mass_assignment_of(:book_id) }
  it { should allow_mass_assignment_of(:name) }
end
