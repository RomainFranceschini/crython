require "./spec_helper"

describe Crython do
  it "loads" do
    Crython.init
    Crython.initialized?.should be_true
    Crython.finalize
    Crython.initialized?.should be_false
  end
end
