# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Wookie::Translator do
  before do
    @english = 'enter your text here!'
    @wookie  = 'wowhaoworc rooohurc aowokao acworcwo!'
  end

  it "should load the default dialect, if not otherwise specified" do
    t = Wookie::Translator.new
    t.to_wookie(@english).should eq(@wookie)
    t.from_wookie(@wookie).should eq(@english)
  end

  it "should translate with the simple default dialect (hash form)" do
    t = Wookie::Translator.new :dialect => Wookie::Dialect::Simple
    t.to_wookie(@english).should eq(@wookie)
    t.from_wookie(@wookie).should eq(@english)
  end

  it "should raise a NotImplementedError if using an incomplete dialect" do
    t = Wookie::Translator.new :dialect => Wookie::Dialect::Base
    expect {
      t.to_wookie(@english).should eq(@wookie)
    }.to raise_error(NotImplementedError)
    expect {
      t.from_wookie(@wookie).should eq(@english)
    }.to raise_error(NotImplementedError)
  end
end