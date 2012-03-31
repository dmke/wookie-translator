# -*- encoding: utf-8 -*-
require 'spec_helper'

class IdentityDialect < Wookie::Dialect::Base
  def to_wookie(str); str; end
  def from_wookie(str); str; end
end

describe Wookie::Translator do
  before do
    @t       = Wookie::Translator.new(:dialect => IdentityDialect)
    @english = 'enter your text here!'
    @wookie  = 'wowhaoworc rooohurc aowokao acworcwo!'
  end

  it "translates english to english" do
    @t.to_wookie(@english).should eq(@english)
  end

  it "translates wookie to wookie" do
    @t.from_wookie(@wookie).should eq(@wookie)
  end
end