describe 'all', collection: true  do
  it { expect([1,7,9]).to all( (be_odd).and be_a(Integer) ) }
  it { expect(['ruby', 'rails']).to all( include('r').and be_a(String) ) }
end
