# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Wookie::Dialect::Simple do
  before do
    @dialect = Wookie::Dialect::Simple.new
    @english = 'enter your text here!'
    @wookie  = 'wowhaoworc rooohurc aowokao acworcwo!'
  end

  it "should have a distinct set of short codes" do
    Wookie::Dialect::Simple::SHORT_CODES.should eq("ck")
  end

  it "translates to wookie" do
    @dialect.to_wookie(@english).should eq(@wookie)
  end

  it "translates back to english" do
    @dialect.from_wookie(@wookie).should eq(@english)
  end
end