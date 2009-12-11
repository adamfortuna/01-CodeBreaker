require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Marker, "match" do
  before(:each) do
    @m = Marker.new(['r','r','b','b'])
  end
  
  it "0 matches should return []" do
    @m.guess(['g','g','g','g']).should == []
  end  
  it "1 non-positional match should return ['m']" do
    @m.guess(['b','g','g','g']).should == ['m']
  end
  it "2 non-positional matches should return ['m', 'm']" do
    @m.guess(['b','b','g','g']).should == ['m', 'm']
  end
  it "3 non-positional matches should return ['m', 'm', 'm']" do
    @m.guess(['b','b','r','g']).should == ['m', 'm', 'm']
  end
  it "4 non-positional matches should return ['m', 'm', 'm', 'm']" do
    @m.guess(['b','b','r','r']).should == ['m', 'm', 'm', 'm']
  end
  
  it "1 positional match should return ['p']" do
    @m.guess(['r','g','g','g']).should == ['p']
  end
  it "2 positional match should return ['p','p']" do
    @m.guess(['r','r','g','g']).should == ['p','p']
  end
  it "3 positional match should return ['p','p','p']" do
    @m.guess(['r','r','b','g']).should == ['p','p','p']
  end
  it "4 positional match should return ['p','p','p','p']" do
    @m.guess(['r','r','b','b']).should == ['p','p','p','p']
  end

  it "2 positional matches and 2 non-positional matches should return ['p','p','m','m']" do
    @m.guess(['r','b','r','b']).should == ['p','p','m','m']
  end

  it "1 positional matches and 0 non-positional matches should return ['p']" do
    @m.guess(['r','r','r','r']).should == ['p']
  end
  

end
