require "spec_helper"
require "hcloud"

describe Hcloud::Client do

  before :each do
    Thread.current[:hcloud_token] = nil
  end

  it "assigns a klass method that returns a token" do
    Hcloud::Client.configure token: "test123"
    expect(Hcloud::Client.token).to eql "test123"

    Hcloud::Client.configure token: "1"
    expect(Hcloud::Client.token).to eql "1"
  end

  it "safely assigns different values on different threads" do

    t0 = Thread.new do
      Hcloud::Client.configure token: "0"
      expect(Hcloud::Client.token).to eql "0"
    end

    expect { Hcloud::Client.token }.to raise_error(ArgumentError)

    t1 = Thread.new do
      Hcloud::Client.configure token: "1"
      expect(Hcloud::Client.token).to eql "1"
    end

    t0.join
    t1.join

  end

end
